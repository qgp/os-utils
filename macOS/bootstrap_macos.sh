#!/bin/bash
set -e

# first install homebrew
# (pulling in Xcode command line tools)
brew --version > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install ansible and git
brew install ansible git

# clone ansible repo
[[ -d ${HOME}/Admin]] || mkdir ${HOME}/Admin
cd ${HOME}/Admin
curl -fsSLO -u qgp https://dl.qgp.io/deploy/deploykey_id_ed25519
chmod 0600 deploykey_id_ed25519
git clone git@github.com:qgp/qgp-playbook -c core.sshCommand="ssh -o IdentityFile=deploykey_id_ed25519" -o qgp

# ansible-pull -U git@github.com:qgp/qgp-playbook.git -d ${HOME}/sysadmin/qgp-playbook --check
