#!/bin/sh
set -e

BASEURL="https://raw.githubusercontent.com/qgp/os-utils/master/"

if [[ "$OSTYPE" =~ ^darwin ]]; then
    echo "Bootstrapping macOS"
    source <(curl -fsSL ${BASEURL}/macOS/bootstrap_macos.sh)
elif [[ "$OSTYPE" =~ ^linux ]]; then
    echo "Bootstrapping Linux"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    else
        echo "Unable to detect Linux flavour"
    fi
    if [[ "$OS" =~ ^Gentoo ]]; then
        echo "Bootstrapping Gentoo"
        sleep 5
        source <(curl -fsSL ${BASEURL}/Linux/Gentoo/bootstrap_gentoo.sh)
    elif [[ "$OS" =~ ^Arch ]]; then
        echo "Bootstrapping ArchLinux"
        sleep 5
        source <(curl -fsSL ${BASEURL}/Linux/Arch/bootstrap_arch.sh)
    fi
fi
