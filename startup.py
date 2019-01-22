import os
import subprocess

# Create a basic project
if not os.path.isfile("/usr/src/app/manage.py"):
    os.chdir("/usr/src/app")
    subprocess.call("django-admin startproject core .", shell=True)

# Run the server
subprocess.call("python /usr/src/app/manage.py runserver 0.0.0.0:8000", shell=True)

