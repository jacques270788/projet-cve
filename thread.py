from threading import Thread
import schedule
import subprocess


# to do: correct subprocess.run

def update():
    print("Updating CVE database...")
    subprocess.run("run.sh", shell=True)


def task():
    print("Beginning the installation of the CVEs...")
    subprocess.run("install.sh", shell=True)
    print("Installation completed!")
    while True:
        schedule.every().day.at("01:00").do(update)

thread = Thread(target=task, daemon=True)
thread.start()

answer = input('Press ENTER to stop the process.\n')
