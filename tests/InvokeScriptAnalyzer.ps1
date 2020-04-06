Param( $path = '')

if ($null -eq (Get-InstalledModule -Name "PSScriptAnalyzer" -ErrorAction SilentlyContinue)) {
    Write-Output "Install PSScriptAnalyzer moduel..."
    Install-Module -Name PSScriptAnalyzer -Repository PSGallery -Force -Verbose
}

Import-Module -Name PSScriptAnalyzer -Force

Invoke-ScriptAnalyzer -Path "$($path)" -Severity Information 

$analyzerErrors = Invoke-ScriptAnalyzer -Path "$($path)" -Severity Error

if ($analyzerErrors.Count -gt 0) {
    exit 1
}