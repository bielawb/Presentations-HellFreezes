# Basics
    $xpath = "//service[port[@port < 1024 and @protocol = 'tcp']]"
    Select-Xml -Path /usr/lib/firewalld/services/*.xml -XPath $xpath |
        ForEach-Object { $_.Node } |
        Select-Object -Property short -ExpandProperty port

    Get-LinuxUser -Name 
    Get-Command -Name Get-LinuxUser |
        ForEach-Object ScriptBlock

    Get-Help -Name Get-LinuxUser

    $wpApiUri = 'https://public-api.wordpress.com/rest/v1.1/sites'
    $page = 'powershellpl.net'
    Invoke-RestMethod $wpApiUri/$page/posts?tag=powershell-i-linux |
        ForEach-Object { $_.posts } |
        Format-Table Title, Short_URL, Excerpt -Wrap
# PowerShell Gallery
    # Find-Module -Name PsIni
    Import-Module -Name PsIni
    Get-Command -Module PsIni
    Get-IniContent -FilePath /etc/yum.repos.d/vscode.repo |
        Format-Custom
    @{
        code = [ordered]@{
            name = 'Visual Studio Code'
            baseurl = 'https://packages.microsoft.com/yumrepos/vscode'
            enalbed = 1
            gpgcheck = 1
            gpgkey = 'https://packages.microsoft.com/keys/microsoft.asc'
        }
    } | Out-IniFile -FilePath ~/test.repo
    cat ~/test.repo

# Cloud
    Import-Module AzureRM.Profile.NetCore.Preview
    # Login-AzureRmAccount
    $VerbosePreference = 'si'
    Select-AzureRmProfile -Path /home/bielawb/AzureRm.json
    Get-AzureRmResource
    Import-Module -Name AWSPowerShell.NetCore
    Get-Command -Module AWSPowerShell.NetCore | Measure-Object