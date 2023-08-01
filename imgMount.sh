#!/bin/bash

# check permissions
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 127
fi

if [ -d /mnt/rpi ]; then
    umount /mnt/rpi/boot
    umount /mnt/rpi/root
    rm -rf /mnt/rpi
    echo 'Unmounted.'
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage: $0 <raspios.img>"
    exit 127
fi

IMG_FILE=$1

MOUNT_OFFSET_1=$(fdisk -l $IMG_FILE | grep img1 | awk '{print $2 * 512}')
MOUNT_OFFSET_2=$(fdisk -l $IMG_FILE | grep img2 | awk '{print $2 * 512}')

MOUNT_SIZE_1=$(fdisk -l $IMG_FILE | grep img1 | awk '{print $4 * 512}')
MOUNT_SIZE_2=$(fdisk -l $IMG_FILE | grep img2 | awk '{print $4 * 512}')

mkdir -p /mnt/rpi/boot /mnt/rpi/root

mount -o offset=$MOUNT_OFFSET_1,sizelimit=$MOUNT_SIZE_1 $IMG_FILE /mnt/rpi/boot
mount -o offset=$MOUNT_OFFSET_2,sizelimit=$MOUNT_SIZE_2 $IMG_FILE /mnt/rpi/root

echo 'Go to /mnt/rpi/boot or /mnt/rpi/root'
echo 'to see the content of the partitions.'
