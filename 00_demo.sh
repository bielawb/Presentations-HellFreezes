#!/bin/bash
. ~/PSConfEU/demo-magic/demo-magic.sh
DEMO_PROMPT="${GREEN}➜ ${CYAN}[\t] ${RED}😈  > "
TYPE_SPEED=50
clear
cd ~
p "${GREEN}# Make sure you have repo configured"
pe 'cat /etc/yum.repos.d/microsoft.repo'
p "${GREEN}# When repo is configured correctly, we should be able to use yum..."
pe 'yum whatprovides powershell'
p "${GREEN}# We can also install/update powershell using yum"
pe 'yum install powershell'
p "${GREEN}# As expected... we need to be root/su to do that!"
pe 'sudo yum install powershell'
p "${GREEN}# No ISE for Linux - but hey, we have vs code!"
pe 'cat /etc/yum.repos.d/vscode.repo'
pe 'yum whatprovides code'
pe 'sudo yum install code'
p "${GREEN}# OK, I was cheating a bit... ;)"
p "${GREEN}# We also need powershell extensions - watch out for breaking changes though!"
opera https://github.com/PowerShell/vscode-powershell/releases/tag/v0.12.2
p "${GREEN}# Not ready to install alpha 18 - we will do that later..."
p "${GREEN}# Thus we need to use 0.12.1"
pe 'code --list-extensions --show-versions | grep PowerShell'
p "${GREEN}# We have what we need... demo time! "
code ~/PSConfEU
