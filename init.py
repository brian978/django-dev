import os
import subprocess

if not os.path.isfile("/usr/src/app/manage.py"):
    os.chdir("/usr/src/app")
    subprocess.call("django-admin startproject core .", shell=True)

