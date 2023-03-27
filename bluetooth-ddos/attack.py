import os

os.system("hcitool scan")

target = input("Enter target MAC: ")

os.system(f"sudo l2ping -s 10 -f {target}")