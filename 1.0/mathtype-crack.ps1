# MathType Crack Script
# Function: Close Mathtype, remove registry limit, restart Mathtype

$mathTypeProcesses = @("MathType", "MathType_Win32", "MathType_Win64")

# 1. Close Mathtype
Write-Host "Closing Mathtype..." -ForegroundColor Yellow
foreach ($proc in $mathTypeProcesses) {
    $processes = Get-Process -Name $proc -ErrorAction SilentlyContinue
    if ($processes) {
        $processes | ForEach-Object {
            Write-Host "  Stopping: $($_.Name) (PID: $($_.Id))" -ForegroundColor Cyan
            Stop-Process -Id $_.Id -Force
        }
    }
}
Start-Sleep -Seconds 1

# 2. Open Registry Editor
Write-Host "`nOpening Registry Editor..." -ForegroundColor Yellow
Start-Process "regedit.exe"
Start-Sleep -Seconds 1

# 3. Delete Registry Key
Write-Host "`nDeleting registry key..." -ForegroundColor Yellow

# Check if key exists first
$check = & reg query "HKCU\Software\Install Options" /s 2>&1
if ($check -match "Options6.9") {
    Write-Host "  Found Options6.9, deleting..." -ForegroundColor Cyan
    $result = & reg delete "HKCU\Software\Install Options" /v "Options6.9" /f 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Successfully deleted!" -ForegroundColor Green
    } else {
        Write-Host "  Delete failed: $result" -ForegroundColor Red
    }
} else {
    Write-Host "  Options6.9 not found (already deleted?)" -ForegroundColor Yellow
}

# 4. Restart Mathtype
Write-Host "`nRestarting Mathtype..." -ForegroundColor Yellow
$mathtypePaths = @(
    "C:\D VOLUME\APP\STUDY_PIRATED\mathtype\MathType.exe",
    "${env:ProgramFiles}\MathType\MathType.exe",
    "${env:ProgramFiles(x86)}\MathType\MathType.exe"
)

$started = $false
foreach ($path in $mathtypePaths) {
    if (Test-Path $path) {
        Write-Host "  Launching: $path" -ForegroundColor Cyan
        Start-Process $path
        $started = $true
        break
    }
}

if (-not $started) {
    Write-Host "  Mathtype not found, please launch manually" -ForegroundColor Red
}

Write-Host "`n============================================" -ForegroundColor Green
Write-Host "Done!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "In Registry Editor, navigate to:" -ForegroundColor Yellow
Write-Host "  HKEY_CURRENT_USER -> Software -> Install Options" -ForegroundColor White
Write-Host "  Options6.9 should be deleted" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"
