#!/bin/bash
set -e

# first install brew (used also for installation of ansible then)
brew --version > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install ansible
brew install ansible

# install command-line tools (if not available)
xcode-select -p > /dev/null 2>&1 || xcode-select --install

# checkout ansible repo
# this could use ansible-pull instead
[[ -d ${HOME}/sysadmin ]] || mkdir ${HOME}/sysadmin
if [[ ! -d ${HOME}/sysadmin/qgp-playbook ]]; then
    git clone https://realqgp@bitbucket.org/ansible4qgp/qgp-playbook.git ${HOME}/sysadmin/qgp-playbook
fi
