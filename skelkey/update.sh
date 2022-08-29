#!/bin/bash

# get PID of bot in variable and kill it
BOT_PID=`pgrep python3`
kill $BOT_PID

# update bot
cd /home/soul/Earth-Invader
git pull

# re-launch bot
python3 /home/soul/Earth-Invader/main.py &

