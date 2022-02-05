# Create a script that can show passwords stored in macOS Keychain.
# Usage: WifiPasswd.sh
# version: 1.0

# ascii art
echo "

  ▄ ▄   ▄█ ▄████  ▄█ █ ▄▄  ██      ▄▄▄▄▄    ▄▄▄▄▄    ▄ ▄   ██▄     ▄▀   ▄  █ ████▄    ▄▄▄▄▄      ▄▄▄▄▀ 
 █   █  ██ █▀   ▀ ██ █   █ █ █    █     ▀▄ █     ▀▄ █   █  █  █  ▄▀    █   █ █   █   █     ▀▄ ▀▀▀ █    
█ ▄   █ ██ █▀▀    ██ █▀▀▀  █▄▄█ ▄  ▀▀▀▀▄ ▄  ▀▀▀▀▄  █ ▄   █ █   █ █ ▀▄  ██▀▀█ █   █ ▄  ▀▀▀▀▄       █    
█  █  █ ▐█ █      ▐█ █     █  █  ▀▄▄▄▄▀   ▀▄▄▄▄▀   █  █  █ █  █  █   █ █   █ ▀████  ▀▄▄▄▄▀       █     
 █ █ █   ▐  █      ▐  █       █                     █ █ █  ███▀   ███     █                     ▀      
  ▀ ▀        ▀         ▀     █                       ▀ ▀                 ▀                             
                            ▀                                                                          

"



# Welcome Message & help 
echo "Welcome to WifiPasswd.sh"
echo "This script will show you all your Wifi passwords stored in macOS Keychain."
echo "Username & passwords are required for choice 1"
echo "Usage: WifiPasswd.sh"

# root
sudo -v

# check if mac
if [ "$(uname)" != "Darwin" ]; then
    echo "This script is only for macOS."
    exit 1
fi

# Create a txt file in the ~/Documents folder called "WifiPasswd.txt" to store the passwords
cd ~/Documents
touch WifiPasswd.txt
echo "Wifi Passwords" > WifiPasswd.txt
echo "----------------" >> WifiPasswd.txt
echo "Wifi Log File created in ~/Documents/WifiPasswd.txt"

# ask if they either want to check internet status, specific SSID password, SSID portor quit
echo "What would you like to do?"
echo "1. Check internet status"
echo "2. Show password for specific SSID"
echo "3. Show port for specific SSID (if any)"
echo "4. Show all network connections (SSID & port)"
echo "5. Run ping test"
read -p "Enter your choice: " choice

# if they choose 1, check internet status
if [ $choice -eq 1 ]; then
    echo "Checking internet status..."
    speedtest-cli --simple --bytes
    echo "Done"
    exit 0
fi

# if they choose 2, show password for specific SSID
if [ $choice -eq 2 ]; then
    echo "Enter the SSID you want to check:"
    read -p "SSID: " ssid
    echo "Checking password for $ssid..."
    security find-generic-password -ga $ssid | grep "password: " >> ~/Documents/WifiPasswd.txt
    echo "Done"
    exit 0
fi

# if they choose 3, show port for specific SSID
if [ $choice -eq 3 ]; then
    echo "Enter the SSID you want to check:"
    read -p "SSID: " ssid
    echo "Checking port for $ssid..."
    security find-generic-password -ga $ssid -w
    echo "Done"
    exit 0
fi

# if they choose 4, show all network connections
if [ $choice -eq 4 ]; then
    echo "Checking all network connections..."
    networksetup -listallhardwareports
    echo "Checking all network Service..."
    networksetup -listallnetworkservices
    echo "Checking all network ports..."
    lsof -nP +c 15 | grep LISTEN
    echo "Done"
    exit 0
fi

# if they choose 5, run ping test
if [ $choice -eq 5 ]; then
    echo "Enter the IP address you want to ping:"
    read -p "IP: " ip
    echo "Running ping test..."
    ping -c 4 $ip
    echo "Done"
    exit 0
fi

# if ctrl+c, exit
if [ $choice -eq 0 ]; then
    echo "Exiting..."
    exit 0
fi
