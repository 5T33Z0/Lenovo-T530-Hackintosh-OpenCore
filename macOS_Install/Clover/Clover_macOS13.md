# Installing macOS Ventura on the Lenovo T530 (Clover)

**TABLE of CONTENTS**

- [I. Requirements](#i-requirements)
	- [Note about SMBIOS](#note-about-smbios)
- [II. macOS Ventura Install Instructions](#ii-macos-ventura-install-instructions)
	- [1. Install macOS Ventura (Clean Install)](#1-install-macos-ventura-clean-install)
	- [2. Install Intel HD4000 Drivers](#2-install-intel-hd4000-drivers)
- [III. OCLP and System Updates](#iii-oclp-and-system-updates)
- [Notes](#notes)
- [Credits](#credits)

## I. Requirements
- [**OpenCore Legacy Patcher (OCLP)**](https://github.com/dortania/OpenCore-Legacy-Patcher/releases)  &rarr; Click on "Assets" and download "OpenCore-Patcher-GUI-App".
- macOS Ventura. Either download it through System Update, App Store or OCLP.
- USB Flash Drive (16 GB+) for clean install
- My EFI Folder
- **SMBIOS**: `MacBookPro10,1` (for Core i7 CPUs) or `MacBookPro10,2` (for i5)

### Note about SMBIOS
Since Clover cannot apply the necessary Booter Patches required for the [Board-ID VMM spoof](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof) to work which allows installing OTA updates on otherwise unsupported hardware, so a different approach is necessary. Instead, `-no_compat_check` is used to skip the board-id check which allows booting Ventura with the `MacBookPro10,x` and `RestrictEvents.kext` with boot-arg `revpatch=sbvmm` is used to enable the `VMM-x86_64` Board-ID, so OTA updates will work.

## II. macOS Ventura Install Instructions
Installing macOS Ventura on legacy systems which don't support AVX 2.0 CPU instruction requires OpenCore Legacy Patcher in order to prepare the macOS Ventura Installer so it works on unsupported hardware.

### 1. Install macOS Ventura (Clean Install)
- Create a new Partition on your HDD/SSD or use a separate disk (at least 60 GB in size)
- Attach an empty USB flash drive for creating the installer (16 GB+)
- Run OCLP and follow the [**instructions**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer) to create the USB Installer
- Once the USB Installer has been created, do the following:
	- Copy the OpenCore-Patcher App to the USB Installer (and Clover Configurator or your plist Editor of choice as well)
	- Mount the EFI Partition of the USB flash drive
	- Paste in my EFI Folder 
	- Rename `config_Ventura.plist` to `config.plist`
	- Generate SMBIOS data for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
- Reboot from USB flash drive and run "Install macOS Ventura"
- There will be a few reboots along the way. Boot from the new Install Partition until it's no longer present in the Boot Picker
- Once the Installation has finished, copy the EFI folder from the USB Installer to the EFI partition on your HDD/SSD

### 2. Install Intel HD4000 Drivers
Once you reach the set-up assistant (where you select your language, time zone, etc), you will notice that the system feels super sluggish – that's normal because it is running in VESA mode without graphics acceleration, since the friendly guys at Apple removed the Intel HD 4000 drivers. 

To bring them back, do the following:

- Copy the OpenCore Patcher App from you USB Installer to the Desktop and run it
- In the OpenCore Legacy Patcher menu, select "Post Install Root Patch":</br>![menu](https://user-images.githubusercontent.com/76865553/181920348-21a3abad-311f-49c6-b4d9-25e6560b6150.png)
- Next, click on "Start Root Patching":</br>![menu2](https://user-images.githubusercontent.com/76865553/181920368-bdfff312-6390-40a5-9af8-8331569fbe17.png)
- The App has to relaunch with Admin Roots. Click Yes:</br>![yes](https://user-images.githubusercontent.com/76865553/181920381-2b6a4194-60c3-472e-81bb-c5478e3298f9.png)
- You will have to enter your Admin Password and then the installation will begin:</br>![Install](https://user-images.githubusercontent.com/76865553/181920398-38ddf7c5-0dfd-428e-9d7a-5646010d3c08.png)
- Once. it's done, you have to reboot and Graphics acceleration will work
- Continue with the Post-Install process as described in the Repo.

## III. OCLP and System Updates
The major advantage of using OCLP over the previously used Chris1111s HD4000 Patcher is that it remains on the system even after installing System Updates. After an update, it detects that the graphics drivers are missing and asks you, if you want to to patch them in again:</br>![Notify](https://user-images.githubusercontent.com/76865553/181934588-82703d56-1ffc-471c-ba26-e3f59bb8dec6.png)

You just click on "Okay" and the drivers will be re-installed. After the obligatory reboot, everything will be back to normal.

## Notes
- Installing drivers on the system partition breaks its security seal. This affects System Updates: every time a System Update is available, the FULL Installer (about 12 GB) will be downloaded.
- After each System Update, the Drivers have to be re-installed. OCLP will take care of it.

## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- Mackie100 for Clover Configurator
