#!/bin/bash

# Clear the Terminal
clear

# Zenity
GUI=$(zenity --list --checklist \
	--height 500 \
	--width 900 \
	--title="elementary-script" \
	--text "Pick one or multiple Actions to execute." \
	--column=Picks \
	--column=Actions \
	--column=Description \
	TRUE "Update System" "Updates the package lists, the system packages and Applications."  \
	TRUE "Enable PPAs" "Another extra layer of security and another level of annoyance. You cannot add PPA by default in Loki." \
	FALSE "Install Elementary Tweaks" "Installing themes in elementary OS is a much easier task thanks to elementary Tweaks tool." \
    TRUE "Install Elementary Full Icon Theme" "Installs Elementary Full Icon Theme. A mega pack of icons for elementary OS." \
    FALSE "Add Oibaf Repository" "This repository contain updated and optimized open graphics drivers." \
	FALSE "Install Gufw Firewall" "Gufw is an easy and intuitive way to manage your linux firewall." \
	FALSE "Speed-Up Memory" "Installs preload and enables zRAM." \
	FALSE "Install Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	FALSE "Install Extra Multimedia Codecs" "Installs extra multimedia codecs." \
	FALSE "Install Support for Encrypted DVD's" "Installs support for playing encrypted DVD's." \
	FALSE "Install Support for Archive Formats" "Installs support for archive formats." \
	FALSE "Install GDebi" "Installs GDebi. A simple tool to install deb files." \
	FALSE "Install Google Chrome" "Installs Google Chrome. A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier." \
	FALSE "Install Chromium" "Installs Chromium. An open-source browser project that aims to build a safer, faster, and more stable way for all Internet users to experience the web." \
	FALSE "Install Firefox" "Installs Firefox. A free and open-source web browser." \
	FALSE "Install Skype" "Video chat, make international calls, instant message and more with Skype." \
	FALSE "Install Dropbox" "Installs Dropbox with wingpanel support. Dropbox is a free service that lets you bring your photos, docs, and videos anywhere and share them easily." \
	FALSE "Install Liferea" "Installs Liferea. a web feed reader/news aggregator that brings together all of the content from your favorite subscriptions into a simple interface that makes it easy to organize and browse feeds. Its GUI is similar to a desktop mail/newsclient, with an embedded graphical browser." \
	FALSE "Install VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	FALSE "Install Clementine Music Player" "Installs Clementine. One of the Best Music Players and library organizer on Linux." \
	FALSE "Install Gimp" "GIMP is an advanced picture editor. You can use it to edit, enhance, and retouch photos and scans, create drawings, and make your own images." \
	FALSE "Install Deluge" "Deluge is a lightweight, Free Software, cross-platform BitTorrent client." \
	FALSE "Install Transmission" "Installs the Transmission BitTorrent client." \
	FALSE "Install Atom" "Installs Atom. A hackable text editor for the 21st Century." \
	FALSE "Install Sublime Text 3" "Installs Sublime Text 3. A sophisticated text editor for code, markup and prose." \
	FALSE "Install LibreOffice" "Installs LibreOffice. A powerful office suite." \
	FALSE "Install WPS Office" "Installs WPS Office. The most compatible free office suite." \
	FALSE "Install TLP" "Install TLP to save battery and prevent overheating." \
	FALSE "Install Redshift" "Use night shift to save your eyes." \
	FALSE "Install Disk Utility" "Gnome Disk Utility is a tool to manage disk drives and media." \
	FALSE "Fix Broken Packages" "Fixes the broken packages." \
	FALSE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	FALSE "Enable Plank magnifying effect" "Enabling OSX-style zoom in Plank" \
	--separator=', ');

# Update System Action
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Updating system..."
	echo ""
	sudo apt -y update
	sudo apt -y full-upgrade
fi

# Enable PPAs
if [[ $GUI == *"Enable PPAs"* ]]
then
	clear
	echo "Enabling PPAs..."
	echo ""
	sudo apt -y install software-properties-common
fi

# Install Elementary Tweaks Action
if [[ $GUI == *"Install Elementary Tweaks"* ]]
then
	clear
	echo "Installing Elementary Tweaks..."
	echo ""
	sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
	sudo apt update
	sudo apt -y install elementary-tweaks
