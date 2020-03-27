# Reinstall macOS

* [macOS reinstallation instructions][1]
* [macOS startup keys]

## General steps

* [unregister all accounts/...][1]
* wipe disk (not done automatically on reinstall from recovery)
* reinstall OS

## Automated reinstallation

since Catalina:
```bash
/usr/sbin/softwareupdate --fetch-full-installer
startosinstall --eraseinstall
```

* `Cmd-Q` to shutdown after installation and defer setup assistant

## Useful comments

Rerun Setup Assistant upon next boot:
```
rm /var/db/.AppleSetupDone
```

[1]: https://support.apple.com/en-us/HT201065
[macOS startup keys]: https://support.apple.com/en-us/HT201255
