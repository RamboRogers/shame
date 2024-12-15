# PowerShell script to install SHAME
$ErrorActionPreference = "Stop"

Write-Host "Installing SHAME..." -ForegroundColor Blue

# Create temp directory
$tempDir = Join-Path $env:TEMP "shame_install"
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

# Download URL
$downloadUrl = "https://raw.githubusercontent.com/RamboRogers/shame/master/shame.zip"
$zipPath = Join-Path $tempDir "shame.zip"

try {
    # Download the zip file
    Write-Host "Downloading SHAME..." -ForegroundColor Blue
    Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

    # Extract the zip
    Write-Host "Extracting files..." -ForegroundColor Blue
    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

    # Find the exe
    $exePath = Get-ChildItem -Path $tempDir -Filter "shame-v-windows-amd64.exe" -Recurse | Select-Object -First 1

    # Create destination directory in user's profile
    $installDir = "$env:USERPROFILE\.shame"
    New-Item -ItemType Directory -Force -Path $installDir | Out-Null

    # Copy the exe
    Write-Host "Installing SHAME to $installDir..." -ForegroundColor Blue
    Copy-Item -Path $exePath.FullName -Destination "$installDir\shame.exe" -Force

    # Add to PATH if not already there
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($userPath -notlike "*$installDir*") {
        Write-Host "Adding SHAME to PATH..." -ForegroundColor Blue
        [Environment]::SetEnvironmentVariable(
            "Path",
            "$userPath;$installDir",
            "User"
        )
    }

    Write-Host "SHAME installed successfully!" -ForegroundColor Green
    Write-Host "Please restart your terminal, then run 'shame' to start sharing files." -ForegroundColor Blue
}
catch {
    Write-Host "Error installing SHAME: $_" -ForegroundColor Red
    exit 1
}
finally {
    # Cleanup
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}