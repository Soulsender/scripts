# simple-tools

**WARNING:** Only setup.sh should be run manually. Other scripts will be ran automatically off setup.sh.

This script is built for Ubuntu, but should work on other Debian-based distros. 

### **Description**
This repo contains a bash script that will install and configure tools such as: 

 - Pycharm (snap)
 - VSCode
 - Microsoft teams (snap)
 - Discord
 - WireGuard
 - Macchanger
 - Proxychains

It will also find the best canadian-based mirror and configure it to your system using python pip (should you want to not do this, select N when prompted).
If you wish to configure the best mirror to your country, just change CA with your country (ex. US, UK) in [setup.sh](https://github.com/Soulsender/simple-tools/blob/main/setup.sh).

### **Usage**
To use this script, clone via [git](https://www.tutorialspoint.com/how-to-install-git-on-linux) 
```
git clone https://github.com/Soulsender/simple-tools
```
cd into the folder

```
cd simple-tools
```
to execute:
```
sudo chmod +x setup.sh
./setup.sh
```
and answer the given prompts

### **Help**
On install of KDE Plasma on ubuntu, sometimes the virtual keyboard will stay on the login screen. Use [this thread for](https://askubuntu.com/questions/1278431/how-to-get-rid-of-the-virtual-keyboard-that-appears-in-login-screen-on-kde-plasm) this issue.

### **Disclaimer**

 *I do not take any responsibility should this script damage your system. Use at your own risk. You should know roughly what a superuser script is doing on your computer. I am just an idiot that has fun with linux :).*