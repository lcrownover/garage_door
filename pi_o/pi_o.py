import subprocess

def execute():
    p = subprocess.Popen(["/bin/bash", '/opt/garage_door/trigger.sh'])
    p.wait()
    return p.returncode


if __name__ == "__main__":
    execute()
