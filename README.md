# uneofetch
(not that good) Version of uFetch which displays more information.

it sucks. feel free to try it, but it sucks.
i didn't put in much more information because i didn't want it to be that large.

screenshot (0.0.2):
![Screenshot of the terminal](https://github.com/alvinneocom/uneofetch/blob/master/scrot.PNG?raw=true)

install script:
make a sh file with this in it, then su root and run it to install the latest version.
```
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
echo "uneofetch is still in early stages. Please report any bugs in Issues."```