fi

# Install  Elementary Full Icon Theme
if [[ $GUI == *"Install Elementary Full Icon Theme"* ]]
then
	clear
	echo "Installing Elementary Full Icon Theme..."
	echo ""
	sudo apt -y install git
	git clone https://github.com/btd1337/elementary-full-icon-theme
	sudo mv elementary-full-icon-theme /usr/share/icons/
	gsettings set org.gnome.desktop.interface icon-theme "elementary-full-icon-theme"
fi

# Add Oibaf Repository
if [[ $GUI == *"Add Oibaf Repository"* ]]
then
	clear
	echo "Adding Oibaf Repository and updating..."
	echo ""
	sudo add-apt-repository -y ppa:oibaf/graphics-drivers
	sudo apt update
	sudo apt -y full-upgrade
fi

# Install Gufw Firewall Action
if [[ $GUI == *"Install Gufw Firewall"* ]]
then
	clear
	echo "Installing Gufw Firewall..."
	echo ""
	sudo apt -y install gufw
fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory"* ]]
then
	clear
	echo "Speeding-up Memory..."
	echo ""
	sudo apt -y install preload
	sudo apt -y install zram-config
fi

# Install Ubuntu Restricted Extras Action
if [[ $GUI == *"Install Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Installing Ubuntu Restricted Extras..."
	echo ""
	sudo apt -y install ubuntu-restricted-extras
fi

# Install Extra Multimedia Codecs Action
if [[ $GUI == *"Install Extra Multimedia Codecs"* ]]
then
	clear
	echo "Installing Extra Multimedia Codecs..."
	echo ""
	sudo apt -y install libavcodec-extra-53
fi

# Install Support for Encrypted DVD's Action
if [[ $GUI == *"Install Support for Encrypted DVD's"* ]]
then
	clear
	echo "Installing Support for Encrypted DVD's..."
	echo ""
	sudo apt -y install libdvdread4
	sudo /usr/share/doc/libdvdread4/install-css.sh
fi

# Install Support for Archive Formats Action
if [[ $GUI == *"Install Support for Archive Formats"* ]]
then
	clear
	echo "Installing Support for Archive Formats"
	echo ""
	sudo apt -y install zip unzip p7zip p7zip-rar rar unrar
fi

# Install GDebi Action
if [[ $GUI == *"Install GDebi"* ]]
then
	clear
	echo "Installing GDebi..."
	echo ""
	sudo apt -y install gdebi
fi

# Install Google Chrome Action
if [[ $GUI == *"Install Google Chrome"* ]]
then
	clear
	echo "Installing Google Chrome..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -O /tmp/google-chrome-stable_current_i386.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
	fi
fi

# Install Chromium
if [[ $GUI == *"Install Chromium"* ]]
then
	clear
	echo "Installing Chromium..."
	echo ""
	sudo apt -y install chromium-browser
fi

# Install Firefox Action
if [[ $GUI == *"Install Firefox"* ]]
then
	clear
	echo "Installing Firefox..."
	echo ""
	sudo apt -y install firefox
fi

# Install Skype Action
if [[ $GUI == *"Install Skype"* ]]
then
	clear
	echo "Installing Skype..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -O /tmp/skype.deb https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/skype.deb https://go.skype.com/skypeforlinux-64-alpha.deb
	fi
	sudo dpkg -i /tmp/skype.deb
	sudo apt -f install
fi

# Install Dropbox Action
if [[ $GUI == *"Install Dropbox"* ]]
then
	clear
	echo "Installing Drobox..."
	echo ""
	sudo apt -y install git
	sudo apt --purge remove -y dropbox*
	sudo apt -y install python-gpgme	
	git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
	sudo bash /tmp/elementary-dropbox/install.sh
fi

# Install Liferea Action
if [[ $GUI == *"Install Liferea"* ]]
then
	clear
	echo "Installing Liferea..."
	echo ""
	sudo apt -y install liferea
fi

# Install VLC Action
if [[ $GUI == *"Install VLC"* ]]
then
	clear
	echo "Installing VLC..."
	echo ""
	sudo apt -y install vlc
fi

# Install Clementine Action
if [[ $GUI == *"Install Clementine Music Player"* ]]
then
	clear
	echo "Installing Clementine Music Player..."
	echo ""
	sudo apt -y install clementine
fi

# Install Gimp Action
if [[ $GUI == *"Install Gimp"* ]]
then
	clear
	echo "Installing Gimp Image Editor..."
	echo ""
	sudo apt -y install gimp
fi

# Install Deluge Action
if [[ $GUI == *"Install Deluge"* ]]
then
	clear
	echo "Installing Deluge..."
	echo ""
	sudo apt -y install deluge
fi

# Install Transmission Action
if [[ $GUI == *"Install Transmission"* ]]
then
	clear
	echo "Installing Transmission..."
	echo ""
	sudo apt -y install transmission
fi

# Install Atom Action
if [[ $GUI == *"Install Atom"* ]]
then
	clear
	echo "Installing Atom..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/atom
	sudo apt -y update
	sudo apt -y install atom
fi

# Install Sublime Text 3 Action
if [[ $GUI == *"Install Sublime Text 3"* ]]
then
	clear
	echo "Installing Sublime Text 3..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
	sudo apt -y update
	sudo apt -y install sublime-text-installer
fi

# Install LibreOffice Action
if [[ $GUI == *"Install LibreOffice"* ]]
then
	clear
	echo "Installing LibreOffice..."
	echo ""
	sudo apt -y install libreoffice
fi

# Install WPS Office
if [[ $GUI == *"Install WPS Office"* ]]
then
	clear
	echo "Installing WPS Office..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -O /tmp/wps-office_10.1.0.5672~a21_i386.deb http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_i386.deb
		sudo dpkg -i /tmp/wps-office_10.1.0.5672~a21_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/wps-office_10.1.0.5672~a21_amd64.deb http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb
		sudo dpkg -i /tmp/wps-office_10.1.0.5672~a21_amd64.deb
	fi
	#Fonts, Interface Translate, Dictionary
	wget -O /tmp/wps-office-fonts_1.0_all.deb http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb
	wget -O /tmp/wps-office-ul_10.1.0.5503-0kaiana05052016_all.deb http://repo.uniaolivre.com/packages/xenial/wps-office-ul_10.1.0.5503-0kaiana05052016_all.deb
	wget -O /tmp/wps-office-language-all_0.1_all.deb https://doc-0k-5g-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/vmsics07sveefmft458910ml3prvahpt/1480881600000/05316569172087402966/*/0B7HGeEB4kyvMaU5SbkdRRjBYWHc?e=download
	sudo dpkg -i /tmp/wps-office-fonts_1.0_all.deb
	sudo dpkg -i /tmp/wps-office-ul_10.1.0.5503-0kaiana05052016_all.deb
	sudo dpkg -i /tmp/wps-office-language-all_0.1_all.deb
fi

# Install TLP
if [[ $GUI == *"Install TLP"* ]]
then
	clear
	echo "Installing TLP..."
	echo ""
	sudo apt -y install tlp tlp-rdw
fi

# Install Redshift Action
if [[ $GUI == *"Install Redshift"* ]]
then
	clear
	echo "Installing Redshift..."
	echo ""
	sudo apt -y install redshift-gtk
fi

# Install Gnome Disk Utility Action
if [[ $GUI == *"Install Disk Utility"* ]]
then
	clear
	echo "Installing Gnome Disk Utility..."
	echo ""
	sudo apt -y install gnome-disk-utility
fi

# Fix Broken Packages Action
if [[ $GUI == *"Fix Broken Packages"* ]]
then
	clear
	echo "Fixing the broken packages..."
	echo ""
	sudo apt -y -f install
fi

# Clean-Up Junk Action
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Cleaning-up junk..."
	echo ""
	sudo apt -y autoremove
	sudo apt -y autoclean
fi

# Install Enable Plank magnifying effect
if [[ $GUI == *"Enable Plank magnifying effect"* ]]
then
	clear
	echo "Enabling Plank magnifying effect..."
	echo ""
	sudo apt --purge remove -y plank
	sudo add-apt-repository -y ppa:ricotz/docky
	sudo apt update
	sudo apt -y install plank
fi

# Notification
clear
notify-send -i utilities-terminal elementary-script "All tasks ran successfully!"
