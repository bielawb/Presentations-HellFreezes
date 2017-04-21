Import-Module -Name posh-git
function Set-ZoomLevel {
    param (
        [Int]$Level = 0,
        [ValidateSet(
            'Workspace',
            'User'
        )]
        [String]$Scope = 'Workspace',
        [ValidateSet(
            'Merge',
            'Overwrite'
        )]
        [String]$Mode = 'Merge'
    )
    $configPath = switch ($Scope) {
        Workspace {
            "$($psEditor.Workspace.Path)/.vscode/settings.json"
        }
        User {
            $configFolder = Split-Path -LiteralPath $env:VSCODE_IPC_HOOK
            "$configFolder/User/settings.json"
        }
    }
    $currentConfig = if ($Mode -eq 'Merge' -and (Test-Path -LiteralPath $configPath)) {
        Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
    } else {
        [PSCustomObject]@{}
    }

    $currentConfig | Add-Member -Force -NotePropertyMembers @{
        'window.zoomLevel' = $Level
    }

    $currentConfig | ConvertTo-Json -Depth 10 | 
        Set-Content -LiteralPath $configPath -Encoding Ascii
}