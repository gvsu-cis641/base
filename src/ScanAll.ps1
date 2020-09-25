#*********************************************************************************
#
#  Scan All
#
#*********************************************************************************

#Run this script from the parent directory of a set of repositories
param([string]$scriptDir ="")
$results = @()

if ($scriptDir -eq "") {
    #Script Directory if local
    $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
}
    
foreach ($i in Get-ChildItem) {
    Set-Location $i.FullName
    Write-Output $i.FullName
    try {
        & "$scriptDir\StaticCodeAnalysis.ps1"
        $results += "Success,$i"
        Write-Output "$i Build Succeeded"
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        $results += "Failed,$i,$errorMessage"
        Write-Output "$i Build Failed"
        $ErrorMessage
    }
    Set-Location ../..
}

Write-Output $results