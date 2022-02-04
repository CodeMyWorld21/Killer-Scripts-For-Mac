# Automatically Delete Firefox Startup Cache on mac
# Startup Cache Location: Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/startupCache/


# Welcome logo and warnings
echo "

  █████▒██▓ ██▀███  ▓█████   █████▒▒█████  ▒██   ██▒     ██████  ▄████▄   ██ ▄█▀ ██▓ ██▓     ██▓    ▓█████  ██▀███  
▓██   ▒▓██▒▓██ ▒ ██▒▓█   ▀ ▓██   ▒▒██▒  ██▒▒▒ █ █ ▒░   ▒██    ▒ ▒██▀ ▀█   ██▄█▒ ▓██▒▓██▒    ▓██▒    ▓█   ▀ ▓██ ▒ ██▒
▒████ ░▒██▒▓██ ░▄█ ▒▒███   ▒████ ░▒██░  ██▒░░  █   ░   ░ ▓██▄   ▒▓█    ▄ ▓███▄░ ▒██▒▒██░    ▒██░    ▒███   ▓██ ░▄█ ▒
░▓█▒  ░░██░▒██▀▀█▄  ▒▓█  ▄ ░▓█▒  ░▒██   ██░ ░ █ █ ▒      ▒   ██▒▒▓▓▄ ▄██▒▓██ █▄ ░██░▒██░    ▒██░    ▒▓█  ▄ ▒██▀▀█▄  
░▒█░   ░██░░██▓ ▒██▒░▒████▒░▒█░   ░ ████▓▒░▒██▒ ▒██▒   ▒██████▒▒▒ ▓███▀ ░▒██▒ █▄░██░░██████▒░██████▒░▒████▒░██▓ ▒██▒
 ▒ ░   ░▓  ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒ ░   ░ ▒░▒░▒░ ▒▒ ░ ░▓ ░   ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░░ ▒░▓  ░░░ ▒░ ░░ ▒▓ ░▒▓░
 ░      ▒ ░  ░▒ ░ ▒░ ░ ░  ░ ░       ░ ▒ ▒░ ░░   ░▒ ░   ░ ░▒  ░ ░  ░  ▒   ░ ░▒ ▒░ ▒ ░░ ░ ▒  ░░ ░ ▒  ░ ░ ░  ░  ░▒ ░ ▒░
 ░ ░    ▒ ░  ░░   ░    ░    ░ ░   ░ ░ ░ ▒   ░    ░     ░  ░  ░  ░        ░ ░░ ░  ▒ ░  ░ ░     ░ ░      ░     ░░   ░ 
        ░     ░        ░  ░           ░ ░   ░    ░           ░  ░ ░      ░  ░    ░      ░  ░    ░  ░   ░  ░   ░     
                                                                ░                                                   

"

# create warning message
echo "Welcome to my script to automatically delete Firefox startup cache. I am not responsible for any damage done to your computer."
echo "This script will delete all files in the startup cache folder." 

# ask for sudo privileges
sudo -v

# ask the user if they want to check the startup cache folder size, check the startup cache folder contents, delete the startup cache folder, or quit the script
echo "Do you want to check the startup cache folder size, check the startup cache folder contents, delete the startup cache folder, or quit the script?"
echo "Type 'size' to check the startup cache folder size, 'contents' to check the startup cache folder contents, 'delete' to delete the startup cache folder, or 'quit' to quit the script."
read answer

# if the user types 'size', check the startup cache folder size
if [ $answer = "size" ]; then
    echo "The startup cache folder size is:"
    du -sh /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/startupCache/
    echo "Do you want to check the startup cache folder size again, check the startup cache folder contents, delete the startup cache folder, or quit the script?"
    read answer
fi

# if the user types 'contents', check the startup cache folder contents
if [ $answer = "contents" ]; then
    echo "The startup cache folder contents are:"
    ls /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/startupCache/
    echo "Do you want to check the startup cache folder size again, check the startup cache folder contents, delete the startup cache folder, or quit the script?"
    read answer
fi

# if the user types 'delete', delete the startup cache folder
if [ $answer = "delete" ]; then
    echo "Deleting the startup cache folder..."
    rm -rf /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/startupCache/ 
    echo "Do you want to check the startup cache folder size again, check the startup cache folder contents, delete the startup cache folder, or quit the script?"
    read answer
fi

# if the user types 'quit', quit the script
if [ $answer = "quit" ]; then
    echo "Quitting the script..."
    exit
fi

# if the startupcache folder does not exist, notify the user
if [ ! -d /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/startupCache/ ]; then
    echo "The startup cache folder does not exist."
    echo "Do you want to check the startup cache folder size again, check the startup cache folder contents, delete the startup cache folder, or quit the script?"
    read answer
fi

# if ctrl+c is pressed, quit the script
trap ctrl_c INT
