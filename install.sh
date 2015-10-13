#!/bin/bash

# This POSIX compliant script installs all templates into the ${HOME}/Template directory of the user running the script.

# Bash shells have PWD available.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function _install {
cp -vrf ${DIR}/templates/* ~/Templates || printf "Could not copy files. Do you have correct permissions?"\\n; exit 1
}

if [[ -e ${HOME}/Templates ]] && [[ -d ${HOME}/Templates ]]; then
	printf "Found ${HOME}/Templates"\\n >> /dev/null
	_install
	exit 0
elif [[ -e ${HOME}/Templates ]]; then
	mkdir ${HOME}/Templates || printf "Could not create ${HOME}/Templates directory. Do you have correct permissions?"\\n; exit 1
	_install
	exit 0
else
	if [[ -b ${HOME}/Templates ]] || [[ -c ${HOME}/Templates ]] || [[ -f ${HOME}/Templates ]]; then
		printf "${HOME}/Templates seems to exist as file or special file."\\n\\n
		printf "Please manually remove ${HOME}/Templates before running this script."\\n
		exit 1
	else
		mkdir ${HOME}/Templates || printf "Could not create ${HOME}/Templates directory. Do you have correct permissions?"\\n
		exit 1
	fi
fi
