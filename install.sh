#!/bin/bash

# This script installs all templates into your user's ${HOME}/Template directory.

CURRENT_DIR=`pwd`

if [[ -d ${HOME}/Templates ]]; then
	printf "Huzzah! ${HOME}/Templates exists!"\\n
else
	mkdir ${HOME}/Templates || printf "Could not create ~/Templates directory. Do you have correct permissions?"\\n	
fi
cp -vrf ${CURRENT_DIR}/templates/* ~/Templates

printf "Done!"\\n
