# Reinstall macOS

https://support.apple.com/en-us/HT201065

```
/usr/sbin/softwareupdate --fetch-full-installer
```

```
startosinstall --eraseinstall
```

## Useful comments

To make Setup Assistant run again:
```
rm /var/db/.AppleSetupDone
```
