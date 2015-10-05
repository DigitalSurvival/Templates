#!/bin/bash

# This script installs all templates into your user's ~/Template directory.

mkdir ~/Templates || printf "Could not create ~/Templates directory. Do you have correct permissions?"\\n
mv -v templates/* ~/Templates

printf "Done!"\\n
