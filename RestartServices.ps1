Write-Host "#################################" -ForegroundColor Cyan
Write-Host "       Stoping  services         " -ForegroundColor Cyan
Write-Host "#################################" -ForegroundColor Cyan

$ServiceList = @("win32time","WinRM")

foreach ($Service in $ServiceList) {
    $srv = Get-Service -Name $Service
    while ($srv.Status -ne 'Stopped')
    {
        Stop-Service $Service
        write-host $srv.status
        sleep 5
        $srv.Refresh()
        if ($srv.Status -eq 'Stopped')
        {
         Write-Host $Service ' is Stopped'
        }
    }
}

Write-Host "#################################" -ForegroundColor Cyan
Write-Host "        Start  services          " -ForegroundColor Cyan
Write-Host "#################################" -ForegroundColor Cyan

$ServiceList1 = @("win32time","WinRM")

foreach ($Service in $ServiceList1) {
    $srv = Get-Service -Name $Service
  while ($srv.Status -ne 'Running')
  {
    Start-Service $Service
    write-host $srv.status
    sleep 5
    $srv.Refresh()
    if ($srv.Status -eq 'Running')
    {
      Write-Host $Service 'is Running'
    }
  }
}
