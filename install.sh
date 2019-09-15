# Run as root to install on Ubuntu/Debian-based distros.
# Some components of uneofetch don't work on other distros. Keep this in mind.
# this script installs uneofetch

cd ~
mkdir uneofetch-installation
cd ./uneofetch-installation
git clone https://github.com/alvinneocom/uneofetch.git
sleep 60
cd uneofetch
cp ./uneofetch.sh /bin/uneofetch
cd /bin
chmod +x uneofetch
cd ~
echo "Your installation is complete. Please delete the directory uneofetch-installation.\n"
echo "uneofetch is still in early stages. Please report any bugs in Issues."
