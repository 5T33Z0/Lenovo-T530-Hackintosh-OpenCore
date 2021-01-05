# Lenovo T530 Hackinosh OpenCore (DSTD-less)

## About
This Repo contains an EFI Folder with configs for running macOS Catalina or Big Sur with either a patched DSDT or DSDT-less on a Lenovo T530 Laptop. The EFI for running macOS on the Lenovo T530 includes 2 configs:

### 1. config_DSDT.plist

This is 100% working for T530 Models wih both HD (AAPL,ig-platform-id 03006601) and HD+ Displays (AAPL,ig-platform-id 04006601). If you just want to have
a well running System, use this!

ATTENTION: You need to rename this config to config.plist in order to boot with this. You can't Boot Windows from within the BootPicker of OpenCore if you 
have Dual Boot Setup using a single HDD/SSD for both Windows and MacOS.

In this config, have a look at ACPI > Add and enable either DSDT-HD.aml or DSDT-HD+.aml (never both) depending on the Display Panel your Lenovo T530 uses. Check the comments to decide which one you need.

2. config_DSDT-less.plist

This config runs macOS without a patched DSDT making use of ACPI Hotpatches (SSDT files and ACPI patches in the config). This is independent of the installed BIOS Version and also runs smoother and snappier. The current config is for T530 Models with HD+ Displays (Resolution ≥1600x900 px). If you have a Laptop with a lower resolution you need to add the correct Framebuffer-Patch for IntelHD 4000 (AAPL,ig-platform-id 03006601).

Unfortunately, this config is currently not working 100% perfect yet. 

Currently not working:
- Lid: Sleep/Clamshell Mode and switching over the Main Display to an External Monitor when the lid is closed
- Power LED keeps pulsing after exiting sleep

Any help on getting this fixed is highly appreciated.

Files are coming soon. I need to familiarize with how uploafing the EFI on github works first.

## PREPARATIONS, DO's and DONT's

Before copying the EFI onto your SSD/HDD, you should check the following:

- Test the EFI using a FAT32 formatted USB Stick first
- Copy over existing PlatformInfo > Generic information from your current config or create a new ones using GenSMBIOS (Catalina requires MacBookPro10,1; Big Sur needs MacBookPro11,X) 
- SSDT-PM.aml inside the ACPI Folder is for an i7 3630QM Processor. If you have a differnt CPU, disable it and create your own using ssdtPRGEN in Postinstall. You can drop the low frequency from 1200 MHz to 900 MHz in 100 mHz increments, but no lower than that. Otherwise the System Crashes.
- If you use a Broadcom card for Bluetooth and Wifi you need to either add BrcmFirmwareData.kext to EFI > OC > Kexts or install BrcmFirmwareRepo.kext to S/L/E to get Bluetooth working
- If you use a different Brand than Broadcom for Bluetooth/Wifi you should replace the Kext(s) for networking for your device and update your config.
- If you create Snapshots for the DSDT-less config using ProperTree, make sure to delete/disable the ACPI > Add entries for DSDT files afterwards. Best practice would be to delete both DSDTs from the EFI anyway, if you use the DSDT-less setup.
- DON'T DON'T DON'T create Snapshots for the config_DSDT.plist which is using the DSDT Files. Because this will add all the SSDTs back in, which unnecessary since all these changes are defined in the patched DSDTs already. If you plan to use the DSDT setup, you might as well delete all of the SSDTs except for SSDT-PM.
- DON'T Update VoodooPS2Controller.kext! The current doesn't work well with the trackpad even with an additional SSDT for the Trackpad. So exclude it from updates.

## INSTALLATION

1. Rename the config file of your choice to config.plist
2. Mount EFI
3. Replace EFI Folder
4. Restart
5. Perform NVRAM Reset (in Bootpicker, hit Space Bar and select Clean NVRAM). Especially important when switching from a DSDT to DSDT-less config!!!
6. Reboot again
7. Select macOS to boot. It's currently configured for running Catalina. If you want to run Big Sur, you need to use SMBIOS 11,x. You can research a suitable/matching SMBIOS for your CPU on everymac.com

CREDITS and THANK YOUs:

- Acidanthera and Team for the OpenCore Bootloader: https://github.com/acidanthera/OpenCorePkg
- Dortantia for the OpenCore Install Guide: https://dortania.github.io/OpenCore-Install-Guide
- Corpnewt for incredibly useful Tools like SSDTTime, GenSMBIOS and ProperTree: https://github.com/corpnewt
- Piker-Alpha for ssdtPRGen: https://github.com/Piker-Alpha/ssdtPRGen.sh
- Al6042 and Sascha_77 from Hackintosh-Forum.de for providing patched DSDTs and initial EFI Folder for the T530
- Daliansky for OC Little Repo with all the ACPI Hotpatches for OpenCore: https://ooh3dpsdytm34sfhws63yjfbwy--github-com.translate.goog/daliansky/OC-little
- Real Kiro for Clover EFI with ACPI Patches for referencing: https://translate.google.com/translate?sl=auto&tl=en&u=https://github.com/RealKiro/Hackintosh
- Rehabman for all his Laptop Guides
