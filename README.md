# pi-boot-with-powershell

#### Run your own startup scripts on Raspbian, without ever having touched the Linux partition.

This is a 100% script-based way to run commands at boot (even at first boot). It only uses the FAT32 */boot* partition on the SD card or the .img file. You don't need to change anything about the ext4 (Linux) partition. It is based on the 'short-pi-boot-scripts' provided [here](https://github.com/doitdiy-ai/short-pi-boot-script). I didn't like the 16 steps it took though to use them, so here's a powershell script that does the same.

It only needs the *boot-config.ps1* file. You'll need a freshly imaged SD Card with Raspberry Pi OS, and make sure it is inserted in the card reader connected to a PC. After downloading script, right-click and select 'Run with Powershell'. If you get a request for confirmation, select Yes (it's always recommended to check out any scripts before running them).

It'll pop up a window, select the drive, enter a password if you want to change it from the default, enter the wifi setup information and hostname and select configure. After that the SD card should be configured and ready to go use in a headless Raspberry Pi.

For a more detailed description on how to use this script, check out [this blog post](https://doitdiy.ai/2021/02/14/getting-started-1-a-easier-raspberry-pi-set-up/) on the doitdiy.ai website.
