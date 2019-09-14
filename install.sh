# this script installs uneofetch

cd ~
mkdir uneofetch-installation
git clone https://github.com/alvinneocom/uneofetch.git
cd uneofetch
cp ./uneofetch.sh /bin/uneofetch
cd /bin
chmod +x uneofetch
cd ~
echo "Your installation is complete. Please delete the directory uneofetch-installation.\n"
echo "uneofetch is still in early stages. Please report any bugs in Issues."
