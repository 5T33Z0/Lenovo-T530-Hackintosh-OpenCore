# Installing macOS Monterey on the Lenovo T530 (OpenCore)

- [I. Requirements](#i-requirements)
	- [Note about SMBIOS](#note-about-smbios)
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
- **SMBIOS**: `MacBookPro10,1` (for Core i7 CPUs) or `MacBookPro10,2` (for i5)

### Note about SMBIOS
Normally, you would not be able to run Monterey with a MacBookPro10,X SMBIOS which supports Ivy Bridge CPUs. But this config contains Booter and Kernel patches from OCLP which will force `kern.hv_vmm_present` to always return `True`. With `hv_vmm_present` returning `True`, both `OSInstallerSetupInternal` and `SoftwareUpdateCore` will set the Board-ID to `VMM-x86_64` while the rest of the OS will continue with the Board-ID for MacBookPro10,X. In other words: these patches make macOS Monterey believe that it is running in a Virtual Machine which uses a different Board-ID (`VMM-x86_64`) internally, while the rest of the system will use `MacBookPro10,1`. This way, macOS Monterey can be installed, booted and updated on this otherwise unsupported system. Check my [VMM spoofing guide](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof) for more explanations.

## II. macOS Monterey Install Instructions

### 1. Install macOS Monterey
<details>
<summary><strong>Option 1: Updating an existing Install</strong></summary>

**Option 1**: Updating an existing macOS Monterey Installation

- Download OCLP
- Mount your EFI Partition
- Paste in my EFI Folder and edit the `config.plist`:
	- Generate SMBIOS date for `MacBookPro10,1` (Core i7) or `MacBookPro10,2` (Core i5)
	- Change `csr-active-config` to: `EF0F0000` (a must to install the Intel HD4000 Drivers)
- Run the "Install macOS Monterey" App you've downloaded with ANYmacOS
- There will be a few reboots
- Boot from the new macOS Partition until it's no longer present in the Boot Picker

Continue with Step 2.
</details>
<details>
<summary><strong>Option 2: Clean Install (recommended)</strong></summary>

**Option 2**: Clean Install from USB flash drive (recommended)

To create a USB Installer, you can use OCLP:

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
- Once the Installation has finished, copy the EFI folder from the USB Installer to the EFI partition on your HDD/SSD.

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