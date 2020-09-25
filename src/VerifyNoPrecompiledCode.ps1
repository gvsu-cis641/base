#*********************************************************************************
#
#  Verify No Compiled Code 
#
#*********************************************************************************
#Compiled file types
[string[]]$Excludes = @('*packages*', '*node_modules*', '*dist*', '*coverage*', '*\bin', '*\bin\*', '*\obj\*')

$fileTypes = "*.dll", "*.exe", "*.min.js", "*.min.css"

#Find compiled files
Write-Host "Checking for pre-compiled code, excluding:"
Write-Host $Excludes

$compiledFiles = Get-ChildItem -Include $fileTypes -Recurse -Exclude $Excludes | % { 
    $allowed = $true
    foreach ($exclude in $Excludes) { 
        if ((Split-Path $_.FullName -Parent) -ilike $exclude) { 
            $allowed = $false
            break
        }
    }
    if ($allowed) {
        $_
    }
} 

#Results
$compiledCount = $compiledFiles.count
if ($compiledCount -gt 0) {
    #List files
    Write-Host ($compiledFiles.FullName | Out-String)
    Write-Error "Please remove the $compiledCount pre-compiled files listed above (*.dll, *.exe, *.min.js, *.min.css)."
}
else {
    Write-Host "No pre-compiled code found"    
}
Write-Output $compiledCount