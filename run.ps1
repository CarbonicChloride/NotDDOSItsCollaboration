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
