def execute():
    print('hello world')
    with open('IT_WORKED', 'w+') as f:
        f.write('YAS QUEEN\n')
    error = False
    if error == False:
        return 0
    else:
        return 'Error: couldnt do something' 

if __name__ == "__main__":
    execute()
