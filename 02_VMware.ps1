# Connection
    $root = Get-Credential -UserName root
    Connect-VIServer -Server esxi.monad.net -Credential $root
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore
# Reading data
    Get-VMHost
    Get-VMHostDisk 
    Get-VirtualSwitch
    Get-VM
    Get-View -ViewType VirtualMachine -Filter @{ Name = 'F' }
# ... and more
    Get-VM Foo | Set-VM -VMSwapFilePolicy InHostDatastore -Confirm:$false
    Get-VirtualSwitch -Name Test | Set-VirtualSwitch -NumPorts 100 -WhatIf
    Disconnect-VIServer -Server esxi.monad.net -Confirm:$false
    