import os
from discord_webhook import DiscordWebhook, DiscordEmbed
from time import sleep

# you can install it with "sudo apt install lm-sensors"
# you will also need the "discord_webhook package"

# this gets the temperature data from the "sensors" apt package
temp = os.popen("sensors | grep \"Package id\" | awk '{print $4}'").read()
temp = temp.replace("+", "").replace("°", "").replace("C", "")
temp = float(temp)

webhook_url = '<your_discord_webhook_here>'

# 85C
if temp > 85.0:
    # webhook is optional
    webhook = DiscordWebhook(url=webhook_url)
    embed = DiscordEmbed(title='**High Temperatures Detected**', description="__**Automatic Minecraft Server Shutdown @ 100°C**__ \n\n **Current Temp: **" + str(temp) + "°C \n Live overview at <server_homepage>", color='E6E600')
    webhook.add_embed(embed)
    response = webhook.execute()

# 100C
if temp > 100.0:
    # webhook is optional
    webhook = DiscordWebhook(url=webhook_url)
    embed = DiscordEmbed(title='**VERY HIGH TEMPERATURE**', description="⚠️ __**MINECRAFT SERVER SHUTDOWN INITIATED**__ ⚠️ \n\n **Current Temp: **" + str(temp) + "°C \n Live overview at <server_homepage> \n Total System Shutdown @ 107°C", color='Ff6b00')
    webhook.add_embed(embed)
    response = webhook.execute()

    # take remediation steps here
    os.system('docker exec -i minecraft rcon-cli tell @a WARNING: HIGH TEMPERATURES DETECTED, SERVER SHUTDOWN IMINENT')
    sleep(30)
    os.system('docker container stop minecraft')
    os.system('docker container kill minecraft')
    sleep(500)
    os.system('docker container start minecraft')

# 107C
if temp > 107.0:
    # webhook is optional
    webhook = DiscordWebhook(url=webhook_url)
    embed = DiscordEmbed(title='🚨 **__CRITICAL TEMPERATURE__** 🚨', description="**Current Temp: **" + str(temp) + "°C \n **IF YOU ARE SEEING THIS THEN IM FUCKED**", color='ff0000')
    webhook.add_embed(embed)
    response = webhook.execute()

    # take emergency remediation steps here
    os.system("shutdown now")






