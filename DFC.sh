# Automatically delete firefox cache if full.
# Firefox Cache Location: /Users/username/Library/Caches/Firefox/Profiles/ngov24pu.default-release/cache2/entries

# Create a logo for the script
echo "

  █████▒██▓ ██▀███  ▓█████   █████▒▒█████  ▒██   ██▒    ▄████▄   ██ ▄█▀ ██▓ ██▓     ██▓    ▓█████  ██▀███  
▓██   ▒▓██▒▓██ ▒ ██▒▓█   ▀ ▓██   ▒▒██▒  ██▒▒▒ █ █ ▒░   ▒██▀ ▀█   ██▄█▒ ▓██▒▓██▒    ▓██▒    ▓█   ▀ ▓██ ▒ ██▒
▒████ ░▒██▒▓██ ░▄█ ▒▒███   ▒████ ░▒██░  ██▒░░  █   ░   ▒▓█    ▄ ▓███▄░ ▒██▒▒██░    ▒██░    ▒███   ▓██ ░▄█ ▒
░▓█▒  ░░██░▒██▀▀█▄  ▒▓█  ▄ ░▓█▒  ░▒██   ██░ ░ █ █ ▒    ▒▓▓▄ ▄██▒▓██ █▄ ░██░▒██░    ▒██░    ▒▓█  ▄ ▒██▀▀█▄  
░▒█░   ░██░░██▓ ▒██▒░▒████▒░▒█░   ░ ████▓▒░▒██▒ ▒██▒   ▒ ▓███▀ ░▒██▒ █▄░██░░██████▒░██████▒░▒████▒░██▓ ▒██▒
 ▒ ░   ░▓  ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒ ░   ░ ▒░▒░▒░ ▒▒ ░ ░▓ ░   ░ ░▒ ▒  ░▒ ▒▒ ▓▒░▓  ░ ▒░▓  ░░ ▒░▓  ░░░ ▒░ ░░ ▒▓ ░▒▓░
 ░      ▒ ░  ░▒ ░ ▒░ ░ ░  ░ ░       ░ ▒ ▒░ ░░   ░▒ ░     ░  ▒   ░ ░▒ ▒░ ▒ ░░ ░ ▒  ░░ ░ ▒  ░ ░ ░  ░  ░▒ ░ ▒░
 ░ ░    ▒ ░  ░░   ░    ░    ░ ░   ░ ░ ░ ▒   ░    ░     ░        ░ ░░ ░  ▒ ░  ░ ░     ░ ░      ░     ░░   ░ 
        ░     ░        ░  ░           ░ ░   ░    ░     ░ ░      ░  ░    ░      ░  ░    ░  ░   ░  ░   ░     
                                                       ░                                                   

"

# welcome the user
echo "Welcome to the Firefox Cache Cleaner, I am not responsible for any damage done to your system."

# set sudo privileges
sudo -v

# Check if Firefox is running
if [ -z "$(ps -A | grep firefox)" ]; then
    echo "Firefox is not running."
    exit 1
fi

# ask the user if they want to check the cache size, contents, or delete the cache, or quit
echo "Do you want to check the cache size, contents, or clear the cache?"
echo "1. Check Cache Size"
echo "2. Check Cache Contents"
echo "3. Clear Cache"
echo "4. Quit"
read -p "Enter your choice: " choice

echo "------------------------------------------------------------------------------"    

# if the user chooses to check the cache size, then check the size of the cache
if [ $choice = 1 ]; then
    echo "Checking the cache size..."
    echo "------------------------------------------------------------------------------"
    echo "The cache size is: "
    du -sh /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/cache2/entries
    echo "------------------------------------------------------------------------------"
    echo "Done."
    echo "------------------------------------------------------------------------------"
    echo "Press any key to continue..."
    read -n 1 -s
    echo "------------------------------------------------------------------------------"
fi

# if the user chooses to check the cache contents, then check the contents of the cache
if [ $choice = 2 ]; then
    echo "Checking the cache contents..."
    echo "------------------------------------------------------------------------------"
    echo "The cache contents are: "
    ls -l /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/cache2/entries
    echo "------------------------------------------------------------------------------"
    echo "Done."
    echo "------------------------------------------------------------------------------"
    echo "Press any key to continue..."
    read -n 1 -s
    echo "------------------------------------------------------------------------------"
fi


# if the user chooses to clear the cache, then clear the cache
if [ $choice = 3 ]; then
    echo "Clearing the cache..."
       rm -rf /Users/ramonetbarrera/Library/Caches/Firefox/Profiles/ngov24pu.default-release/cache2/entries
    echo "------------------------------------------------------------------------------"
    echo "The cache has been cleared."
    echo "------------------------------------------------------------------------------"
    echo "Done."
    echo "------------------------------------------------------------------------------"
    echo "Press any key to continue..."
    read -n 1 -s
    echo "------------------------------------------------------------------------------"
fi

# if the user chooses to quit, then exit the script
if [ $choice = 4 ]; then
    echo "Exiting..."
    echo "visit our github page for more killer scripts and tutorials, ITS FREE..."
    exit 1
fi

