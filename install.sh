# Run as root to install on Ubuntu/Debian-based distros.
# Some components of uneofetch don't work on other distros. Keep this in mind.
# This script installs uneofetch directly from the Github.

cd ~
folder=~/uneofetch-installation
if test -f $installation then
echo "Please delete the uneofetch-installation directory. After this install, delete the uneofetch-installation-1 directory."
mkdir uneofetch-installation-1
cd ./uneofetch-installation-1
else
mkdir uneofetch-installation
cd ./uneofetch-installation
fi
git clone https://github.com/alvinneocom/uneofetch.git
cd uneofetch
installation=/bin/uneofetch
if test -f $installation then
rm /bin/uneofetch
fi
cp ./uneofetch.sh /bin/uneofetch
cd /bin
chmod +x uneofetch
cd ~
echo "Your installation is complete. Please delete the directory uneofetch-installation.\n"
echo "uneofetch is still in early stages. Please report any bugs in Issues.\n"
echo "Notes: uneofetch is based off of ufetch Ubuntu. Some functions will fail to work in other distros.\n"
echo "The path directory may not be bin all the time."
