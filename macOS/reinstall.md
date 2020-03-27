# Reinstall macOS

* [Reinstallation instructions][1]
* [macOS startup keys]

Since Catalina:
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

[1]: https://support.apple.com/en-us/HT201065
[macOS startup keys]: https://support.apple.com/en-us/HT201255
