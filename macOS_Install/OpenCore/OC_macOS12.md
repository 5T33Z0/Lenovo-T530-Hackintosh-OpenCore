# Installing macOS Monterey on the Lenovo T530 (OpenCore)

**TABLE of CONTENTS**

- [I. Requirements](#i-requirements)
	- [Important Note about SMBIOS](#important-note-about-smbios)
- [II. macOS Monterey Install Instructions](#ii-macos-monterey-install-instructions)
	- [1. Install macOS Monterey](#1-install-macos-monterey)
	- [2. Install Intel HD4000 Drivers](#2-install-intel-hd4000-drivers)
- [III. OCLP and System Updates](#iii-oclp-and-system-updates)
- [Notes](#notes)
- [Credits](#credits)

## I. Requirements

- macOS Monterey. Either download it through System Updates, from the App Store or with OCLP
- [**OpenCore Legacy Patcher (OCLP)**](https://github.com/dortania/OpenCore-Legacy-Patcher/releases) &rarr; Click on Assets and download "OpenCore-Patcher-GUI-App". We'll use it in Post-Install only to re-install the missing drivers for the Intel HD4000 on-board graphics. 
- USB Installer for clean install (optional)
- My EFI Folder
- **SMBIOS**:
	- When coming from macOS Catalina or older: use `MacBookPro11,4` for installation (&rarr; see "Note about SMBIOS")
	- When upgrading from Big Sur 11.3 or newer: stay on `MacBookPro10,1` (i7) or `MacBookPro10,2` (i5)

### Important Note about SMBIOS
My configuration includes a board-id skip which allows using the `MacBookPro10,1` SMBIOS which wouldn't be possible otherwise. It requires vitrtualization technology introduced in macOS Big Sur. Therefore, you can't simply upgrade from macOS Catalina or older using the `MacBookPro10,X` SMBIOS since the required virtualization technology to make the board-id skip work isn't present prior to macOS 11.3 (Darwin Kernel 20.4). 

So when upgrading from macOS Catalina or older, you need to *temporarily* switch the SMBIOS to use `MacBookPro11,4` in order to be able to install macOS Monterey. You can revert to `MacBooPro10,1` (i7) or `MacBookPro10,2` (i5) once the installation is completed.

## II. macOS Monterey Install Instructions

### 1. Install macOS Monterey
<details>
<summary><strong>Option 1: Upgrading existing installation</strong> (macOS 11.3+ only)</summary>

**Option 1**: Only applicable when upgrading from macOS 11.3+. If you are on macOS Catalina or older, use option 2.

- Download OCLP
- Mount your EFI Partition
- Paste in my EFI Folder and edit the `config.plist`:
	- Generate SMBIOS date for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
	- Change `csr-active-config` to: `03080000` (a must to install the Intel HD4000 Drivers)
- Download macOS Monterey via App Store, System Updates or the OCLP App
- Run the "Install macOS Monterey" App
- There will be a few reboots
- Boot from the new macOS Partition until it's no longer present in the Boot Picker

Continue with Step 2.
</details>
<details>
<summary><strong>Option 2: Clean Install</strong> (recommended)</summary>

**Option 2**: Clean Install from USB flash drive (recommended)

To create a USB Installer, you can use OpenCore Legacy Patcher:

- Create a new Partition or Volume on your HDD/SSD (at least 60 GB in size) or use a separate disk – DON'T install it on an external drive.
- Attach an empty USB flash drive for creating the installer (16 GB+)
- Run OCLP and follow the [**instructions**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer) to create the USB Installer
- Once the USB Installer has been created, do the following:
	- Copy the OpenCore-Patcher App to the USB Installer (and OCAT or your plist Editor of choice as well)
	- Mount the EFI Partition of the USB flash drive (using MountEFI or OCAT)
	- Paste in my EFI Folder 
	- Adjust the `config.plist` to your needs as explained on my repo.
	- Generate SMBIOS data for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
	- Change `csr-active-config` to: `03080000`. This is a must in order to install the Intel HD4000 Drivers.
- Reboot from USB flash drive and run "Install macOS Monterey"
- There will be a few reboots along the way. Boot from the new Install Partition until it's no longer present in the Boot Picker
- Once the Installation has finished, copy the EFI folder from the USB Installer to the EFI partition on your HDD/SSD
- Switch SMBIOS back to `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5) (generate a new MLB, Serial, etc.)

Continue with Step 2.
</details>

### 2. Install Intel HD4000 Drivers

Once you reach the set-up assistant (where you set language, time zone, etc), you will notice that the system feels super sluggish – that's normal because it is running in VESA mode without graphics acceleration, since the friendly guys at Apple removed the Intel HD 4000 drivers. 

To bring them back, do the following:

- Copy the OpenCore Patcher App from you USB Installer to the Desktop
- Double-click it to run it 
- In the OpenCore Legacy Patcher menu, select "Post Install Root Patch":</br>![menu](https://user-images.githubusercontent.com/76865553/181920348-21a3abad-311f-49c6-b4d9-25e6560b6150.png)
- Next, click on "Start Root Patching":</br>![menu2](https://user-images.githubusercontent.com/76865553/181920368-bdfff312-6390-40a5-9af8-8331569fbe17.png)
- The App has to relaunch with Admin Roots. Click Yes:</br>![yes](https://user-images.githubusercontent.com/76865553/181920381-2b6a4194-60c3-472e-81bb-c5478e3298f9.png)
- You will have to enter your Admin Password and then the installation will begin:</br>![Install](https://user-images.githubusercontent.com/76865553/181920398-38ddf7c5-0dfd-428e-9d7a-5646010d3c08.png)
- Once. it's donw you have to reboot and Graphics acceleration will work:</br>![2048](https://user-images.githubusercontent.com/76865553/181920410-28cc08d2-0bcd-4868-b30d-112caec7206d.png)

Graphics Acceleration should work now and the system should feel as usual again and you can continue with the Post-Install process as described in the Repo.

## III. OCLP and System Updates
The major advantage of using OCLP over the previously used Chris1111s HD4000 Patcher is that it remains on the system even after installing System Updates. After an update, it detects that the graphics drivers are missing and asks you, if you want to to patch them in again:</br>![Notify](https://user-images.githubusercontent.com/76865553/181934588-82703d56-1ffc-471c-ba26-e3f59bb8dec6.png)

You just click on "Okay" and the drivers will be re-installed. After the obligatory reboot, everything will be back to normal.

## Notes
- Installing drivers on the system partition breaks its security seal. This affects System Updates: every time a System Update is available, the FULL Installer (about 12 GB) will be downloaded.
- After each System Update, the Drivers have to be re-installed. OCLP should take care of it.

## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- IC005K for OCAT
