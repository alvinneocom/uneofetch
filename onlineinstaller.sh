# Run this to install on Ubuntu/Debian-based distros.
# Some components of uneofetch don't work on other distros. Keep this in mind.
# This script installs uneofetch directly from the Github.
# Installer by pepsipu.
git clone https://github.com/alvinneocom/uneofetch.git
cd uneofetch
if test -f /usr/bin/uneofetch; then
rm /usr/bin/uneofetch
fi
chmod +x ./uneofetch.sh
cp ./uneofetch.sh /usr/bin/uneofetch
cd ..
rm -r uneofetch
echo "Your installation is complete!\n"
echo "uneofetch is still in early stages. Please report any bugs in Issues.\n"
echo "Notes: uneofetch is based off of ufetch Ubuntu. Some functions will fail to work in other distros.\n"
echo "The path directory may not be bin all the time."
