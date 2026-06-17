# MathType Crack Tool - Configuration Script

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MathType Crack - Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configFile = Join-Path $scriptDir "config.ps1"

Write-Host "Enter MathType executable path:" -ForegroundColor Yellow
Write-Host "  Example: C:\Program Files\MathType\MathType.exe" -ForegroundColor Gray
$mathtypePath = Read-Host "  Path"
if ($mathtypePath -eq "") {
    $mathtypePath = "C:\Program Files\MathType\MathType.exe"
}

$configContent = @"
# MathType Crack Configuration

`$mathtypePath = "$mathtypePath"
`$registryBase = "HKCU\Software\Install Options"
`$registryKey = "Options6.9"
`$processName = "MathType"
"@

$configContent | Out-File -FilePath $configFile -Encoding UTF8

Write-Host ""
Write-Host "Config saved! Run crack.bat to use." -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter to exit"
