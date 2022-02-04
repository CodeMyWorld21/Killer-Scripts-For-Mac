# Script that automatically checks, runs, and cleans the mac firewall log
# Default Firewall Log Location: /var/log/appfirewall.log
# Default Log Location: /var/log/mflm.log
# I am unable to get the script to work on my mac, because i have no firewall

# Welcome Message logo
echo "

███╗   ███╗██╗   ██╗███████╗██╗██████╗ ███████╗██╗    ██╗ █████╗ ██╗     ██╗     ██╗      ██████╗  ██████╗ 
████╗ ████║╚██╗ ██╔╝██╔════╝██║██╔══██╗██╔════╝██║    ██║██╔══██╗██║     ██║     ██║     ██╔═══██╗██╔════╝ 
██╔████╔██║ ╚████╔╝ █████╗  ██║██████╔╝█████╗  ██║ █╗ ██║███████║██║     ██║     ██║     ██║   ██║██║  ███╗
██║╚██╔╝██║  ╚██╔╝  ██╔══╝  ██║██╔══██╗██╔══╝  ██║███╗██║██╔══██║██║     ██║     ██║     ██║   ██║██║   ██║
██║ ╚═╝ ██║   ██║   ██║     ██║██║  ██║███████╗╚███╔███╔╝██║  ██║███████╗███████╗███████╗╚██████╔╝╚██████╔╝
╚═╝     ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ 
                                                                                                           
"

# warning message
echo "I am not responsible for any damage done to your system."
echo "Please read the README.md file before using this script."
echo "This script is provided as is, and is not guaranteed to work."

# root check
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Ask the user if they want to check, run, or clean the log
echo "What would you like to do?"
echo "1. Check the log"
echo "2. Run the log"
echo "3. Clean the log"
echo "4. Exit"
read -p "Enter your choice: " choice

# if the user chooses to check the log
if [ $choice -eq 1 ]; then
    # check the log
    echo "Checking the log..."
    # check the log location
    if [ -f /var/log/appfirewall.log ]; then
        # if the log location exists, check the log
        cat /var/log/appfirewall.log
    else
        # if the log location does not exist, tell the user
        echo "The log location does not exist."
    fi
    # ask the user if they want to exit
    echo "Would you like to exit?"
    echo "1. Yes"
    echo "2. No"
    read -p "Enter your choice: " exit
    # if the user chooses to exit
    if [ $exit -eq 1 ]; then
        # exit the script
        exit
    fi
fi

# if the user chooses to run the log
if [ $choice -eq 2 ]; then
    # run the log
    echo "Running the log..."
    # check the log location
    if [ -f /var/log/appfirewall.log ]; then
        # if the log location exists, run the log
        tail -f /var/log/appfirewall.log
    else
        # if the log location does not exist, tell the user
        echo "The log location does not exist."
    fi
    # ask the user if they want to exit
    echo "Would you like to exit?"
    echo "1. Yes"
    echo "2. No"
    read -p "Enter your choice: " exit
    # if the user chooses to exit
    if [ $exit -eq 1 ]; then
        # exit the script
        exit
    fi
fi

# if the user chooses to clean the log
if [ $choice -eq 3 ]; then
    # clean the log
    echo "Cleaning the log..."
    rm -rf /var/log/appfirewall.log
    # check the log location
    if [ -f /var/log/appfirewall.log ]; then
        # if the log location exists, clean the log
        vim /var/log/appfirewall.log
        echo "press ctrl+a to select all and clean the log or"
        echo "let the script delete the log"
    else
        # if the log location does not exist, tell the user
        echo "The log location does not exist."
    fi
    # ask the user if they want to exit
    echo "Would you like to exit?"
    echo "1. Yes"
    echo "2. No"
    read -p "Enter your choice: " exit
    # if the user chooses to exit
    if [ $exit -eq 1 ]; then
        # exit the script
        exit
    fi
fi

# if the user chooses to exit
if [ $choice -eq 4 ]; then
    # exit the script
    exit
fi

# if the user chooses an invalid option
if [ $choice -eq 0 ]; then
    # exit the script
    exit
fi

# if ctrl+c is pressed, exit the script
trap ctrl_c INT