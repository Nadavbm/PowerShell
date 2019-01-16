# Execute sql files remotely
#
# Username and Password to connect to DB
$dbUser = "userName"
$dbPass = "Pa$$word"

# .sql files will be stored here
$dir = "E:\Path\To\SQL\Queries"

# Create array from list of files
$arr = @(Get-ChildItem -Path $dir -Filter *.sql -Recurse -File -Name)

Write-Host "#################################" -ForegroundColor Cyan
Write-Host "        List SQL Files           " -ForegroundColor Cyan
Write-Host "#################################" -ForegroundColor Cyan
echo $arr

sleep 10

# SQL Instance
$serverInstance = "10.10.10.10\Instance"

Write-Host "#################################" -ForegroundColor Cyan
Write-Host "       Execute SQL Files         " -ForegroundColor Cyan
Write-Host "#################################" -ForegroundColor Cyan

# Running the loop to execute each query from remote
foreach ($file in $arr) {
  Invoke-Sqlcmd -ServerInstance $serverInstance -InputFile $dir\$file -User "$dbUser" -Password "$dbPass"
}
