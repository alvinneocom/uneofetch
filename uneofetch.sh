#!/bin/sh
#
# uneofetch - slightly less tiny system info for ubuntu
## INFO

# user is already defined
host="$(hostname)"
os="$(lsb_release -ds)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(dpkg -l | wc -l)"
shell="$(basename "$SHELL")"
# put this in
# credit to terdon on stackoverflow
# https://unix.stackexchange.com/questions/119126/command-to-display-memory-usage-disk-usage-and-cpu-load
memory_usage=`free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'`
cpu_usage=`top -bn1 | grep load | awk '{printf "%.2f\n", $(NF-2)}'`
# credit to zanna on stackoverflow for figuring out sed
# https://askubuntu.com/questions/988440/how-do-i-get-the-model-name-of-my-processor
cpu=`lscpu | sed -nr '/Model name/ s/  / /g; s/.*:\s*(.*) @ .*/\1/p'`
# got this one from neofetch
cpuspeed=`awk -F ': |\\.' '/cpu MHz|^clock/ {printf $2; exit}' "/proc/cpuinfo"`

## UI DETECTION

if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
	ui="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	uitype='WM'
elif [ -f "${HOME}/.xsession" ]; then
	ui="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
	uitype='WM'
else
	ui='not found'
	uitype='UI'
fi


## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${yellow}"       # labels
nc="${reset}${bold}${yellow}"       # user and hostname
ic="${reset}${bold}${white}"        # info
c0="${reset}${bold}${yellow}"       # first color



## OUTPUT

cat <<EOF

${white}             __________     _     __
${blue}  __________/ ____/ __ \   (_)___/ /__
${magenta} / ___/ ___/___ \/ / / /  / / __  / _ \\
${green}/ /__(__  )___/ / /_/ /  / / /_/ /  __/
${yellow}\___/____/_____/\____/  /_/\__,_/\___/


${yellow}   .
${green} _.|.  ,*._ ._  _  _  _. _ ._ _
${magenta}(_]| \/ |[ )[ )(/,(_)(_.(_)[ | )


${lc}${USER}@${host}

${ic}OS: ${os}
${ic}Kernel: ${kernel}
${ic}Uptime: ${uptime}
${ic}Packages: ${packages} packages
${ic}Shell: GNU ${shell}
${ic}UI: ${ui}
${ic}CPU: ${cpu} @ ${cpuspeed} MHz
${ic}Memory Usage: ${memory_usage}
${ic}CPU Usage: ${cpu_usage} percent

${lc}Script: ufetch ubuntu, modified with memory and CPU usage

EOF
