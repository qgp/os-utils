#!/bin/bash
set -e

exit 1
# first install brew (used also for installation of ansible then)
brew --version > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install ansible and git
brew install ansible git

# need to have set hostname for ansible to make sense?
# or use ansible to set hostname based on serial number?

# pull ansible repo
[[ -d ${HOME}/sysadmin ]] || mkdir ${HOME}/sysadmin
# check options here !!!
ansible-pull -U git@github.com:qgp/qgp-playbook.git -d ${HOME}/sysadmin/qgp-playbook --check

# install command-line tools (if not available)
# needed for anything else but git?
# if not this should be handled by ansible
xcode-select -p > /dev/null 2>&1 || xcode-select --install
