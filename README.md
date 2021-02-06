# pi-boot-with-powershell

#### Run your own startup scripts on Raspbian, without ever having touched the Linux partition.

This is a 100% script-based way to run commands at boot (even at first boot). It only uses the FAT32 */boot* partition on the SD card or the .img file. You don't need to change anything about the ext4 (Linux) partition. It is based on the 'short-pi-boot-scripts' provided [here](https://github.com/doitdiy-ai/short-pi-boot-script). I didn't like the 16 steps it took though to use them, so here's a powershell script that does the same.

It only needs the *boot-config.ps1* file. You'll need a freshly imaged SD Card with Raspberry Pi OS, and make sure it is inserted in the card reader connected to a PC. After downloading script, right-click and select 'Run with Powershell'. If you get a request for confirmation, select Yes (it's always recommended to check out any scripts before running them).
