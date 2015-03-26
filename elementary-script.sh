# Clear the Terminal
clear

# Zenity
GUI=$(zenity --list --checklist \
	--height 300 \
	--width 600 \
	--title="elementary-script" \
	--text "Pick one or multiple actions to execute." \
	--column=Picks \
	--column=Actions \
	--column=Description \
	FALSE "Update System" "Updates the package lists, the system packages and Applications."  \
	FALSE "Install Proprietary Drivers" "Installs the proprietary drivers."  \
	FALSE "Speed-Up Memory" "Installs preload and zram-config." \
	FALSE "Install Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	FALSE "Install Extra Multimedia Codecs" "Installs extra multimedia codecs." \
	FALSE "Install Support for Encrypted DVD's" "Installs support for playing encrypted DVD's." \
	FALSE "Install Support for Archive Formats" "Installs support for archive formats." \
	FALSE "Install GDebi" "Installs GDebi. A simple tool to install deb files." \
	FALSE "Install Google Chrome" "Installs Google Chrome. A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier." \
	FALSE "Install Chromium" "Installs Chromium. An open-source browser project that aims to build a safer, faster, and more stable way for all Internet users to experience the web." \
	FALSE "Install Firefox" "Installs Firefox. A free and open-source web browser." \
	FALSE "Install VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	FALSE "Install Transmission" "Installs the Transmission BitTorrent client." \
	FALSE "Install Sublime Text 3" "Installs Sublime Text 3. A sophisticated text editor for code, markup and prose." \
	FALSE "Install LibreOffice" "Installs LibreOffice. A powerful office suite." \
	FALSE "Fix Broken Packages" "Fixes the broken packages." \
	FALSE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	--separator=', ');

# Update System Action
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Updating system..."
	sudo apt-get -y -qq update
	sudo apt-get -y -qq upgrade
fi

# Install Proprietary Drivers Action
if [[ $GUI == *"Install Proprietary Drivers"* ]]
then
	clear
	echo "Installing Proprietary Drivers..."
	sudo jockey-gtk
fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory"* ]]
then
	clear
	echo "Speeding-up Memory..."
	sudo apt-get -y -qq install preload
	sudo apt-get -y -qq install zram-config
fi

# Install Ubuntu Restricted Extras Action
if [[ $GUI == *"Install Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Installing Ubuntu Restricted Extras..."
	sudo apt-get -y -qq install ubuntu-restricted-extras
fi

# Install Extra Multimedia Codecs Action
if [[ $GUI == *"Install Extra Multimedia Codecs"* ]]
then
	clear
	echo "Installing Extra Multimedia Codecs..."
	sudo apt-get -y -qq install libavcodec-extra-53
fi

# Install Support for Encrypted DVD's Action
if [[ $GUI == *"Install Support for Encrypted DVD's"* ]]
then
	clear
	echo "Installing Support for Encrypted DVD's..."
	sudo apt-get -y -qq install libdvdread4
	sudo /usr/share/doc/libdvdread4/install-css.sh
fi

# Install Support for Archive Formats Action
if [[ $GUI == *"Install Support for Archive Formats"* ]]
then
	clear
	echo "Installing Support for Archive Formats"
	sudo apt-get -y -qq install zip unzip p7zip p7zip-rar rar unrar
fi

# Install GDebi Action
if [[ $GUI == *"Install GDebi"* ]]
then
	clear
	echo "Installing GDebi..."
	sudo apt-get -y -qq install gdebi
fi

# Install Google Chrome Action
if [[ $GUI == *"Install Google Chrome"* ]]
then
	clear
	echo "Installing Google Chrome..."
	if [[ $(uname -m) == "i686" ]]
	then
		wget -q -O /tmp/google-chrome-stable_current_i386.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -q -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
	fi
fi

# Install Chromium
if [[ $GUI == *"Install Chromium"* ]]
then
	clear
	echo "Installing Chromium..."
	sudo apt-get -y -qq install chromium-browser
fi

# Install Firefox Action
if [[ $GUI == *"Install Firefox"* ]]
then
	clear
	echo "Installing Firefox..."
	sudo apt-get -y -qq install firefox
fi

# Install VLC Action
if [[ $GUI == *"Install VLC"* ]]
then
	clear
	echo "Installing VLC..."
	sudo apt-get -y -qq install vlc
fi

# Install Transmission Action
if [[ $GUI == *"Install Transmission"* ]]
then
	clear
	echo "Installing Transmission..."
	sudo apt-get -y -qq install transmission
fi

# Install Sublime Text 3 Action
if [[ $GUI == *"Install Sublime Text 3"* ]]
then
	clear
	echo "Installing Sublime Text 3..."
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 > /dev/null 2>&1
	sudo apt-get -y -qq update
	sudo apt-get -y -qq install sublime-text-installer 
fi

# Install LibreOffice Action
if [[ $GUI == *"Install LibreOffice"* ]]
then
	clear
	echo "Installing LibreOffice..."
	sudo apt-get -y -qq install libreoffice 
fi

# Fix Broken Packages Action
if [[ $GUI == *"Fix Broken Packages"* ]]
then
	clear
	echo "Fixing the broken packages..."
	sudo apt-get -y -qq -f install
fi

# Clean-Up Junk Action
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Cleaning-up junk..."
	sudo apt-get -y -qq autoremove
	sudo apt-get -y -qq autoclean
fi

# Notification
clear
notify-send -i utilities-terminal elementary-script "All tasks ran successfully!"