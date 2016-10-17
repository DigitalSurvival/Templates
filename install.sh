#!/bin/bash

# This script installs all templates into the ~/Templates directory of the user running the script.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function _install {
cp -vrf "${DIR}"/templates/* ~/Templates || (printf "Could not copy files. Do you have write permissions to ${HOME}/Templates?"\\n; exit 1)
}

if [[ -d "${HOME}/Templates" ]]; then
	printf "Found ${HOME}/Templates"\\n >> /dev/null
	_install
	exit 0
elif [[ ! -e "${HOME}/Templates" ]]; then
	mkdir "${HOME}/Templates" || (printf "Could not create ${HOME}/Templates directory. Do you have correct permissions?"\\n; exit 1)
	_install
	exit 0
else
	printf "${HOME}/Templates seems odd. Is it a special file?"\\n\\n
	printf "Please manually remove ${HOME}/Templates before running this script."\\n
	exit 1
fi
