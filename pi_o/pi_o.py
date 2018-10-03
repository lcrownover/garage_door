def execute():
    with open('trf', 'r') as f:
        for line in f.readlines():
            print(line.rstrip())

    error = False
    if error == False:
        return 0
    else:
        return 'Error: couldnt do something' 

if __name__ == "__main__":
    execute()
