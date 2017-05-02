# Issue
    Start-Process opera https://github.com/PowerShell/PowerShell/issues/3416
    $uri = 'https://api.github.com/repos/PowerShell/PowerShell/issues'
    Invoke-RestMethod -Uri $uri | ForEach-Object { $_ } |
        Format-Table -Property Title, Number, Created_At

# Fixed!
    Get-Process -Name code | Select-Object -ExpandProperty 
    sudo yum -y update powershell
# Pull-requests
    Start-Process opera https://github.com/PowerShell/PowerShell/pull/2014
    (Invoke-RestMethod -Uri $uri/2038) | Format-List Title, Body
# Fixed version
    Join-Path /etc yum.repos.d vscode.repo | Get-ChildItem
# More sessions...?
    Get-AgendaItem -Pattern Linux |
        Format-Table -Property SpeakerList, StartTime, Room, Title, Audience