#!/bin/bash

#===============================================
# This installs the node / grunt / sass tooling.
#===============================================

# 0. Update / install GNUPG
apt-get update && apt-get install -y gnupg

# 1. Node
NPM=`which npm`
if [ ! -x "$NPM" ]
then
    echo -e "\nNPM not found on path"
    # per https://github.com/nodesource/distributions/blob/master/README.md
    curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# 2. Grunt
GRUNT=`which grunt`
if [ ! -x "$GRUNT" ]
then
    echo -e "\nGrunt not found on path"
    npm install -g grunt-cli
fi

# 3. SassJS
SASS=`which sass`
if [ ! -x "$SASS" ]
then
    echo -e "\nSass not found on path"
    npm install -g sass
fi

echo -e "\nNPM version:"
npm --version

echo -e "\nGrunt version:"
grunt --version

echo -e "\nSass version:"
sass --version

exit 0
