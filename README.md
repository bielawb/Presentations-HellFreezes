# PowerShell Conference Europe - Hell Freezing over.
In this repository you will find all files I've used during my presentation @PSConfEU
I've used demo-magic for bash Start-Demo equivalent.
Source: https://github.com/paxtonhare/demo-magic

For PowerCLI demo I've used actual Start-Demo script (modified a bit to match Linux [char]10 for Enter).
Source: http://poshcode.org/6399

```
Set-Location Linux
Install-Package powershell
while ($true) {
    Start-GeekingOut

}
```
