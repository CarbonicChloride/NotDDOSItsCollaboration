$intervalSeconds = 10000

Write-Host "Starting automation loop (running every $intervalSeconds seconds)..." -ForegroundColor Green
Write-Host "Press Ctrl+C at any time to stop." -ForegroundColor Yellow

while ($true) {
    # Generate a large random number (40 digits)
    $firstDigit = Get-Random -Minimum 1 -Maximum 10
    $remainingDigits = -join ((1..39) | ForEach-Object { Get-Random -Minimum 0 -Maximum 10 })
    $randomNumber = "$firstDigit$remainingDigits"
    $fileName = "$randomNumber.txt"

    # Create the file
    "echo $randomNumber" | Out-File -FilePath $fileName -Encoding utf8
    Write-Host "Created file: $fileName" -ForegroundColor Cyan

    # Stage, commit, and push
    git add $fileName
    git commit -m "Add $fileName"
    git push

    Write-Host "Waiting $intervalSeconds seconds (approx. 2.8 hours) until next run..." -ForegroundColor DarkGray
    Start-Sleep -Seconds $intervalSeconds
}
