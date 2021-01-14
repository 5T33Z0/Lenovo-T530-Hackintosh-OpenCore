# Lenovo ThinkPad T530 Hackintosh OpenCore (DSTD-less)

This Repo contains an EFI Folder with configs for running macOS Catalina and Big Sur with either a patched DSDT or DSDT-less on a Lenovo T530 Laptop using OpenCore (currently version 0.6.5)

The EFI Folder contains 2 config files:

**1. config_DSDT.plist**

This config is working 100% for T530 Models wih both HD (`AAPL,ig-platform-id 03006601`) and HD+ panels (`AAPL,ig-platform-id 04006601`). 

If you simply want to have a well-running system, use this config! You need to rename it to `config.plist` in order to boot with this. But before you do, open the config and have a look at the `ACPI > Add` section. Enable either `DSDT-HD.aml` or `DSDT-HD+.aml` *(never both)* depending on the display panel of your T530. Check the comments of the entries to decide which one you need to enable. By default, the DSDT for HD+ panels is enabled.

**NOT WORKING**

You can't boot Windows from OpenCore's BootPicker if you use a single HDD/SSD for both Windows and MacOS. It crashes with ACPI Errors due to the patched DSDT.

**Workaround**: use the F12 Bootmenu and select "WindowsBootManager" instead to prohibit OpenCore injecting patches, which is recommended anyway. Otherwise use the DSDT-less config instead.

**2. config_DSDT-less.plist**

This config is for running macOS without a custom/patched DSDT – it relies on ACPI Hotpatches instead (SSDTs and ACPI renames mainly) which is the recommended method for OpenCore anyway. You need to rename it to `config.plist` in order to make it bootable.

Since this method does not rely on the presence of a patched DSDT which might mismatch the system's DSDT for the installed BIOS Version, the process of hotpatching is more precise and independent of the installed BIOS version. So, instead of just replacing the whole system DSDT with a patched one during boot, only the things which need pathcing are patched-in on the fly during boot. This makes the system boot faster, runs smoother and snappier. 

The default config is for T530 Models with HD+ displays (≥1600x900 px). If you have a model with a HD panel you need to add the correct Framebuffer-Patch for IntelHD 4000 (`AAPL,ig-platform-id 03006601`).

**NOT WORKING:**

- Lid: Sleep/Clamshell mode and switching over the main display to an External Monitor when the lid is closed
- Power LED keeps pulsing after exiting sleep

Any help on getting the lid fixed is highly, highly appreciated!


## INCOMPATIBLE COMPONENTS | HARDWARE LIMITATIONS

- Discrete NVIDIA GPU – model not supported by macOS. Must be disabled in BIOS otherwise no Boot!
- Intel Bluetooth/WIFI. You need a macOS compatible card and a BIOS Unlock to disable the WLAN Card Whitelist using `1vyrain`
- Fingerprint Sensor - model not supported by macOS
- VGA Port is not working. More info here: https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md#vga-support


## PREPARATIONS: DOs and DONTs

Before copying the EFI onto your SSD/HDD, you should do the following:

- Test the EFI first using a FAT32 formatted USB Stick
- SMBIOS and SIP
	- Create SMBIOS infos using GenSMBIOS and add the data to `PlatformInfo > Generic`
	- For Catalina: MacBookPro10,1 or 10,2 (depending on CPU) and csr-active-config: FF070000 to deactivate SIP
	- For Big Sur: MacBookPro11,1 or 11,2 (depending on CPU) and csr-active-config: FF0F0000 to deactivate SIP
- CPU:
	- The `SSDT-PM.aml` inside the ACPI Folder is for an i7 3630QM. If you use a differnt CPU, disable it in the config and create your own using `ssdtPRGEN` in Post-Install. (See 'Fixing CPU Power Management' in 'Post-Install Section')
- Wifi/Bluetooth:
    - Built-in Intel Wifi/Bluetooth cards don't work. But you can have a look at OpenIntelWireless Kext: https://github.com/OpenIntelWireless/itlwm
    - 3rd Party cards require `1vyrain` jailbreak to unlock the BIOS in order to disable WLAN Whitelist (unless the 3rd party card is whitelisted)
    - Broadcom cards require an additional kext for Bluetooth. Either `BrcmFirmwareData.kext` in "EFI > OC > Kexts" which will be injected through OpenCore or
      `BrcmFirmwareRepo.kext` which needs to be installed into S/L/E since it cannot be inject by bootloaders, but works a bit more efficient according to the documentation.
    - If you use a card from a different vendor replace the Kext(s) for networking for your device and update your config.
- Updating and creating Snapshots of config files:
	- If you create Snapshots for the DSDT-less config using `ProperTree`, make sure to disable the "ACPI > Add" entries for `DSDT` files afterwards. Best practice would be to delete both DSDTs from the EFI anyway, if you use the DSDT-less config.
	- DON'T create Snapshots for the config_DSDT.plist which is using the DSDT Files. Because this will add all the SSDTs back in, which are unnecessary since all these patches exist in the patched DSDT already. If you plan to use the DSDT-based config, you should delete all of the SSDTs except for `SSDT-PM`.
- Kexts
	- DON'T Update `VoodooPS2Controller.kext`! The current version doesn't work well with the Trackpad even with an additional Trackpad SSDT. So exclude it from updates.
	- `NoTouchID.kext` is no longer necessary for macOS 10.15.7 and beyond, so you can disable it.


## INSTALLATION

