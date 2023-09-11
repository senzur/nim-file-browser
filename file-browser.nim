import os, sequtils

var
    currentDir = getCurrentDir()
    parentDir:string
    parent:string

const info = "up = go to parent folder \ncheck = echo dir you are in \nnavi = open folder in current dir \ncd = open path\nhelp = echo this \nexit = exit "

echo currentDir

proc FilesIn(path:string) =
    var filesInPath = toSeq(walkDir(path, relative=true))
    echo filesInPath
        

proc GetParent(dirRn:string) =
    if currentDir == "C:" :
        echo "no parent folder found"
        echo "youre in : ",currentDir
    else :
        var parentDir = dirRn.parentDir
        parent = parentDir


proc GoTo() =
    echo "enter folder to open ; enter \"back\" to go back"
    var desire = readLine(stdin)
    var path:string = currentDir & "\\" & desire
    var checkDesirePath = dirExists(path)
    if checkDesirePath == true :  
        echo path
        FilesIn(path)
        currentDir = path
    if checkDesirePath == false :
        echo path," does not exist !"
        echo info
    
proc GoUp(dirRn:string) = 
    GetParent(dirRn)
    echo parent
    FilesIn(parent)
    currentDir = parent

proc Cd() =
    echo "enter path"
    var desire = readLine(stdin)
    var check = dirExists(desire)
    if check == true :
        FilesIn(desire)
        currentDir = desire
    if check == false :
        echo desire," : does not exist !"

echo info

while true :
    var stdInput:string = readLine(stdin)
    if stdInput == "up" :
        GoUp(currentDir)
    elif stdInput == "navi" :
        GoTo()
    elif stdInput == "cd" :
        Cd()
    elif stdInput == "check" :
        echo currentDir
    elif stdInput == "help":
        echo info
    elif stdInput == "exit":
        break
    else :
        echo stdInput," : is not a valid command ! \n enter \"help\" if youre lost."
