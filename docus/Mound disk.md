
1. Get device info
Find the id of the disk in the /dev directory
```bash
lsblk
# or 
sudo fdisk -l
```

2. Create the Mount Point
In the exemple bellow the moun point name is exteral. You can name it anything you want.
In the exemple bellow the disk id is exteral. Your's may vary.

```bash
sudo mkdir /media/external
```
For devices formatted in FAT16 or FAT32:

```bash
sudo mount /dev/sdb1 /media/external
```

For devices formatted in ntfs:
```bash
sudo mount -t ntfs-3g /dev/sdb1 /media/external
```

3. Unmounting the drive
```bash
sudo umounnt /dev/sdb1
 #or
 sudo umount /media/external
```

4. Automount a drive
You will need the device id(step 1) and it's UUID (as shown bellow)
```bash
#replace sdXX with the device id
blkid /dev/skXX
```
UUID will look like this "40e554eb-6421-4813-88ea-3882a3a7a153"
now open this file /etc/fstab
add this line to the end, changing the UUID to yours and /mnd/Disk by your mount location
```bash
UUID=40e554eb-6421-4813-88ea-3882a3a7a153 /mnt/Disk auto nosuid,nodev,nofail,x-gvfs-show 0 0
```
```bash

```
```bash
```
