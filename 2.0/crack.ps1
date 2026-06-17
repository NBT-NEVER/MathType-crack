# MathType Crack Tool

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$configFile = Join-Path $scriptDir "config.ps1"

if (-not (Test-Path $configFile)) {
    Write-Host "Error: config.ps1 not found!" -ForegroundColor Red
    Write-Host "Please run setup.bat first." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

. $configFile

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  MathType Crack Tool" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Close MathType
Write-Host "Step 1: Closing MathType..." -ForegroundColor Yellow
$processes = Get-Process -Name $processName -ErrorAction SilentlyContinue
if ($processes) {
    $processes | ForEach-Object {
        Write-Host "  Stopped: $($_.Name)" -ForegroundColor Cyan
        Stop-Process -Id $_.Id -Force
    }
}
Start-Sleep -Milliseconds 500

# 2. Open Registry Editor
Write-Host "`nStep 2: Opening Registry Editor..." -ForegroundColor Yellow
Start-Process "regedit.exe"
Start-Sleep -Milliseconds 500

# 3. Delete Registry Key
Write-Host "`nStep 3: Deleting registry key..." -ForegroundColor Yellow
$check = & reg query $registryBase 2>&1
if ($LASTEXITCODE -eq 0 -and $check -match [regex]::Escape($registryKey)) {
    Write-Host "  Deleting $registryKey..." -ForegroundColor Cyan
    & reg delete $registryBase /v $registryKey /f | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Deleted!" -ForegroundColor Green
    } else {
        Write-Host "  Failed!" -ForegroundColor Red
    }
} else {
    Write-Host "  Key not found (may already deleted)" -ForegroundColor Yellow
}

# 4. Restart MathType
Write-Host "`nStep 4: Restarting MathType..." -ForegroundColor Yellow
if (Test-Path $mathtypePath) {
    Start-Process $mathtypePath
    Write-Host "  Started!" -ForegroundColor Green
} else {
    Write-Host "  File not found, please start manually" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Done!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Check Registry Editor: $registryBase" -ForegroundColor Yellow
Write-Host "Confirm '$registryKey' is deleted" -ForegroundColor Yellow
Write-Host ""

Read-Host "Press Enter to exit"
