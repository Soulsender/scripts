#!/usr/bin/python3

import os
from platform import platform

# init variables for home and user
user = os.getlogin()
home_dir = "/home/" + user.replace("'", "")
os_release = "/etc/os-release"

# change to home directory for install
os.chdir(home_dir)

# set configs
def clone_configs():
    # zshrc
    os.system("wget https://github.com/Soulsender/config/raw/master/zshrc")
    os.system("mv -f .zshrc .zshrc.backup")
    os.system("mv -f zshrc .zshrc")
    # neofetch config
    os.system("wget https://github.com/Soulsender/config/raw/master/neofetch-art.txt")
    os.system("mv -f neofetch-art.txt .config")

# install github CLI
def install_gh():
    os.system('type -p curl >/dev/null || sudo apt install curl -y')
    os.system('curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y')

# install autocpu-freq utility
def install_autocpufreq():
    os.system("git clone https://github.com/AdnanHodzic/auto-cpufreq.git")
    os.chdir("auto-cpufreq")
    os.system("sudo ./auto-cpufreq-installer")
    os.chdir(home_dir)
    os.system("sudo auto-cpufreq --install")

# update the system packages
os.system("sudo apt update -y")

# get OS name
with open(os_release) as file:
    if "Kali GNU/Linux Rolling" in file.read():
        print("System detected as Kali Linux")
        os.system("sudo apt install feroxbuster")
    else:
        print("OS Not recognized, defaulting to standard Debian Installer.")

try:
    # interate through package list
    package_list = open("packages.txt", "r")
    for package in package_list:
        os.system(f'sudo apt install -y {package}')
except:
    print("There was a problem updating the package manager.")

# install oh-my-zsh
try:
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
except:
    print("There was a problem installing oh-my-zsh, continuing.")

# install github cli
try:
    install_gh()
    os.system("gh auth login")
    try:
        clone_configs()
    except:
        print("Unable to clone configs, you probably aren't authenticated.")
except:
    print("There was a problem installing github CLI.")

# install autocpu-freq
try:
    install_autocpufreq()
except:
    print("There was a problem installing autocpu-freq")



