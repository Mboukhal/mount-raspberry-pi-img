# mount-raspberry-pi-img

## Description

`mount-raspberry-pi-img` is a simple shell script designed to facilitate the automatic mounting and unmounting of Raspberry Pi disk image files (`.img`). This script simplifies the process of accessing the contents of the disk image by automating the mount and unmount operations.

## Requirements

- Linux-based operating system (tested on Ubuntu and Debian)
- `sudo` privileges

## Usage

1. Before using the script, ensure that you have the necessary permissions to execute it. If not already done, run the following command to grant execution permissions:

   ```
   chmod +x imgMount.sh
   ```

2. To mount the Raspberry Pi disk image, use the following command:

   ```
   sudo ./imgMount.sh <raspios.img>
   ```

   Replace `<raspios.img>` with the path to the Raspberry Pi disk image you want to mount. The script will automatically create mount points and attach the image's partitions, making their contents accessible through the mount points.

3. To unmount the Raspberry Pi disk image, use the following command:

   ```
   sudo ./imgMount.sh
   ```

   This will unmount all previously mounted Raspberry Pi disk images. Make sure you have finished using the mounted directories before unmounting.

## Example

Suppose you have a Raspberry Pi disk image named `raspbian.img` located in the current directory. To mount it, use the following command:

```
sudo ./imgMount.sh raspbian.img
```

The script will automatically create mount points (e.g., `/mnt/rpi/img1`, `/mnt/rpi/img2`, etc.) and mount the partitions from the disk image, allowing you to access the contents of the image.

When you are done using the mounted directories, unmount them using the command:

```
sudo ./imgMount.sh
```

## Note

- This script is intended to be used with Raspberry Pi disk images (`.img`) that contain multiple partitions. It may not work as expected with other types of disk images.
- Make sure to unmount the image before removing or modifying it to avoid data corruption.

## License

This script is provided under the [MIT License](LICENSE).

Feel free to use, modify, and distribute it according to the terms of the license.

## Disclaimer

The script is provided as-is and without warranty. Use it at your own risk. The author is not responsible for any data loss or damage caused by the use of this script. Always take necessary precautions and backups before working with disk images.
