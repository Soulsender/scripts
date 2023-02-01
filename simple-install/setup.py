#!/usr/bin/python3

import os

# init variables for home and user
user = os.getlogin()
home_dir = "/home/" + user.replace("'", "")
print(home_dir)

# update the system packages
os.system("sudo apt update -y")

# interate through package list
package_list = open("packages.txt", "r")
for package in package_list:
    os.system('sudo apt install -y ' + package)

# install oh-my-zsh
os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

os.system('type -p curl >/dev/null || sudo apt install curl -y')
os.system('curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y')
