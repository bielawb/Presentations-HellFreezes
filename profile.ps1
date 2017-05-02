function Get-LinuxUser {
    <#
        .Synopsis
        Get information about the selected user(s) on current machine.
    #>
    param (
        # Name of the user. Wildcards are supported.
        [SupportsWildcards()]
        [String]$Name = '*'
    )
    Import-Csv -Delimiter : -LiteralPath /etc/passwd -Header User, Pass, UID, GID, Name, Home, Shell |
        Where-Object User -like $Name
}

Register-ArgumentCompleter -CommandName Get-LinuxUser -ParameterName Name -ScriptBlock {
    param ($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    cut -d: -f1 /etc/passwd | sort | ForEach-Object {
        if ($_ -like "$wordToComplete*") {
            New-Object System.Management.Automation.CompletionResult -ArgumentList @(
                $_
                $_
                'ParameterValue'
                "User $_"
            )
        }
    }
}

function Get-AgendaItem {
    param (
        [String]$Pattern = '.',
        [DateTime]$After = $(Get-Date),
        [switch]$Cached
    )
    $data = if ($Cached) {
        Get-Content -LiteralPath /home/bielawb/agenda.json -Raw -Encoding UTF8
    } else {
        $ProgressPreference = 'SilentlyContinue'
        (Invoke-WebRequest -UseBasicParsing -Uri powershell.love).Content.SubString(1)
    }
    
    ($data | ConvertFrom-Json).where{
        $_.Description -match $Pattern -and
        $After -lt $_.StartTime
    } | Sort-Object -Property { [datetime]$_.StartTime }
}
