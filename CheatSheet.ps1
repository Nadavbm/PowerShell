#
# Cmdlet are the commands in PS based on .Net
# The structure is Action-Object or Verb-Noun:
Get-Help
Get-Help Get-Service # Will give you examples for syntax
Get-Process -Name "someProcess" # Add parameter to Cmdlet
Get-Command –Module NetTCPIP –Name *IP*
Get-Process | Get-Member
Get-Process | Where-Object {$_.Name –eq “iexplore”}
# Create variables:
$var = "string"
$a,$b = 0 or $a,$b = 'a','b' # Assign multiple variables
$service = @(Get-Service -Name "serviceName") # Cmdlet output assigned to variable

# Create arrays:
$arr = "str1", "str2" # String array
$arr = @()
$arr[3] # Fourth array element
$arr = @(Get-ChildItem -Path $dir -Directory -Name) # Assign cmdlet output to an array

# Create function:
function helloWorld
{
write-host "hello world" -ForegroundColor Red
}
# Call the function
helloWorld

# Function with parameters:
function addNumber {
  Param([int]$a,[int]$b)
  $c = $a + $b
  Write-Output $c
}
addNumber -a 1 -b 2 # This should give you 3

# Assignment, Logical, Comparison Operators:
=,+=,-=,++,-- Assign values to variable
-and,-or,-not,! Connect expressions / statements
-eq, -ne Equal, not equal
-gt, -ge Greater than, greater than or equal
-lt, -le Less than, less than or equal
-replace “Hi” # -replace “H”, “P”
-match, -notmatch Regular expression match
-like, -notlike Wildcard matching
-contains,-notcontains Check if value in array
-in, -notin Reverse of contains,notcontains.

# Statements:
$x = 32
if ($x -ge 32) {
  Write-Host("x is Greater than or equal to 32")
} else {
  Write-Host("x is less than 32")
}

# elseif in statement:
$winRM = @(Get-Service -Name WinRM)
$time = @(Get-Service -Name W32Time)

if ($winRM.Status -ne 'Stopped') {
  Start-Service -name WinRM
}elseif ($time.Status -ne 'Stopped'){
  Start-Service -name W32Time
}else{
  Write-Host("All services are up")
}
  

If(){} Elseif(){ } Else{ }

# Loops:
while(){}
For($i=0; $i -lt 10; $i++){}
Foreach($file in dir C:\){$file.name}
