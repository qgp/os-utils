# Tools for OS installation

[Reinstall instructions](reinstall.md)

## General sequence

- Setup assistant
  - Apple ID
  - FileVault ?
  - iCloud Keychain ?
  - Find My Mac ?
  - user account ?
- set firmware password
- set hostname (scutil)
- filevault (fdesetup)
  - for institutional recovery key: https://support.apple.com/en-us/HT202385
- Software updates ?
- bootstrap
  - install command line utils (xcode-select)
  - install homebrew
  - install ansible
  - ansible-pull
- misc
  - create users
  - enable ssh (systemsetup)
  - install ssh key
- rEFInd
- repartition
  - large macOS partition
  - small Linux partition (+ /boot ?)
  - data partition ?
- prepare vmdk for VM

## Useful commands

- scutil
- systemsetup
- networksetup
- diskutil
- fdesetup
