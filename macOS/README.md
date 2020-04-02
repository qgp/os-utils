# Tools for OS installation

[Reinstall instructions](reinstall.md)

## General setup sequence

- Setup assistant
  - region
  - written and spoken languages
  - network (WiFi)
  - Data & Privacy
  - Transfer Information
  - Apple ID (can be skipped)
  - License agreement
  - primary account
  - permissions
  - TouchID
  - look
- OS update
  ```
  softwareupdate -i -a
  sudo halt
  ```
- set hostname (optional, move to bootstrap)
  ```bash
  scutil --set HostName <hostname>
  scutil --set LocalHostName <hostname>
  scutil --set ComputerName <hostname>
  dscacheutil -flushcache
  ```
- MDM enrollment (optional)
- enable ssh (optional)
  ```bash
  systemsetup -setremotelogin on
  ```
  - install key
  - disable password-based login
- bootstrap configuration
  ```bash
  /bin/zsh <(curl -fsSL https://www.qgp.io/bootstrap_os.php)
  ```
  - install homebrew
    - pulls in command-line utils
      (otherwise `xcode-select`)
  - install ansible and git
  - clone and run playbook
- install and configure rEFInd (optional, could be done by ansible)
  - download zip file [http://sourceforge.net/projects/refind/files/0.12.0/refind-bin-0.12.0.zip/download]
  - copy to ESP (remove non-x64)
  - install and update config file
- settings from recovery mode
  - set firmware password
  - bless rEFInd
    ```
    mount /dev/disk0s1 /Volumes/ESP
    bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform
    ```

to be detailed and added to automatic configuration:
- configuration
  - FileVault (fdesetup)
    - for institutional recovery key: https://support.apple.com/en-us/HT202385
  - Firewall
  - add ansible to cron/launchctld
- misc
  - create users
- repartition
  - large macOS partition
  - small Linux partition (+ /boot ?)
  - data partition ?
- prepare vmdk for VM

## Useful packages

## Useful configuration options and customizations

## Useful commands

- scutil (system configuration parameters)
- systemsetup (system preferences)
  - `systemsetup --setwaitforstartupafterpowerfailure seconds`
- defaults
  ```
  # trackpad
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  # magic mouse
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  # login and boot screens
  defaults write -g com.apple.mouse.tapBehavior -int 1
  ```
- networksetup
- diskutil
- fdesetup
- createinstallmedia
- `ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}'`

Configuration should be applied from ansible.

## References
