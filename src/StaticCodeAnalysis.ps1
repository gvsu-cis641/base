#*********************************************************************************
#
#  Static Code Analysis
#
#*********************************************************************************

#Run this script from the root of an API/Nuget/JS repository
param([string]$scriptDir = "", [string]$enforceNoCompiledFiles = $false)

#Instantiate Stopwatch class
$stopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$buildTimer = 0

$buildResult = @{} 
$buildResult.success = $false
$buildResult.resultMessage = "No Errors"
if ($scriptDir -eq "") {
    #Script Directory if local
    $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
}

try {
    #Run static code analysis
    $ScaCommand = "$scriptDir\VerifyNoPreCompiledCode.ps1"
    Write-Host $ScaCommand
    $staticCodeAnalysisResults = Invoke-Expression $ScaCommand

    $buildResult.compiledFilesFound = $staticCodeAnalysisResults
    if ($LASTEXITCODE) {
        throw "Build artifact failed"
    }

    $buildResult.success = $true
}
catch {
    $errorMessage = $_.Exception.Message
    $buildResult.resultMessage = $errorMessage
}

#Stop timer
$buildTimer = [math]::round($stopWatch.Elapsed.TotalMinutes, 2)
Write-Host "Build time: $buildTimer minutes"
$buildResult.buildDuration = $buildTimer
$buildResult.dateTime = Get-Date -Format "yyyyMMddhhmm"

Write-Host ($buildResult | Out-String)

Write-Host "Success = "$buildResult.success
if ($buildResult.success -eq $false) {
    Throw "Build Failed - $ErrorMessage"
}
