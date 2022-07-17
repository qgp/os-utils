#!/bin/bash

# deps(macOS): dosfstools mtools xorriso

ISO_URL=https://ftp.halifax.rwth-aachen.de/archlinux/iso/latest/archlinux-2022.07.01-x86_64.iso
ISO_DIR=${HOME}/Downloads/ArchLinux
ISO_FILE=$(basename ${ISO_URL})
ISO_ORIG=${ISO_DIR}/${ISO_FILE}
ISO_NEW=${ISO_DIR}/${ISO_FILE/.iso/-jkl.iso}
ISO_CI=${ISO_DIR}/cloud-init.img

[[ -f ${ISO_DIR}/${ISO_FILE} ]] || curl -O --create-dirs --output-dir ${ISO_DIR} ${ISO_URL}

# TODO: check signature/key

mkfs.fat -C -n CIDATA ${ISO_CI} 4096
mcopy -i ${ISO_CI} cloud-init/meta-data cloud-init/user-data ::
xorriso -indev ${ISO_ORIG} -outdev ${ISO_NEW} -append_partition 3 0x0c ${ISO_CI} -boot_image any replay
