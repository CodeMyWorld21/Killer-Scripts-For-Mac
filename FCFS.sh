
# bash script to download UFW firewall and configure automatically
# Firewall Configuration file: /etc/ufw/before.rules Mac: 

# create welcoming logo
echo "

███╗   ███╗██╗   ██╗███████╗██╗██████╗ ███████╗██╗    ██╗ █████╗ ██╗     ██╗     
████╗ ████║╚██╗ ██╔╝██╔════╝██║██╔══██╗██╔════╝██║    ██║██╔══██╗██║     ██║     
██╔████╔██║ ╚████╔╝ █████╗  ██║██████╔╝█████╗  ██║ █╗ ██║███████║██║     ██║     
██║╚██╔╝██║  ╚██╔╝  ██╔══╝  ██║██╔══██╗██╔══╝  ██║███╗██║██╔══██║██║     ██║     
██║ ╚═╝ ██║   ██║   ██║     ██║██║  ██║███████╗╚███╔███╔╝██║  ██║███████╗███████╗
╚═╝     ╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝
                                                                                 

"

# warning message for user
echo "This script will install UFW and configure it to allow choosen ports and protocols."
echo "Please make sure that you have enough space on your hard drive."
echo "I am not responsible for any damage caused by this script."

# ask the user if they want to install UFW
echo "Do you want to install UFW? (y/n)"
read answer

# if yes, install UFW
if [ "$answer" = "y" ]; then
    sudo apt-get install ufw
fi

# if no, show warning message
echo "Please install UFW manually."
echo "If you want to install UFW, please type 'sudo apt-get install ufw'"

# continue message
echo "------------------------Continue------------------------"

echo "Do you want to configure UFW? (y/n)"
read answer

# If yes, configure UFW
if [ "$answer" = "y" ]; then
    # ask the user for the ports
    echo "Please enter the ports you want to allow separated by a space."
    echo "Example: 80 443"
    read ports
    # ask the user for the protocols
    echo "Please enter the protocols you want to allow separated by a space."
    echo "Example: tcp udp"
    read protocols
    # configure UFW
    ufw allow $ports $protocols
fi

# if no, show warning message and continue
echo "Please configure UFW manually."
echo "If you want to configure UFW, please type 'ufw allow <ports> <protocols>'"

# Ending messasge
echo "------------------------End------------------------"
echo "Thank you for using this script."

# End of script
exit 0

# if ctrl+c is pressed, show warning message and exit
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

