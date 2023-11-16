# Lenovo ThinkPad T530 Hackintosh OpenCore

[![T530](https://img.shields.io/badge/ThinkPad-T530-informational.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_T530.pdf) [![OpenCore](https://img.shields.io/badge/OpenCore-0.9.6-cyan.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest) [![Clover Version](https://img.shields.io/badge/Clover-r5155-apple.svg)](https://github.com/CloverHackyColor/CloverBootloader/releases) ![MacOS](https://img.shields.io/badge/macOS-10.13–14.1-purple.svg) [![release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases/latest)<br>![10103711](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/assets/76865553/90e7d9ac-f63c-4597-a7ed-49f8da8c18d6)

**TABLE of CONTENTS**

- [About](#about)
  - [Special Features](#special-features)
- [Specs](#specs)
  - [macOS-incompatible Components](#macos-incompatible-components)
- [EFI Folder Content (OpenCore)](#efi-folder-content-opencore)
- [Deployment](#deployment)
  - [Preparing the `config.plist`](#preparing-the-configplist)
    - [Used boot arguments and NVRAM variables](#used-boot-arguments-and-nvram-variables)
  - [EFI How To](#efi-how-to)
  - [BIOS Settings](#bios-settings)
  - [Installing macOS](#installing-macos)
    - [Recommended macOS version](#recommended-macos-version)
- [Post-Install](#post-install)
  - [Strengthen Security](#strengthen-security)
  - [Fixing CPU Power Management](#fixing-cpu-power-management)
    - [ACPI Power Management in macOS Ventura](#acpi-power-management-in-macos-ventura)
  - [Fixing Sleep issues](#fixing-sleep-issues)
  - [Reducing boot time](#reducing-boot-time)
  - [Fixing issues with external Webcams](#fixing-issues-with-external-webcams)
  - [Swapping Command ⌘ and Option ⌥ Keys](#swapping-command--and-option--keys)
  - [Changing Themes](#changing-themes)
  - [Eject Button](#eject-button)
  - [Fixing issues with AirportBrcmFixup (Broadcom WiFi Cards only)](#fixing-issues-with-airportbrcmfixup-broadcom-wifi-cards-only)
- [CPU Benchmark](#cpu-benchmark)
- [Credits and Thank Yous](#credits-and-thank-yous)

## About
OpenCore and Clover EFI Folders for running macOS High Sierra to Sonoma on the Lenovo ThinkPad T530.

| :warning: Important Updates |
|:----------------------------|
| Don't install macOS 14.2 beta 3 (23C5047e) yet! Patching it with OCLP 1.2.1 in Post-Install will cause the WindowServer to crash so you will get kicked back to the logon screen.
| Uninstall Intel Power Gadget before upgrading to macOS Sonoma (use the uninstaller in the app's folder)! The `EnergyDriver.kext` that comes with the app causes all CPU cores to run at 100% in macOS Sonoma 14.2+!

### Special Features
- Includes Patches and Kexts from [**OpenCore Legacy Patcher** (OCLP)](https://github.com/dortania/Opencore-Legacy-Patcher), such as:
	- Booter Patches, NVRAM parameters and `RestrictEvent.kext` to install and run macOS Big Sur+ with a `MacBookPro10,x` SMBIOS ([More](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof))
	- Native SMC CPU Power Management in macOS 13 and newer for optimal CPU Power Management ([More](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/CPU_Power_Management/CPU_Power_Management_(Legacy)#re-enabling-acpi-power-management-in-macos-ventura)).
	- Fully working graphics acceleration for the Intel HD 4000 in macOS 12+ (requires Post-Install root patching with OCLP)
	- Working legacy Broadcom Wi-Fi and Bluetooth in macOS Sonoma (requires Post-Install root patching with OCLP)
	- Ability to boot macOS 12+ with AMFI enabled thanks to `AMFIPass.kext`.
- No patched `DSDT` – only SSDT hotpatches were used for maximum ACPI-compliance
- Working battery status read-outs without additional DSDT/ACPI patches thanks to `ECEnabler.kext`
- 3D Globe in Maps in macOS 12+ thanks to AdvancedMaps.kext
- IRQ patches fully realized via custom SSDT – no binary renames required
- Custom AppleALC Layout to support the Audio Jacks of Lenovo Mini Docking Stations 4337 and 4338. It uses **Layout-ID 39** and has been integrated into AppleALC since [version 1.7.3](https://github.com/acidanthera/AppleALC/releases/tag/1.7.3)

## Specs

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

**DOCS**

- [**ThinkPad T530 User Guide** (PDF)](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t530_t530i_w530_ug_en.pdf)
- [**7-Series Chipset Datasheet** (PDF)](https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7-series-chipset-pch-datasheet.pdf)

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
    │   ├── SSDT-PM.aml
    │   ├── SSDT-PNLF.aml
    │   ├── SSDT-PRW0.aml
    │   ├── SSDT-PTSWAKTTS.aml
    │   ├── SSDT-SBUS-MCHC.aml
    │   └── SSDT-TEMPToFans.aml
    ├── Drivers
    │   ├── AudioDXE.efi (disabled)
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   ├── OpenRuntime.efi
    │   └── ResetNvramEntry.efi
    ├── Kexts (loaded based on Min/Max Kernel settings)
    │   ├── AdvancedMap.kext (macOS 12+)
    │   ├── AirportBrcmFixup.kext
    │   ├── AMFIPass.kext (macOS 12+)
    │   ├── AppleALC.kext
    │   ├── AppleIntelCPUPowerManagement.kext (macOS 13+)
    │   ├── AppleIntelCPUPowerManagementClient.kext (macOS 13+)
    │   ├── BlueToolFixup.kext (macOS 12+)
    │   ├── BrcmBluetoothInjector.kext
    │   ├── BrcmFirmwareData.kext
    │   ├── BrcmPatchRAM2.kext
    │   ├── BrcmPatchRAM3.kext 
    │   ├── BrightnessKeys.kext
    │   ├── CryptexFixup.kext (macOS 13+)
    │   ├── ECEnabler.kext
    │   ├── HibernationFixup.kext
    │   ├── IntelMausi.kext
    │   ├── IO80211FamilyLegacy.kext (macOS 14+)
    │   ├── IOSkywalkFamily.kext (macOS 14+)
    │   ├── Lilu.kext
    │   ├── NoTouchID.kext (macOS 10.13 and 10.14)
    │   ├── RestrictEvents.kext (macOS 11+)
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
Please read the following instructions carefully before deploying my EFI folder. Depending on your T530 model, the used WiFi/BT card and macOS version you want to run, adjustments to the `config.plist` and used kexts may be necessary to adapt the config to your system.

> [!NOTE]
> Although this EFI *might work* with T430 and X230, is was not intended for these ThinkPad models. So don't misuse issue reports for support requests!

### Preparing the `config.plist`
Download the EFI Folder from the [Releases](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/releases) section and unpack it. Make sure to read the included `Changelog.md` as well, since it contains useful explanations. 

Open the `config.plist` and adjust the following settings depending on your system:

1. **ACPI** Section:
	- Disable `SSDT-PM.aml` (unless you have an i7 3630QM as well). Generate your own with [ssdtPRGen](https://github.com/5T33Z0/OC-Little-Translated/blob/main/01_Adding_missing_Devices_and_enabling_Features/CPU_Power_Management/CPU_Power_Management_(Legacy)/README.md) in Post-Install.

2. **Booter** Section:
	- The entries in the MMIO Whitelist are memory regions used by *my* firmware. Since I don't know if these are used by all T530 BIOSes, I disabled them and the corresponding `DevirtualiseMmio` Quirk
	- To figure out which one(s) your system use(s), you can follow this [guide](https://github.com/5T33Z0/OC-Little-Translated/tree/main/12_MMIO_Whitelist)
	- This is not a necessity, just some fine-tuning. 

3. **DeviceProperties**: Enable the correct Framebuffer-Patch for the display panel. Two types of display panels exist for the T530: `HD+` and `HD` panels using different AAPL,ig-platform-ids and resolutions:</br>
	
	`AAPL,ig-platform-id 04006601` = `HD+` = WSXGA and FullHD. Resolution: ≥ 1600x900 px. (**Default**)</br>
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
	- SIP enabled: `00000000` (macOS Big Sur and older only!)
	- SIP disabled:
		- For Big Sur and newer: `03080000`(0x803)
		- For macOS Mojave/Catalina: `EF070000`(0x7EF)
		- For macOS High Sierra: `FF030000` (0x3FF)</br></br>
	> [!NOTE]
	> Lowering SIP is mandatory if you want to run macOS Monterey or newer in order to install and load Intel HD 4000 Drivers! If you have issues running OCLP in Post-Install, change `csr-active-config` to `FE0F0000` (almost fully disabled).

6. **SMBIOS**: Under `SystemProductName`, select the correct SMBIOS for your CPU and generate a serial, etc. for it.
	-  For Intel i7: `MacBookPro10,1`
	-  For Intel i5: `MacBookPro10,2`</br></br>
	> [!NOTE]
	> My config contains Booter Patches from OpenCore Legacy Patcher and RestrictEvents kext which allow using the correct SMBIOS for Ivy Bridge CPUs on macOS 11.3 and newer (Darwin Kernel 20.4+), so native Power Management and OTA System Updates are working oob which wouldn't be possible otherwise past macOS Catalina.

7. **WiFi and Bluetooth** (Read carefully!)
	- **Case 1: Intel Wifi/BT Card**. In stock configuration, the T530 comes with an Intel WiFi/Bluetooth card, so you need different kexts for WiFi and Bluetooth. It may work with [**OpenIntelWireless**](https://github.com/OpenIntelWireless) kexts. 
		- Check the compatibility list to find out if your card is supported. 
		- Remove `BluetoolFixup` and all kexts containing "Brcm" in the name.
		- Add the required Kexts for your Intel card to `EFI/OC/Kexts` folder and `config.plist` before attempting to boot with this EFI!
	- **Case 2: 3rd Party WiFi/BT Cards**. These require the [**1vyrain**](https://1vyra.in/) jailbreak to unlock the BIOS to disable the WiFi Whitelist (not required if the 3rd party card is whitelisted).
		- I use a WiFi/BT Card by Broadcom, so my setup requires `AirportBrcmFixup` for WiFi and `BrcmPatchRAM` and additional satellite kexts for Bluetooth. Read the comments in the config for details.
		- `BrcmFirmwareData.kext` is used for injecting the required firmware for Broadcom devices. Alternatively, you can use `BrcmFirmwareRepo.kext` which is more efficient but needs to be installed into `System/Library/Extensions` since it cannot be injected by Bootloaders.
		- If you use a WiFi/BT Card from a different vendor than Broadcom, remove BluetoolFixup and the Brcm Kexts and add the Kext(s) required for your card to the kext folder and `config.plist` before deploying the EFI folder!

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

#### Used boot arguments and NVRAM variables
- **Boot-args:**
	- `gfxrst=1`: Draws Apple logo at 2nd boot stage instead of framebuffer copying &rarr; Smoothens transition from the progress bar to the Login Screen/Desktop when an external monitor is attached.
	- `ipc_control_port_options=0`: Fixes issues with Firefox not working and electron-based Apps like Discord in macOS 12+ when SIP is lowered.
- **NVRAM variables**:
	- OCLP Settings `-allow_amfi`: Does the same as boot-arg `amfi_get_out_of_my_way=0x1` but only when the OpenCore Patcher App is running. Otherwise you can't run the root patcher. But this didn't work the last time I tried this setting might be deprecated.
	- `hbfx-ahbm`: Lets the system hibernate instead of using regular sleep. Requires HibernationFixup.kext. More details [here](https://github.com/5T33Z0/OC-Little-Translated/tree/main/H_Boot-args#hibernationfixup) 
	- `revblock:media`: Blocks `mediaanalysisd` on Ventura+ (for Metal 1 GPUs). Required so apps like Firefox don't crash. Requires RestrictEvents.kext
	- `revpatch`:
		- `sbvmm`: Forces VMM SB model, allowing OTA updates for unsupported models on macOS 11.3 and newer. Requires `RestrictEvents.kext`. 
		- `memtab`: Adds Memory tab to "About this Mac" section (macOS ≤ 12 only). Requires RestrictEvents.
		- `f16c`: Disables f16c instruction set reporting in macOS 13.3 or newer to prevent CoreGraphics crashing on Ivy Bridge CPUs

### EFI How To
Once you're done adjusting the `config.plist`, mount your system's ESP and do the following:

- Backup your current EFI folder on a FAT32 formatted USB flash drive
- Paste in my EFI folder
- Restart
- Perform an NVRAM Reset (in BootPicker, hit Space Bar to reveal the tool)
- Select macOS to boot

The system may crash the first time when booting macOS Ventura. That's normal. After that, it should work as expected.

### BIOS Settings

<details>
<summary><strong>Click to reveal</strong></summary>

**Latest BIOS Version:** `2.77`
[**DOWNLOAD**](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t530/downloads/ds029246?clickid=RhAUWZ1-exyLRCuwUx0Mo3ELUkERY-RmHTlwSg0&Program=3786&pid=269814&acid=ww%3Aaffiliate%3A74clty&cid=de%3Aaffiliate%3Axg02ds)

 Tab | Submenu | Function | Setting    |
 ----| :-----: | -------- | :----------|
**Config** | USB | <ul><li> UEFI BIOS Support<li>USB 3.0 Mode | `Enabled` <br> `Enabled`
||Display|  <ul><li>Boot Display Device:<li>OS Detection for NVIDIA Optimus: | `ThinkPad LCD` </br> `Disabled`
||SATA | <ul><li> SATA Controller Mode |`AHCI`
||CPU | <ul><li>Core Multi-Processing <li> Intel (R) Hyper-Threading Technology|`Enabled` <br> `Enabled`
**Security** | – | <ul><li> Security Chip | `Disabled`
||UEFI BIOS Update Options|<ul><li> Flash BIOS Updating by End-Users<li>  Secure Rollback Prevention: `Enabled`|`Enabled` <br> `Enabled` 
|          | – | <ul><li> Memory Protection | `Enabled`  
|          | Virtualization | <ul><li> Intel Virtualization Technology | `Enabled`
||I/O Port Access | <ul><li> Wireless WAN <li> ExpressCard Slot <li> eSATA Port <li> Fingerprint Reader <li> Antitheft and Computrace <li> Secure Boot | `Disabled`
**Startup** | – |<ul><li> UEFI/Legacy Boot| `UEFI Only`
|          | – |<ul><li> CSM Support | `Disabled`
|          | – |<ul><li> Boot Mode | `Quick`
|          | – |<ul><li> Boot Order Lock | `Enabled` 

> [!NOTE]
> Enable Boot Order Lock *after* you've set-up the order of the Boot Drives. This prevents `WindowsBootManager` from taking over the first slot of the boot drives. This way, you don't need to enable the `LauncherOption` in OpenCore!

</details>

### Installing macOS
**Coming from Windows/Linux**: Follow the installation guide by [**Dortania**](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/#making-the-installer). 

> [!NOTE]
> No support from my end is provided for issues related to UBS Installers created in Windows or Linux or when using a Virtual Machine!

**Coming from macOS**: 

- If you already have macOS installed, you can either download macOS from the App Store, with [**OCLP**](https://github.com/dortania/OpenCore-Legacy-Patcher) or with [**ANYmacOS**](https://www.sl-soft.de/en/anymacos/). Both can download macOS and create a USB Installer as well.
- **IMPORTANT**: When upgrading from macOS Catalina or older to Big Sur and newer, additional preparations are required. [**Follow my macOS install instructions**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/tree/main/macOS_Install).

#### Recommended macOS version
Until recently, my recommendation was macOS Catalina. While testing my own instructions for upgrading from macOS Catalina (or older) to Big Sur, I noticed that Big Sur feels snappier and more responsive overall (although benchmarks are slightly lower).

Big Sur is also the best choice if you're planing to upgrade to macOS Monterey or newer. Because macOS 11.3 introduced a virtualization technology which can be used to trick macOS into thinking that it is running in a VM. This allows installing and booting macOS 12+ with an unsupported SMBIOS designed for Ivy Bridge CPUs which improves CPU Power Management and also allows installing System Updates which wouldn't be possible otherwise.

## Post-Install

### Strengthen Security
Once macOS is up and running, you may want to change the following settings to make your system more secure:

- `Misc/Security/SecureBootModel`: 
	- macOS Big Sur and older: `Default`
	- macOS Monterey: `Disabled` (otherwise insta-crash)
	- macOS Ventura: `Default` (I don't know why but `Default` works – which it shouldn't…)
- `csr-active-config`: `00000000` (macOS 11.x or older only!)
- `UEFI/APFS`: change `MinDate` and `MinVersion` from `-1` (disabled) to `0` (default) or use [specific values for different versions of macOS](https://github.com/5T33Z0/OC-Little-Translated/tree/main/A_Config_Tips_and_Tricks#mindateminversion-settings-for-the-apfs-driver).

**NOTES**

- Enter `nvram 94b73556-2197-4702-82a8-3e1337dafbfb:AppleSecureBootPolicy` to check the security level. It should return `%01` for medium security. More info [here](https://github.com/perez987/Apple-Secure-Boot-and-Vault-with-OpenCore)
- **SIP**: If you're planning to install macOS Monterey or newer, System Integritiy Protection must be disabled! Because installing the necessary graphics drivers breaks macOS' security seal and the system will crash during boot if it is enabled!
- **MinDate/MinVersion**: You should keep a working backup of your EFI folder on a FAT32 formatted USB flash drive before changing these settings, because if they are wrong, the APFS driver won't load and you won't see your disk(s) in the BootPicker!

### Fixing CPU Power Management 

Follow [this guide](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/CPU_Power_Management/CPU_Power_Management_(Legacy)) to generate an SSDT-PM.aml to fix CPU Power Management. CPU Power Management should work fine after that. 

Optionally, install [Intel Power Gadget](https://www.intel.com/content/www/us/en/developer/articles/tool/power-gadget.html) to check whether or not the CPU runs within specs. You don't need SMCProcessor and SMCSuperIO kexts to monitor the CPU if you use Intel Power Gadget, btw.

**NOTES**:

- Generating an SSDT-PM is necessary if you use a different CPU than i7 3630QM
- Pre-generated SSDTs for other CPU models used in the T530 can be found [here](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/tree/main/ACPI/SSDT-PM)  
- You can add modifiers to the terminal command for building SSDT-PM. For example, you can drop the low frequency from the default 1200 MHz to 900 MHz in 100 MHz increments, but no lower than that. Otherwise the system crashes during boot. I suggest you experiment with the modifiers a bit.

#### ACPI Power Management in macOS Ventura
With the release of macOS Monterey, Apple dropped the plugin-type check for handling CPU Power Management. Since then, the `X86PlatformPlugin` (Plugin-type 1) is loaded by default – prior to Monterey, plugin-type 0 (ACPI_SMC_PlatformPlugin) was the default. For Haswell and newer this is great because you no longer need `SSDT-PLUG` to enable Plugin-Type 1. But for Ivy Bridge and older, you now not only need `SSDT-PM` to inject C-States and P-States but also to declare Plugin-Type 0 usage. But using ACPI CPU Power Management is still possible. For macOS Ventura, it's a different story…

In macOS Ventura, Apple removed the actual `ACPI_SMC_PlatformPlugin` *binary* from the kext itself rendering `SSDT-PM` generated for 'plugin-type' 0 useless, since it can't address a plugin which doesn't exist any more. Instead, the `X86PlaformPlugin` is loaded. This results in CPU Power Management not working correctly out of the box (no Turbo states, etc.).

So when switching to macOS Ventura, injecting additional kexts to re-enable ACPI CPU Power Management (Plugin-Type 0) is necessary. My EFI is already configured to boot macOS Ventura and use ACPI CPU Power Management, so you don't have to worry about it.
 
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

> [!NOTE]
>
> - To exit from Sleep you can press a Mouse button. But to wake from Hibernation, you have to press the `Fn` key or the `Power Button`.

### Reducing boot time
In `UEFI/Drivers`, disable `ConnectDrivers`. This reduces the timeout between the LENOVO logo and the BootPicker by 5 to 8 seconds.

> [!WARNING]
>
> - Before installing macOS from a USB flash drive, `ConnectDrivers` needs to be re-enabled, otherwise you won't see it in the BootPicker.
> - With `ConnectDrivers` disabled, the bootchime cannot be played back since `AudioDXE.efi` is not loaded. 

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

### Fixing issues with AirportBrcmFixup (Broadcom WiFi Cards only)

I've noticed recently that a lot of crash reports for `com.apple.drive.Airport.Brcm4360.0` and `com.apple.iokit.IO80211Family` are being generated (located under /Library/Logs/CrashReporter/CoreCapture).

This issue is related to Smart Connect, a feature of WiFi routers which support 2,4 gHz and 5 gHz basebands to make the WiFi card switch between the two automatically depending on the signal quality. In my case, turning off Smart Connect resolved the issue.

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
