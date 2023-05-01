# Lenovo ThinkPad T530 Hackintosh OpenCore

[![T530](https://img.shields.io/badge/ThinkPad-T530-informational.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_T530.pdf) [![OpenCore](https://img.shields.io/badge/OpenCore-0.9.2-cyan.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![Clover Version](https://img.shields.io/badge/Clover-r5151-lime.svg)](https://github.com/CloverHackyColor/CloverBootloader/releases) [![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.7-white.svg)](https://www.apple.com/li/macos/catalina/) [![MacOS Big Sur](https://img.shields.io/badge/macOS-11.7.6-white.svg)](https://www.apple.com/macos/big-sur/) [![MacOS Monterey](https://img.shields.io/badge/macOS-12.6.3-white.svg)](https://www.apple.com/macos/monterey/) [![macOS Ventura](https://img.shields.io/badge/macOS-13.4-white.svg)](https://www.apple.com/macos/ventura/) [![release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases/latest) ![16123445](https://user-images.githubusercontent.com/76865553/208101604-eb58ec92-2f56-46e2-9ffd-84f9af286415.png)

**TABLE of CONTENTS**

- [About](#about)
  - [Audio Working on Docking Stations](#audio-working-on-docking-stations)
  - [DSDT-less config](#dsdt-less-config)
- [Hardware Specs](#hardware-specs)
  - [macOS-incompatible Components](#macos-incompatible-components)
- [EFI Folder Content (OpenCore)](#efi-folder-content-opencore)
- [Deployment](#deployment)
  - [Preparing the `config.plist`](#preparing-the-configplist)
    - [About other used boot arguments and NVRAM variables](#about-other-used-boot-arguments-and-nvram-variables)
  - [EFI How To](#efi-how-to)
  - [BIOS Settings](#bios-settings)
  - [Installing macOS](#installing-macos)
    - [Recommended macOS version](#recommended-macos-version)
- [Post-Install](#post-install)
  - [Fixing CPU Power Management](#fixing-cpu-power-management)
    - [Re-Enabling ACPI Power Management in macOS Ventura](#re-enabling-acpi-power-management-in-macos-ventura)
  - [Fixing issues with external Webcams](#fixing-issues-with-external-webcams)
  - [Fixing Sleep issues](#fixing-sleep-issues)
  - [Reducing boot time](#reducing-boot-time)
  - [Swapping Command ⌘ and Option ⌥ Keys](#swapping-command--and-option--keys)
  - [Changing Themes](#changing-themes)
  - [Eject Button](#eject-button)
  - [Fixing issues with AirportBrcmFixup (Broadcom WiFi Cards only)](#fixing-issues-with-airportbrcmfixup-broadcom-wifi-cards-only)
- [CPU Benchmark](#cpu-benchmark)
- [Credits and Thank Yous](#credits-and-thank-yous)

## About
OpenCore and Clover EFI Folders for running macOS 10.13 to 13.1+ on a Lenovo ThinkPad T530. They utilize the new `ECEnabler.kext` which enables battery status read-outs without the need for additional Battery Patches.

The OpenCore EFI also includes the latest Booter and Kernel patches which make use of macOSes virtualization capabilities (VMM) to spoof a special Board-ID which allows installing and running macOS Big Sur and Monterey with SMBIOS `MacBookPro10,1` for Ivy Bridge CPUs, so you can enjoy the benefits of optimal CPU Power Management *and* System Updates which wouldn't be possible when using the `-no_compat_check` boot arg. If you want to know more about how these patches work, [read this](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof).

:bulb: Although this EFI *might work* with the T430 and X230, is was not intended for these ThinkPad models. So don't misuse issue reports for support requests! I will close such "issues" immediately!

|:warning: Issues related to macOS 12+|
|:------------------------------------|
|**macOS Monterey and newer**: requires [**OCLP**](https://github.com/dortania/Opencore-Legacy-Patcher) to re-enable graphics acceleration

### Audio Working on Docking Stations 
I created my own AppleALC Layout-ID which supports the Lenovo Mini Dock 3 Type 4337 and 4338 docking stations. It uses **Layout-ID 39** and has been integrated into AppleALC since [version 1.7.3](https://github.com/acidanthera/AppleALC/releases/tag/1.7.3)

### DSDT-less config
The config contained in this repo is DSDT-less. This means, it doesn't use a patched DSDT. Everything is patched live using ACPI Hotpatches (SSDTs) and a few DSDT patches via binary renames. So instead of replacing the *whole* system DSDT by a patched one during boot, only things which need fixing are addressed and patched-in on the fly (hence the term "hot-patching")  – just like it is supposed to be done nowadays. The benefits of this approach are:

- Hotpatching is cleaner, more precise and independent of the installed BIOS version since it only addresses specific areas of ACPI tables which need patching.
- Issues which might occur with newer macOS versions can be addressed and resolved easier by modifying or adding SSDTs without having to update and export the whole patched DSDT again.
- The system boots faster, runs smoother and performance is better compared to using a patched DSDT.

> **Note**: Read and follow the instructions carefully and thoroughly before deploying the EFI folder if you want your system to boot successfully!

## Hardware Specs
| Component           | Details                                       |
| ------------------: | :-------------------------------------------- |
| Model               | Lenovo ThinkPad T530, Model# 2429-62G         |
| Chipset             | [Intel QM77 Express](https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7-series-chipset-pch-datasheet.pdf)
| BIOS Version        | 2.77, unlocked with 1vyRain                   |
| Processor           | Intel Core i7 3630QM                          |
| Memory              | 16GB Samsung DDR3 1600MHz, Dual-Channel       |
| Hard Disk           | Samsung 840 Evo 250GB                         |
| Integrated Graphics | Intel HD Graphics 4000, 2048 MB RAM assigned  |
| Display             | 15.6" HD+ TFT Display (1600x900 px)           |
| Audio               | Realtek ALC269VC Rev.3 (Layout-id:`39`)       |
| Ethernet            | Intel 82579LM Gigabit Network Connection      |
| WiFi and Bluetooth  | Broadcom BCM94352HMB DW1550, 802.11 a/b/g/n/ac|
| Multicard Reader    | Ricoh 4-in-1 reader (MMC, SD, SDHC, SDXC)     |
| ExpressCard/34 slot | disabled                                      |
| Docking Station     | Lenovo ThinkPad 4338 Mini Dock plus Series 3  |

[**ThinkPad T530 User Guide (PDF)**](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t530_t530i_w530_ug_en.pdf)

### macOS-incompatible Components
- [ ] NVIDIA Optimus GPU must be disabled in BIOS - otherwise no boot!
- [ ] Fingerprint Reader
- [ ] VGA Port – not supported since macOS Mountain Lion: [Intel HD Graphics VGA Support](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md#vga-support)

## EFI Folder Content (OpenCore)

<details>
<summary><strong>Click to reveal</strong></summary>

```
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   ├── SSDT-ALS0.aml
    │   ├── SSDT-BAT1-Disable.aml
    │   ├── SSDT-EXT4.aml
    │   ├── SSDT-EXT5.aml
    │   ├── SSDT-IRQ_FIXES.aml
    │   ├── SSDT-NBCF.aml
    │   ├── SSDT-PNLF.aml
    │   ├── SSDT-PRW0.aml
    │   ├── SSDT-PTSWAKTTS.aml
    │   ├── SSDT-PWRB.aml
    │   ├── SSDT-SBUS-MCHC.aml
    │   ├── SSDT-TEMPToFans.aml
    │   └── SSDT-XCPM.aml
    ├── Drivers
    │   ├── AudioDXE.efi (disabled)
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   ├── OpenRuntime.efi
    │   └── ResetNvramEntry.efi
    ├── Kexts (loaded based on Min Kernel/Max Kernel settings)
    │   ├── AirportBrcmFixup.kext
    │   ├── AppleALC.kext
    │   ├── AppleIntelCPUPowerManagement.kext
    │   ├── AppleIntelCPUPowerManagementClient.kext
    │   ├── BlueToolFixup.kext
    │   ├── BrcmBluetoothInjector.kext
    │   ├── BrcmFirmwareData.kext
    │   ├── BrcmPatchRAM2.kext
    │   ├── BrcmPatchRAM3.kext
    │   ├── BrightnessKeys.kext
    │   ├── CryptexFixup.kext
    │   ├── ECEnabler.kext
    │   ├── IntelMausi.kext
    │   ├── Lilu.kext
    │   ├── NoTouchID.kext
    │   ├── RestrictEvents.kext
    │   ├── SMCBatteryManager.kext
    │   ├── VirtualSMC.kext
    │   ├── VoodooPS2Controller.kext
    │   ├── VoodooSDHC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources (NOTE: shows sub-folders only, no files)
    │   ├── Font
    │   └── Image
    │       └── Acidanthera
    │       │   ├── Chardonnay
    │       │   ├── GoldenGate
    │       │   └── Syrah
    │       └── Blackosx
    │       │   └── BsxM1
    │       └── velickovicdj
    │       │   └── EnterTwilight
    │       └── Label
    └── config.plist
```
</details>

## Deployment
Please read the following explanations carefully and follow the given instructions. In order to boot macOS with this EFI successfully, adjustments to the `config.plist` and used kexts may be necessary to adapt the config to your T530 model and the macOS version you want to install/run.

### Preparing the `config.plist`
Download the EFI Folder from the [Releases](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/releases) section and unpack it. Make sure to read the included `Changelog.md` as well, since it contains useful explanations. 

Open the `config.plist` and adjust the following settings depending on your system:

1. **ACPI** Section:
	- Disable `SSDT-PM.aml` (unless you have an i7 3630QM as well). Generate your own with ssdtPRGen in Post-Install. See [Fixing CPU Power Management](#fixing-cpu-power-Management) for instructions.

2. **Booter** Section:
	- The entries in the MMIO Whitelist are memory regions used by *my* firmware. Since I don't know if these are used by all T530 BIOSes, I disabled them and the corresponding `DevirtualiseMmio` Quirk
	- To figure out which one(s) your system use(s), you can follow this [guide](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist)
	- This is not a necessity, just some fine-tuning. 

3. **DeviceProperties**: Enable the correct Framebuffer-Patch for the display panel. Two types of display panels exist for the T530: `HD+` and `HD` panels using different AAPL,ig-platform-ids and resolutions:</br>
	
	`AAPL,ig-platform-id 04006601` = `HD+` = WSXGA and FullHD FullHD. Resolution: ≥ 1600x900 px. (**Default**)</br>
	`AAPL,ig-platform-id 03006601` = `HD` = SD. Resolution: ≤ 1366x768 px</br>
	
	If your T530 has an SD panel, do the following;
	 
	- Go to `DeviceProperties` 
	- Disable the `PciRoot(0x0)/Pci(0x2,0x0)` by placing `#` in front of it.
	- Enable `#PciRoot(0x0)/Pci(0x2,0x0) 1366x768 px` by deleting the leading `#` and the description `1366x768 px`, so that it looks this: `PciRoot(0x0)/Pci(0x2,0x0)`.
	
	:bulb: **HINT**: If your screen turns off during boot, you are using the wrong Framebuffer-Patch!
	
4. **Audio**: 
	- If you need digital Audio over HDMI/DP, disable/delete `No-hda-gfx` from the Audio Device Properties in `PciRoot(0x0)/Pci(0x1B,0x0)`.
	- My EFI contains a custom build of `AppleALC.kext` which only contains layouts `18` and `39` (default) and therefore only is 95 KB in size (instead of 3.6 MB). If you are using a docking station, leave it at `39`. If you don't, change it to `18`.
	- **Bootchime**: If you want the bootchime to playback, do the following:
		- Under `UEFI/Drivers`, enable `AudioDxe.efi`
		- Under `EUFI/Audio`, enable `AudioSupport`
		- Make sure `ConnectDrivers` is enabled

5. **SIP**: Under `NVRAM/Add/7C436110-AB2A-4BBB-A880-FE41995C9F82`, adjust `csr-active-config` according to the macOS version you want to use:
	- For macOS Big Sur and newer: `03080000`(0x803)
	- For macOS Mojave/Catalina: `EF070000`(0x7EF)
	- For macOS High Sierra: `FF030000` (0x3FF)</br></br>
	
	> **Note**: Disabling SIP is mandatory if you want to run macOS Monterey or newer in order to install and load Intel HD 4000 Drivers! If you have issues running OCLP in Post, set `csr-active-config` to `03080000` (default) or `FE0F0000` (almost fully disabled).

6. **SMBIOS**: Under `SystemProductName`, select the correct SMBIOS for your CPU and generate a serial, etc. for it.
	-  For Intel i7: `MacBookPro10,1`
	-  For Intel i5: `MacBookPro10,2`</br></br>
	
	> **Note**: My config contains Booter Patches from OpenCore Legacy Patcher and RestrictEvents kext which allow using the correct SMBIOS for Ivy Bridge CPUs on macOS 11.3 and newer (Darwin Kernel 20.4+), so native Power Management and OTA System Updates are working which wouldn't be possible otherwise past macOS Catalina.

7. **WiFi and Bluetooth** (Read carefully!)
	- **Case 1: Intel Wifi/BT Card**. If you have a the stock configuration with an Intel WiFi/Bluetooth card, it may work with the [**OpenIntelWireless**](https://github.com/OpenIntelWireless) kexts. 
		- Check the compatibility list to find out if your card is supported. 
		- Remove `BluetoolFixup` and `Brcm` Kexts
		- Add the required Kexts for your Intel card to `EFI/OC/Kexts` folder and `config.plist` before attempting to boot with this EFI!
	- **Case 2: 3rd Party WiFi/BT Cards**. These require the [**1vyrain**](https://1vyra.in/) jailbreak to unlock the BIOS to disable the WiFi Whitelist (not required if the 3rd party card is whitelisted).
		- I use a WiFi/BT Card by Broadcom, so my setup requires `AirportBrcmFixup` for WiFi and `BrcmPatchRAM` and additional satellite kexts for Bluetooth. Read the comments in the config for details.
		- `BrcmFirmwareData.kext` is used for injecting the required firmware for Broadcom devices. Alternatively, you can use `BrcmFirmwareRepo.kext` which is more efficient but needs to be installed into `System/Library/Extensions` since it cannot be injected by Bootloaders.
		- If you use a WiFi/BT Card from a different vendor than Broadcom, remove BluetoolFixup and the the Brcm Kexts and add the Kext(s) required for your card to the kext folder and `config.plist` before deploying the EFI folder!

8. **Kernel Section** 
	- **Kernel/Patch**: If you have an [HDD caddy](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/issues/37#issuecomment-1509840983) for the DVD drive bay, you can add this [kernel patch](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/blob/main/Additional_Files/SATA_Hotplug.plist) to your config to enable SATA hot plugging.
	- **Kernel/Quirks**: 
		- If you are using the 1vyrain BIOS, CFG Lock will be disabled by default (not on the T430). In this case, you can disable the `AppleCpuPmCfgLock` Quirk. 
		- To figure out if the `MSR 0xE2` register of your BIOS is unlocked, add `ControlMsrE2.efi` to `EFI/OC/Tools` and your config.plist (under `Misc/Tools`) and run it from the BootPicker. The output should look like this: </br>![CFG Lock Disabled](https://user-images.githubusercontent.com/76865553/210180491-0f48b7b0-ae46-4dda-b110-6703401e2c25.jpg)

9. **Misc Section**
	- **Misc/Boot**: `HideAuxiliary` is enabled. This hides additional items like Recovery and resetting NVRAM. You can reveal them by pressing the space bar in BootPicker. If you want all items to show by default, disable `HideAuxiliary`.

10. **NVRAM Section** 
	- **Boot-args:** (under GUID `7C436110-AB2A-4BBB-A880-FE41995C9F82`)
		- `brcmfx-country=#a`: Sets Wifi Country Code (`#a` = generic) for Broadcom WiFi cards using [**AirportBrcmFixup**](https://github.com/acidanthera/AirportBrcmFixup). If you are using an Intel Card, delete this boot argument. Otherwise replace the generic country code with the one for your country [**listed here**](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements). This is recommended to avoid connectivity issues and getting AirDrop to work properly (which I don't use). 

11. **Add/enable alternative/optional Kexts**:
	- [**itlwm**](https://github.com/OpenIntelWireless/itlwm): Kext for Intel WiFi Cards. Use instead of `AirportBrcmFixup`if you don't use a Broadcom WiFi Card
	- [**IntelBluetoothFirmware**](https://github.com/OpenIntelWireless/IntelBluetoothFirmware): Kext for Intel Bluetooth Cards. Use instead of `BrcmPatchRam` and Plugins if you don't use a Broadcom BT Card
	- [**NoTouchID**](https://github.com/al3xtjames/NoTouchID): only required for macOS 10.13 and 10.14 so the boot process won't stall while checking for a Touch ID sensor.
	- [**Feature Unlock**](https://github.com/acidanthera/FeatureUnlock): Unlocks additional features like Sidecar, NighShift, Airplay, etc.

12. **Increase Max Backlight Brightness Level** (optional): 

	- Add boot-arg `applbkl=0` for increased maximum brightness of the display as defined in `SSDT-PNLF.aml` instead of letting Whatevergreen handle it. Also available as device property (see Whatevergreen documentation for details).

#### About other used boot arguments and NVRAM variables
- **Boot-args:**
	- `gfxrst=1`: Draws Apple logo at 2nd boot stage instead of framebuffer copying &rarr; Smoothens transition from the progress bar to the Login Screen/Desktop when an external monitor is attached.
	- `ipc_control_port_options=0`: Fixes issues with electron-based Apps like Discord in macOS Monterey and newer when SIP is lowered.
	- `amfi_get_out_of_my_way=0x1`: Disables [Apple Mobile File Integrity](https://eclecticlight.co/2018/12/29/amfi-checking-file-integrity-on-your-mac/). Required to be able to install Intel HD 4000 drivers in macOS 12+ using OpenCore Legacy Patcher (OCLP) in Post-Install. Also required to boot macOS Ventura afterwards. Requires SIP to be disabled.
- **NVRAM variables**:
	- OCLP Settings `-allow_amfi`: Does the same as boot-arg `amfi_get_out_of_my_way=0x1` but only when the OpenCore Patcher App is running. Otherwise you can't run the root patcher. But this didn't work the last time I tried this setting might be deprecated.
	- `hbfx-ahbm`: Lets the system hibernate instead of using regular sleep. Requires HibernationFixup.kext. More details [here](https://github.com/5T33Z0/OC-Little-Translated/tree/main/H_Boot-args#hibernationfixup) 
	- `revblock:media`: Blocks `mediaanalysisd` on Ventura+ (for Metal 1 GPUs). Required so apps like Firefox don't crash. Requires RestrictEvents.kext
	- `revpatch`:
		- `sbvmm`: Forces VMM SB model, allowing OTA updates for unsupported models on macOS 11.3 and newer. Requires `RestrictEvents.kext`. 
		- `memtab`: Adds Memory tab to "About this Mac" section. Requires RestrictEvents.kext.

### EFI How To
Once you're done adjusting the `config.plist`, mount your system's ESP and do the following:

- Backup your current EFI folder on a FAT32 formatted USB flash drive and disconnect it
- Paste in my EFI folder
- Restart
- Perform an NVRAM Reset (in BootPicker, hit Space Bar to reveal the tool)
- Select macOS to boot

The system may crash the first time when booting macOS Ventura. That's normal. I think it's be related to injecting the AppleIntelCPUPowerManagement kexts. After that, it's working fine.

### BIOS Settings

<details>
<summary><strong>Click to reveal</strong></summary>

**Latest BIOS Version:** `2.77`
[**DOWNLOAD**](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t530/downloads/ds029246?clickid=RhAUWZ1-exyLRCuwUx0Mo3ELUkERY-RmHTlwSg0&Program=3786&pid=269814&acid=ww%3Aaffiliate%3A74clty&cid=de%3Aaffiliate%3Axg02ds)

**CONFIG [TAB]**

* USB UEFI BIOS Support: `Enabled`
* USB 3.0 Mode: `Enabled`
* Display > Boot Display Device: `ThinkPad LCD`
* Display > OS Detection for NVIDIA Optimus: `Disabled`
* SATA > SATA Controller Mode: `AHCI`
* CPU > Core Multi-Processing: `Enabled`
* CPU > Intel (R) Hyper-Threading: `Enabled` (CPU must support it)

**SECURITY [TAB]**

* Security Chip: `Disabled`
* UEFI BIOS Update Options > Flash BIOS Updating by End-Users: `Enabled`
* UEFI BIOS Update Options > Secure Rollback Prevention: `Enabled`
* Memory Protection: `Enabled`
* Virtualization > Intel (R) Virtualization Technology: `Enabled` (Relevant for Windows only, can be disabled in macOS via the `DisableIOMapper` Quirk)
* I/O Port Access (`Disable` the following devices/features):
	* Wireless WAN
	* ExpressCard Slot
	* eSATA Port
	* Fingerprint Reader
	* Antitheft and Computrace
	* Secure Boot: `Disabled`

**STARTUP [TAB]**

* Boot (Set the Order of Boot devices. Set HDD/SSD as first device)
* UEFI/Legacy Boot: `UEFI only`
* CSM Support: `Disabled`
* Boot Mode: `Quick`
* Boot Order Lock: `Enabled` Enable this *after* you've set-up the order of the Boot Drives. This prevents `WindowsBootManager` from taking over the first slot of the boot drives. This way, you don't need to enable the `LauncherOption` in OpenCore!
</details>

### Installing macOS
**Coming from Windows/Linux**: Follow the installation guide by [**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/#making-the-installer). 

> **Note**: No support from my end is provided for issues related to UBS Installers created in Windows or Linux or when using a Virtual Machine!

**Coming from macOS**: 

- If you already have macOS installed, you can either download macOS from the App Store, with [**OCLP**](https://github.com/dortania/OpenCore-Legacy-Patcher) or with [**ANYmacOS**](https://www.sl-soft.de/en/anymacos/). Both can download macOS and create a USB Installer as well.
- **IMPORTANT**: When upgrading from macOS Catalina or older to Big Sur and newer, additional preparations are necessary. Follow my install instructions [**here**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/tree/main/macOS_Install)

#### Recommended macOS version
Up until recently, my recommendation was macOS Catalina. While testing my own instructions for upgrading from macOS Catalina (or older) to Big Sur, I noticed that Big Sur feels snappier and more responsive overall (although benchmarks are slightly lower), so Big Sur is my new recommendation.

## Post-Install
Once your system is up and running you may want to change the following settings to make your system more secure:

- Enable System Integrity Protection (SIP): change `csr-active-config` to `00000000` (macOS ≤ 11.x only!)
- Under `UEFI/APFS`, change `MinDate` and `MinVersion` from `-1` (disabled) to the correct values for the macOS version you are using. A list with the correct values for can be found [here](https://github.com/5T33Z0/OC-Little-Translated/tree/main/A_Config_Tips_and_Tricks#mindateminversion-settings-for-the-apfs-driver).

**IMPORTANT**: 

- **SIP**: If you're planning to install macOS Monterey, SIP needs to be disabled! Because installing the graphics drivers with Intel HD 4000 Patcher breaks macOS security seal so therefore boot will crash if SIP is enabled!
- **MinDate/MinVersion**: you should keep a working backup of your EFI folder on a FAT32 formatted USB flash drive before changing these settings, because if they are wrong, the APFS driver won't load and you won't see your macOS drive(s)!

### Fixing CPU Power Management 
1. Mount your EFI
2. Open your `config.plist`
3. In `ACPI/Add`, disable `SSDT-PM`
4. In `ACPI/Delete`, enable the rules to `Drop CpuPm` and `Drop Cpu0Ist`
5. Save the config and reboot
6. Open Terminal
7. Enter the following command to download ssdtPRGen: `curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/Beta/ssdtPRGen.sh`
8. To make the scrip executable, enter: `chmod +x ~/ssdtPRGen.sh`
9. Run the script: `sudo ~/ssdtPRGen.sh`
10. The generated `ssdt.aml` will be located under `~/Library/ssdtPRGen`
11. Rename it to `SSDT-PM.aml` and copy it
12. Paste it into `EFI/OC/ACPI`, replacing the existing file
13. In config, go to `ACPI/Add` and re-enable `SSDT-PM.aml` if it is disabled
14. Disable the two patches from step 3 again
16. Save the config and reboot

CPU Power Management should work fine after that. Optionally, you can install [Intel Power Gadget](https://www.intel.com/content/www/us/en/developer/articles/tool/power-gadget.html) to check if the CPU runs within specs. You don't need SMCProcessor and SMCSuperIO kexts to monitor the CPU if you use Intel Power Gadget, btw.

You can also use overrides to the command to change the low frequency mode for example, as explained [here](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/CPU_Power_Management/CPU_Power_Management_(Legacy)).

**NOTES**: 

- Only necessary if you use a different CPU than i7 3630QM
- You can add modifiers to the terminal command for building SSDT-PM. For example, you can drop the low frequency from the default 1200 MHz to 900 MHz in 100 MHz increments, but no lower than that. Otherwise the system crashes during boot. I suggests you experiment with the modifiers a bit.

#### Re-Enabling ACPI Power Management in macOS Ventura
With the release of macOS Monterey, Apple dropped the Plugin-Type check for handling CPU Power Management, so that the `X86PlatformPlugin` is now loaded by default. For Haswell and newer CPU families this is great, since you no longer need `SSDT-PLUG` to enable Plugin-Type `1`. But for Ivy Bridge and older, you now need to tell macOS to use Plugin-Type `0` which is fine since it is set in `SSDT-PM` already, so ACPI CPU Power Management still works in Monterey.

But when Apple released macOS Ventura, they removed the actual `ACPI_SMC_PlatformPlugin` *binary* from the `ACPI_SMC_PlatformPlugin.kext` itself (previously located under S/L/E/IOPlatformPluginFamily.kext/Contents/PlugIns/ACPI_SMC_PlatformPlugin.kext/Contents/MacOS/), rendering `SSDT-PM` generated for 'plugin-type' 0 useless, since the plugin binary is missing and therefore can't be utilized. Instead, the `X86PlaformPlugin` is loaded by default now. This results in CPU Power Management not working correctly out of the box (no Turbo states, etc.).

So when switching to macOS Ventura, you either have to force-enable XCPM by enabling the corresponding Kernel Patch contained in my config or inject kexts to re-enable ACPI CPU Power Management (Plugin-Type 0) instead. The latter is recommended, since ACPI CPU Power Management just works better on Ivy Bridge than XCPM and my current EFI folders are configured to do so.

My EFI is already configured to use ACPI CPU Power Management on macOS Ventura. Anyway, this is how it's done: 

- Download my latest OpenCore EFI folder [release](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/releases)
- Enable `AppleCpuPmCfgLock` Quirk (enabled by default). Not necessary if you have a modded BIOS where CFG Lock is disabled
- Add [Kexts from OpenCore Legacy Patcher](https://github.com/dortania/OpenCore-Legacy-Patcher/tree/main/payloads/Kexts/Misc) (already present):
	- `AppleIntelCPUPowerManagement.kext` (set `MinKernel` to 22.0.0)
	- `AppleIntelCPUPowerManagementClient.kext` (set `MinKernel` to 22.0.0)
- Disable Kernel/Patch: `_xcpm_bootstrap` 
- Disable Kernel/Quirks: `AppleXcmpCfgLock` and `AppleXcpmExtraMsrs` 
- Save and reboot

Once the 2 Kexts are injected, ACPI Power Management will work in Ventura and you can use your `SSDT-PM` like before. For tests, enter in Terminal:

```shell
sysctl machdep.xcpm.mode
```
The output should be `0`, indicating that the `X86PlatformPlugin` is not loaded, which is good in this case.
 
### Fixing issues with external Webcams

When using my EFI folder for macOS 12 or newer, disabling Apple Mobile File Integrity (AMFI) is necessary to boot macOS. But disabling it causes prompts to grant special permissions to access the cam/mic by 3rd party apps like Zoom, Microsoft Teams, etc to not pop-up .

There are [several approaches](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/issues/41#issuecomment-1528999560) for fixing this issue.

### Fixing Sleep issues
If you have issues with sleep, run the following commands in Terminal:

```
sudo pmset hibernatemode 0
sudo rm /var/vm/sleepimage
sudo touch /var/vm/sleepimage
sudo chflags uchg /var/vm/sleepimage
```
**Other Settings**:

If the system still wakes from sleep on its own, check the wake reason. Enter:

```
pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
```
If the wake reason is related to `RTC (Alarm)`, do the following:

- Enter System Settings
- Open Energy Settings
- Disable "Wake on LAN"
- Disable "Power Nap"
- In Bluetooth Settings, "Advanced Options…" disable the 3rd entry about allowing Bluetooth devices to exit sleep

**NOTES**
- In my tests, fixing the sleepimage actually prohibited the machine from entering sleep on its own. You can use Hackintool to revert the settings.
- To exit from Sleep you can press a Mouse button. But to wake from Hibernation, you have to press the `Fn` key or the `Power Button`.

### Reducing boot time
- In `UEFI/Drivers`, disable `ConnectDrivers`. This reduces the timeout between the LENOVO logo and the BootPicker by 5 to 8 seconds.

:warning: **CAUTION**: 
- With `ConnectDrivers` disabled, the boot chime cannot be played back since `AudioDXE.efi` is not loaded. 
- Before installing macOS from a USB flash drive, `ConnectDrivers` needs to be re-enabled, otherwise you won't see the flash drive in the BootPicker.

### Swapping Command ⌘ and Option ⌥ Keys
Prior to version 0.7.4 of my OpenCore EFI Folder, the **[Command]** and **[Option]** keys were set to "swapped" in the `info.plist` of `VoodooPS2Keyboard.kext` by default. So in macOS, the **[WINDOWS]** key was bound to the **[Option]** key function and the **[ALT]** Key was bound to the **[Command]** key function which felt weird. Therefore, users had to swap these Keys back around in the System Settings so everything worked as expected.

Since then, I've undone the key swap inside the `VoodooPS2Keyboard.kext` plugin so that the Key bindings are working as expected out of the box. So if you are updating from 0.7.3 or lower to 0.7.4, reset the Keyboard Modifier Keys back to Default in System Settings > Keyboard so everything is back to normal.

If the "<", ">" and "^" Keys are switched/reversed, change `Use ISO layout keyboard` from `false` to `true` in the `info.plist` of `VoodooPS2Keyboard.kext`. 

### Changing Themes
Besides the 3 default themes by Acidanthera included in the OpenCore package, I've added an additional theme by Blackosx called BsxM1 which is set as default. To change the theme to something else, do the following: 

- Open `config.plist` in OpenCore Auxiliary Tools
- Go to `Misc/Boot` 
- Select a different theme from the dropdown menu in `PickerVariant`
- Save `config.plist` and reboot to apply the theme.

To revert these changes, enter `Acidanthera\GoldenGate` as `PickerVariant` and change the Flavor for the NVRAM Reset Tool back to `Auto`.

### Eject Button 
macOS locks the optical drive sometimes so that you can't open it with the physical eject button – even if no media is present. To fix this you have 2 options:

- **Option 1**: Go to `System/Library/CoreServices/Menu Extras` and double-click on `Eject.menu`. This adds an Eject button Icon to the Menu Bar.
- **Option 2**: Press and hold the `INS` button (right below the Power Button) until the Eject Icon appears on the screen and the CD tray opens.
</details>

### Fixing issues with AirportBrcmFixup (Broadcom WiFi Cards only)

I've noticed recently that a lot of crash reports for `com.apple.drive.Airport.Brcm4360.0` and `com.apple.iokit.IO80211Family` are being generated (located under /Library/Logs/CrashReporter/CoreCapture).

This issue seems to be related to Smart Connect. It' is a feature of WiFi routers which support 2,4 gHz and 5 gHz networks. It makes the WiFi card automatically switch between both network types depending on the signal quality. I've read that turning off Smart Connect might resolve the issue. So far, this seems to do the trick but it has to be monitored a little longer to tell if this really fixes it.

## CPU Benchmark

![Screenshot](https://raw.githubusercontent.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/main/Pics/benchmark_latest.png)</br>[Benchmark Results](https://browser.geekbench.com/v5/cpu/9553877)

## Credits and Thank Yous

- George Kushnir for [1vyrain Jailbreak](https://github.com/n4ru/1vyrain) to remove WLAN whitelist from BIOS
- Acidanthera and Team for [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg), OCLP and additional Kexts
- Dortania for [OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide)
- SergeySlice for [Clover Bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- Chris1111 for [Patch-HD4000-Monterey](https://github.com/chris1111/Patch-HD4000-Monterey)
- 1Revenger1 for [ECEnabler](https://github.com/1Revenger1/ECEnabler)
- [ic005k](https://github.com/ic005k/) for OpenCore Auxiliary Tools and PlistEDPlus
- Mackie100 for [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/)
- [Corpnewt](https://github.com/corpnewt) for SSDTTime, GenSMBIOS, ProperTree and BitmaskDecode
- Piker-Alpha for [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
- [SL-Soft](https://www.sl-soft.de/software/) for Kext Updater and ANYmacOS
- khronokernel for [Clover Vanilla Install Guide](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/)
- [Rehabman](https://github.com/RehabMan) for Laptop and DSDT patching guides
- daliansky for [OC Little](https://github.com/5T33Z0/OC-Little-Translated) ACPI Hotpatch Collection
- [RealKiro](https://github.com/RealKiro/Hackintosh) for Clover EFI with ACPI Patches for referencing
- [banhbaoxamlan](https://github.com/banhbaoxamlan/X230-Hackintosh) for ACPI files to fix the post-sleep pulsing LED issue.
- jsassu20 for [MacDown](https://macdown.uranusjr.com/) Markdown Editor
