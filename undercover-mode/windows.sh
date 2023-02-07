# Set to windows
gsettings set org.cinnamon.theme name 'Windows-10-Dark-3.2.1-dark'
gsettings set org.cinnamon panels-enabled "['1:0:bottom']" 
gsettings set org.cinnamon.desktop.interface icon-theme 'Windows-10-master'
gsettings set org.cinnamon.desktop.wm.preferences theme 'Windows-10-Dark-3.2.1-dark'
gsettings set org.cinnamon.desktop.interface gtk-theme "Windows-10-Dark-3.2.1-dark"
sed -i 's/favicon_dark.svg/windows10logo.png/g' /home/soul/.config/cinnamon/spices/menu@cinnamon.org/0.json
sed -i 's/"value": "Soul"/"value": ""/g' /home/soul/.config/cinnamon/spices/menu@cinnamon.org/0.json