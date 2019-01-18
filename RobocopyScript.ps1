# Source directory
$source = "D:\Source"

# Destination directory
$destination = "D:\Destination"

# Create array from list of files
$arr = @(Get-ChildItem -Path $source -Directory -Name)

foreach ($file in $arr) {
  robocopy $source/$file $destination/ /MIR /TEE
}