0. Download the EFI Folder from the `Releases` Section on the right and unpack it
1. Read "Preparations" Section first
2. Rename the config file of your choice to "config.plist"
3. Mount the EFI
4. Replace EFI Folder
5. Restart
6. **IMPORTANT**: Perform a NVRAM Reset (in Bootpicker, hit Space Bar and select Clean NVRAM). Especially important when switching from a DSDT to DSDT-less config!
7. Reboot again
8. Select macOS to boot. It's currently configured for running Catalina. If you want to run Big Sur, you need to use SMBIOS 11,x. You can research a suitable/matching SMBIOS for your CPU on everymac.com

## POST-INSTALL

### Fixing CPU Power Management (only necessarry if you use a differnt CPU than i7 3630QM).

	1. Open Config
	2. Enable the 2 Patches under "ACPI > Delete" (Drop CpuPm and Drop Cpu0Ist)
	3. Save config and reboot
	3. Install ssdtPRGen using terminal: https://github.com/Piker-Alpha/ssdtPRGen.sh
	4. Open Terminal and type: sudo /Users/YOURUSERNAME/ssdtPRGen.sh
	5. Go to Users/YOURUSERNAME/Library/ssdtPRGen. There you'll find an ssdt.aml
	6. Rename ssdt.aml to SSDT-PM.aml and replace the one in EFI > OC > ACPI with it
	7. In config, go to ACPI > Add and re-enable SSDT-PM if it is disabled.
	8. Disable the two patches from step 2 again.
	9. Save config and reboot. 

CPU Power Management should work fine after that. Optionally, you can install Intel Power Gadget to check if the CPU runs within it's specs.
	
**NOTE**: You can also add modifiers to the terminal command for building the SSDT. You can - for example - drop the low frequency from their default 1200 MHz to 900 MHz in 100 mHz increments, but no lower than that. Otherwise the system crashes during boot. I suggests you experiement with the modifiers a bit.

### Fixing Sleep: If you have issues with sleep, run the following commands in Terminal:

	sudo pmset hibernatemode 0
	sudo rm /var/vm/sleepimage
	sudo touch /var/vm/sleepimage
	sudo chflags uchg /var/vm/sleepimage

### Switching Command and Option Keys

By default, in macOS the [**ALT**] key is the [**CMD**] Key and the [**Windows**] Key is the [**Option Key**]. To switch them around, open System Settings > Keyboard. On the right there's a button for Special Keys. Just switch the Option and Command keys to the opposite and everything's fine.
	
### Fixing Eject Function of the Optical Drive

macOS locks the Optical drive sometimes so that you can't open it with the physical eject button – even if no media is present. To fix this, go to `System > Library > CoreService > Menu Extras` and double-click on `Eject.menu`. This adds an Eject Button to the Menu Bar.


## BIOS SETTINGS

- CONFIG [TAB]
	- USB
		- USB UEFI BIOS Support: Enabled
        - USB 3.0 Mode: Enabled
    - Display
        - Boot Display Device: ThinkPad LCD
        - OS Detection for NVIDIA Optimus: Disabled (if your T530 does not have a discrete GPU you don't see this Option)
    - Serial ATA (SATA)
        - SATA Controller Mode: XHCI
	-CPU
		- Core Multi-Processing: Enabled
		- Intel (R) Hyper-Threading: Enaybled (CPU must support it)

- SECURITY [TAB]
	- Security Chip: Disabled
	- UEFI BIOS Update Options
		- Flash BIOS Updating by End-Users: Enabled
		- Secure Rollback Prevention: Enabled
	- Memory Protection: Enabled
	- Virtualization
		- Intel (R) Virtualization Technology: Enabled (Relevant for Windows only, disabled for macOS via config)
	- I/O Port Access (Disable the following devices/features)
		- Wireless WAN
		- ExpressCard Slot
		- eSATA Port
		- Fingerprint Reader
		- Antitheft
			- Current Setting: Disabled
			- Computrace: Disabled
		- Secure Boot
			- Secure Boot: Disabled
			
- STARTUP [TAB]
	- BOOT (Set the Order of Boot devices. Set HDD/SSD as firs device)
	- UEFI/Legacy Boot: UEFI only
		- CSM Support: Disabled
	- Boot Mode: Quick
	- Boot Order Lock: Enabled. Enable this after you've set-up the order of the Boot Drives. This prohibits WindowsBootManager from taking over the first slot of the boot drives.
		
## CREDITS and THANK YOUs:

- n4ru for 1vyrain jailbreak to remove WLAN whitelist: https://github.com/n4ru/1vyrain
- Acidanthera and Team for the OpenCore Bootloader: https://github.com/acidanthera/OpenCorePkg
- Dortantia for the OpenCore Install Guide: https://dortania.github.io/OpenCore-Install-Guide
- Corpnewt for incredibly useful Tools like SSDTTime, GenSMBIOS and ProperTree: https://github.com/corpnewt
- Piker-Alpha for ssdtPRGen: https://github.com/Piker-Alpha/ssdtPRGen.sh
- Al6042 and Sascha_77 from Hackintosh-Forum.de for providing patched DSDTs and initial EFI Folder for the T530
- Daliansky for OC Little Repo with all the ACPI Hotpatches for OpenCore: https://ooh3dpsdytm34sfhws63yjfbwy--github-com.translate.goog/daliansky/OC-little
- Real Kiro for Clover EFI with ACPI Patches for referencing: https://translate.google.com/translate?sl=auto&tl=en&u=https://github.com/RealKiro/Hackintosh
- Rehabman for all USBInjectall.kext, Laptop and DSDT patchig guides: https://github.com/RehabMan
