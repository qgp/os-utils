# Tools for OS installation

[Reinstall instructions](reinstall.md)

## General sequence

- Setup assistant
  - region
  - written and spoken languages
  - network (WiFi)
  - license
  - Data & Privacy
  - Transfer Information
  - Apple ID (can be skipped)
  - License agreement
  - primary account
  - permissions
  - TouchID
  - FileVault ? (not asked)
  - iCloud Keychain ? (not asked)
  - Find My Mac ? (not asked)
  - user account ? (not asked)
- Software updates
  `softwareupdate -i -a`
- set hostname (scutil)

  ```bash
  scutil --set HostName <hostname>
  scutil --set LocalHostName <hostname>
  scutil --set ComputerName <hostname>
  dscacheutil -flushcache
  ```
- rEFInd
  - download zip file [http://sourceforge.net/projects/refind/files/0.12.0/refind-bin-0.12.0.zip/download]
  - copy to ESP (remove non-x64)
  - in recovery: `sudo bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform`
- ...
- set firmware password
- filevault (fdesetup)
  - for institutional recovery key: https://support.apple.com/en-us/HT202385
- bootstrap
  - install command line utils (xcode-select)
  - install homebrew
  - install ansible
  - ansible-pull
- misc
  - create users
  - enable ssh (systemsetup)
  - install ssh key
- repartition
  - large macOS partition
  - small Linux partition (+ /boot ?)
  - data partition ?
- prepare vmdk for VM

## Useful commands

- scutil
- systemsetup
  - `systemsetup --setwaitforstartupafterpowerfailure seconds`
- networksetup
- diskutil
- fdesetup
- createinstallmedia
- `ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}'`

## References
