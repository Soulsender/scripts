# temperature-monitoring

A simple script that can run as a cronjob, and will perform specified steps at certain temperatures.

Yeah I know it could be better.

## Instructions
1. Create a python virtual environment
```
python -m venv /home/youruser/scripts
```
You will need to have the "virtualenv" python package installed.

2. Install the requirements.txt **INSIDE** the venv and not your system interpreter.

3. Make sure the cron user can use `docker` and `shutdown` without sudo. You can do this with `visudo` and adding the line:
```
# all users can shutdown and use docker
ALL     ALL=NOPASSWD: /usr/sbin/shutdown
ALL     ALL=NOPASSWD: /usr/bin/docker
```

4. Create a cronjob with `crontab -e` and your cronjob:
```
* * * * * /home/youruser/scripts/venv/bin/python3 /home/youruser/scripts/temp_checker.py
```
And that's it!

**Make sure to use a venv otherwise it will not work.**