#!/bin/bash
set -e

# first install brew (used also for installation of ansible then)
# (this also installs Xcode command line tools)
brew --version > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install ansible and git
brew install ansible git

# clone ansible repo
[[ -d ${HOME}/sysadmin ]] || mkdir ${HOME}/sysadmin
cd ${HOME}/sysadmin
curl -fsSLO https://dl.qgp.io/deploy/id_25519_deploy
git clone git@github.com:qgp/qgp-playbook -c core.sshCommand="ssh -o IdentifyFile=id_25519_deploy" -o qgp

# ansible-pull -U git@github.com:qgp/qgp-playbook.git -d ${HOME}/sysadmin/qgp-playbook --check
