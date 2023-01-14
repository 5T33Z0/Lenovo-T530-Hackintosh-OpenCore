# Installing macOS Ventura on the Lenovo T530 (OpenCore)

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
The board-id skip used in my configuration that allows using the `MacBookPro10,x` SMBIOS with macOS 11.3 or newer requires virtualization technology which got introduced with macOS 11.3. Therefore, you can't simply upgrade from macOS Catalina or older with the `MacBookPro10,X` SMBIOS since the board-id skip doesn't work due to the missing virtualization technology. It only works on a systems running Darwin Kernel 20.4 or newer. In other words: upgrading macOS only works when coming from Big Sur 11.3+ in this case.

So when upgrading from macOS Catalina or older, you need to temporarily switch the SMBIOS to `MacBookPro11,4` in order to be able to install macOS Big Sur or newer.

## II. macOS Ventura Install Instructions
Installing macOS Ventura on legacy systems which don't support AVX 2.0 CPU instruction requires OpenCore Legacy Patcher in order to prepare the macOS Ventura Installer so it works on unsupported hardware.

### 1. Install macOS Ventura (Clean Install)
- Create a new Partition on your HDD/SSD or use a separate disk (at least 60 GB in size)
- Attach an empty USB flash drive for creating the installer (16 GB+)
- Run OCLP and follow the [**instructions**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer) to create the USB Installer
- Once the USB Installer has been created, do the following:
	- Copy the OpenCore-Patcher App to the USB Installer (and OCAT or your plist Editor of choice as well)
	- Mount the EFI Partition of the USB flash drive (using MountEFI or OCAT)
	- Paste in my EFI Folder 
	- Adjust the `config.plist` to your needs as explained on my repo.
	- Generate SMBIOS data for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
	- Change `csr-active-config` to: `67080000`. This is a must in order to install the Intel HD4000 Drivers.
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
- After each System Update, the Drivers have to be re-installed. OCLP will take care of this.
- ⚠️ You cannot install macOS Security Response Updates (RSR) on pre-Haswell systems. They will fail to install (more info [**here**](https://github.com/dortania/OpenCore-Legacy-Patcher/issues/1019)). 


## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- IC005K for OCAT
