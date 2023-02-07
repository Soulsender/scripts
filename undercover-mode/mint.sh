# Set to windows
gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Red'
gsettings set org.cinnamon panels-enabled "['1:0:top']" 
gsettings set org.cinnamon.desktop.interface icon-theme 'BeautyLine'
gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y-Dark-Red'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Red'
gsettings set org.cinnamon.desktop.background picture-uri "file:///usr/share/wallpapers/forest-fox-wallpaper.png"
sed -i 's/windows10logo.png/favicon_dark.svg/g' /home/soul/.config/cinnamon/spices/menu@cinnamon.org/0.json
sed -i 's/"value": ""/"value": "Soul"/g' /home/soul/.config/cinnamon/spices/menu@cinnamon.org/0.json