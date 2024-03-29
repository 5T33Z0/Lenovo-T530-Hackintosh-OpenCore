## Installing macOS Sonoma on the Lenovo T530 (OpenCore)

**TABLE of CONTENTS**

- [I. Requirements](#i-requirements)
	- [Important Note about SMBIOS](#important-note-about-smbios)
- [II. Install Instructions](#ii-install-instructions)
	- [1. Install macOS Sonoma](#1-install-macos-sonoma)
	- [2. Apply Root Patches with OpenCore Legacy Patcher](#2-apply-root-patches-with-opencore-legacy-patcher)
- [III. OCLP and System Updates](#iii-oclp-and-system-updates)
- [Notes](#notes)
- [Credits](#credits)

## I. Requirements

- [**OpenCore Legacy Patcher (OCLP)**](https://github.com/dortania/OpenCore-Legacy-Patcher/releases)  &rarr; Click on "Assets" and download "OpenCore-Patcher-GUI-App".
- macOS Sonoma. Either download it through System Update, App Store or OCLP.
- USB Flash Drive (16 GB+) for clean install.
- My EFI Folder
- **SMBIOS**:
	- When upgrading from macOS Catalina or older: use `MacBookPro14,1` (i7) or `MacBookPro14,2` (i5) during installation (&rarr; see "Note about SMBIOS")
	- When upgrading from Big Sur 11.3 or newer: stay on `MacBookPro10,1` (i7) or `MacBookPro10,2` (i5)

### Important Note about SMBIOS
My configuration includes a board-id skip which allows using the `MacBookPro10,1` SMBIOS which wouldn't be possible otherwise. It requires vitrtualization technology introduced in macOS Big Sur. Therefore, you can't simply upgrade from macOS Catalina or older using the `MacBookPro10,X` SMBIOS since the required virtualization technology to make the board-id skip work isn't present prior to macOS 11.3 (Darwin Kernel 20.4). 

So when upgrading from macOS Catalina or older, you need to *temporarily* switch the SMBIOS to use `MacBookPro14,1` (i7) or `MacBookPro14,2` (i5)  in order to be able to install macOS Sonoma. You can revert to `MacBooPro10,1` (i7) or `MacBookPro10,2` (i5) once the installation is completed.

## II. Install Instructions
Installing macOS Sonoma on legacy systems which don't support AVX 2.0 CPU instruction requires OpenCore Legacy Patcher in order to prepare the macOS Sonoma Installer so it works on unsupported hardware.

### 1. Install macOS Sonoma
<details>
<summary><strong>Option 1: Upgrading existing installation</strong> (macOS 11.3+ only)</summary>

**Option 1**: Only applicable when upgrading from macOS 11.3+. If you are on macOS Catalina or older, use option 2.

- Download OCLP
- Mount your EFI Partition
- Paste in my EFI Folder 
- Adjust the `config.plist` to your needs as explained on my repo.
- Generate SMBIOS data for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
- Download macOS Sonoma via App Store, System Updates or the OCLP App
- Run the "Install macOS Sonoma" App
- There will be a few reboots
- Boot from the new macOS Partition until it's no longer present in the Boot Picker

Continue with Step 2.
</details>
<details>
<summary><strong>Option 2: Clean Install</strong> (recommended)</summary>

**Option 2**: Clean Install from USB flash drive (recommended)

To create a USB Installer, you can use OpenCore Legacy Patcher:

- Create a new Volume on your internal HDD/SSD or use separate internal disk (at least 60 GB in size) for installing macOS – DON'T install it on an external drive!
- Attach an empty USB flash drive for creating the installer (16 GB+)
- Run OCLP and follow the [**instructions**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer) to create the USB Installer
- Once the USB Installer has been created, do the following:
	- Copy the OpenCore-Patcher App to the USB Installer (and OCAT or your plist Editor of choice as well)
	- Mount the EFI Partition of the USB flash drive (using MountEFI or OCAT)
	- Paste in my EFI Folder
	- Edit the `config.plist`:
		- Generate SMBIOS data:
			- Coming from macOS 11.3+: Use `MacBookPro10,1` (i7) or `MacBookPro10,2` (i5)
			- Coming from macOS 10.15 or older: Use `MacBookPro14,1` (i7) or `MacBookPro14,2` (i5) 
- Reboot from the USB flash drive and run "Install macOS Sonoma"
- There will be a few reboots along the way. Boot from the new Install Partition until it's no longer present in the Boot Picker
- Once the Installation has finished, copy the EFI folder from the USB Installer to the EFI partition on your HDD/SSD
- Switch SMBIOS back to `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5) (generate a new MLB, Serial, etc.)

Continue with Step 2.
</details>

### 2. Apply Root Patches with OpenCore Legacy Patcher

Once you reach the set-up assistant (where you select your language, time zone, etc), you will notice that the system feels super sluggish – that's normal because it is running in VESA mode without graphics acceleration, since the friendly guys at Apple removed the Intel HD 4000 drivers (as well as legacy Wi-Fi drivers).

To bring them back, do the following:

- Copy the OpenCore Patcher App from you USB Installer to the Desktop and run it
- In the OpenCore Legacy Patcher menu, select "Post Install Root Patch": </br>![menu](https://user-images.githubusercontent.com/76865553/181920348-21a3abad-311f-49c6-b4d9-25e6560b6150.png)
- The following screen will list the avaialble Root Patches for your system. Press "OK" to start pathing:</br>![OCLP_root](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/assets/76865553/e17bcb6d-307b-42c5-9513-c94c00473137)
- The App has to relaunch with Admin Roots. Click Yes:</br>![yes](https://user-images.githubusercontent.com/76865553/181920381-2b6a4194-60c3-472e-81bb-c5478e3298f9.png)
- You will have to enter your Admin Password and then the installation will begin:</br>![Install](https://user-images.githubusercontent.com/76865553/181920398-38ddf7c5-0dfd-428e-9d7a-5646010d3c08.png)
- Once. it's done, you have to reboot and Graphics acceleration will work
- Continue with the Post-Install process as described in the Repo.

## III. OCLP and System Updates
The major advantage of using OCLP over the previously used Chris1111s HD4000 Patcher is that it remains on the system even after installing System Updates. After an update, it detects that the graphics drivers are missing and asks you, if you want to to patch them in again:</br>![Notify](https://user-images.githubusercontent.com/76865553/181934588-82703d56-1ffc-471c-ba26-e3f59bb8dec6.png)

You just click on "Okay" and the drivers will be re-installed. After the obligatory reboot, everything will be back to normal.

## Notes
- Installing drivers on the system partition breaks its security seal. This affects System Updates: every time a System Update is available, the FULL Installer (about 12 GB) will be downloaded.
- After each System Update, the iGPU drivers have to be re-installed. OCLP will take care of this.
- ⚠️ You cannot install macOS Security Response Updates (RSR) on pre-Haswell systems. They will fail to install (more info [**here**](https://github.com/dortania/OpenCore-Legacy-Patcher/issues/1019)). 

## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- IC005K for OCAT
