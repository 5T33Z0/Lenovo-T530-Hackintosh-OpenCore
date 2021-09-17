# Lenovo ThinkPad T530 Hackintosh OpenCore

**5T4TU5**: 100% Completed! Added macOS Monterey support!

[![T530](https://img.shields.io/badge/ThinkPad-T530-informational.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_T530.pdf)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.4-important.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest)
[![Clover Version](https://img.shields.io/badge/Clover-r5139-important.svg)](https://github.com/CloverHackyColor/CloverBootloader/releases)
[![MacOS Mojave](https://img.shields.io/badge/macOS-10.14.6-white.svg)](https://support.apple.com/kb/SP777?locale=en_US)
[![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.7-white.svg)](https://www.apple.com/li/macos/catalina/) 
[![MacOS Big Sur](https://img.shields.io/badge/macOS-11.5.2-white.svg)](https://www.apple.com/macos/big-sur/)
[![MacOS Monterey](https://img.shields.io/badge/macOS-12-white.svg)](https://www.apple.com/macos/monterey-preview/)
[![release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases/latest)

![](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Pics/BootPicker_alt.png)

## SUMMARY

This Repo contains EFI Folders for running macOS on a Lenovo T530 Laptop using OpenCore and Clover. Compatible and tested with: macOS 10.13 High Sierra up to macOS 12 Monterey. It makes use of the brand new `ECEnabler.kext` which enables battery status read-outs directly from the Embedded Controller – without Battery ACPI Patches.

## ABOUT

The EFI Folders contained in this repo are configured DSDT-less. This means, besides Kexts they are solely based on Binary Renames and ACPI Hotpatches (SSDTs) – they don't use a patched `DSDT` file – just like it's suppossed to be done in OpenCore. Instead of replacing the *whole* system `DSDT` by a patched one during boot, only things which need fixing are addressed and patched-in on the fly (hence the term "hot-patching"). The benefits of this approach are:

- Binary Renames and ACPI Hotpatches are independant of the installed BIOS version, so there are no mismatches if the BIOS versions between two machines differ.
- Hotpatching is cleaner, more precise and independent of the installed BIOS version since they only address specific areas of the ACPI table.
- Overall, the system boots faster, runs smoother and snappier than using a patched DSDT.
- Issues which might occur with newer macOS versions can be addressed and resolved easier by modifying or adding specific SSDTs without having to update and export the whole patched DSDT again.

**NOTE**: Read and follow the install instruction carefully and thoroughly!
<details>
<summary><strong>EFI Folder Content</strong></summary>

### EFI Folder Structure

```
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   ├── SSDT-ALS0.aml
    │   ├── SSDT-BKEYS.aml
    │   ├── SSDT-EXT4.aml
    │   ├── SSDT-EXT5.aml
    │   ├── SSDT-HPET.aml
    │   ├── SSDT-LID.aml
    │   ├── SSDT-PM.aml
    │   ├── SSDT-PNLF.aml
    │   ├── SSDT-PTSWAKTTS.aml
    │   ├── SSDT-PWRB.aml
    │   ├── SSDT-SBUS-MCHC.aml
    │   ├── SSDT-Sleep_PRW-0D6D.aml
    │   ├── SSDT-XDSM.aml
    │   └── SSDT-XOSI.aml
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   └── OpenRuntime.efi
    ├── Kexts
    │   ├── AirportBrcmFixup.kext
    │   ├── AppleALC.kext
    │   ├── BlueToolFixup.kext
    │   ├── BrcmBluetoothInjector.kext
    │   ├── BrcmFirmwareData.kext
    │   ├── BrcmPatchRAM3.kext
    │   ├── ECEnabler.kext
    │   ├── IntelMausi.kext
    │   ├── Lilu.kext
    │   ├── SMCBatteryManager.kext
    │   ├── VirtualSMC.kext
    │   ├── VoodooPS2Controller.kext
    │   ├── VoodooSDHC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources (NOTE: removed files of sub-folders from tree view to reduce clutter)
    │   ├── Audio
    │   ├── Font
    │   ├── Image
    │   │   └── Acidanthera
    │   │   │   ├── Chardonnay
    │   │   │   ├── GoldenGate
    │   │   │   └── Syrah
    │   │   └── chris1111
    │	│	├── Minimal
    │   │       └── Minimal-SSD
    │   └── Label
    ├── Tools
    │   └── CleanNvram.efi
    ├── config.plist
    └── config_Monterey.plist
```
</details>

## HARDWARE SPECS
<details>
<summary><strong>ThinkPad Model</strong></summary>

### ThinkPad T530 Specs 
| Component           | Details                                       |
| ------------------: | :-------------------------------------------- |
| Model               | Lenovo ThinkPad T530, Model# 2429-62G         |
| BIOS Version        | 2.77, unlocked with 1vyRain                   |
| Processor           | Intel(r) Core i7 3630QM                       |
| Memory              | 16GB Samsung DDR3 1600MHz, Dual-Channel       |
| Hard Disk           | Samsung 840 Evo 250GB                         |
| Integrated Graphics | Intel(r) HD Graphics 4000                     |
| Display             | 15.6" HD+ TFT Display (1600x900 px)           |
| Audio               | Realtek ALC269VC Rev.3 (Layout-id:`29`)       |
| Ethernet            | Intel(r) 82579LM Gigabit Network Connection   |
| WIFI+BT             | Broadcom BCM94352HMB DW1550, 802.11 a/b/g/n/ac|
| Docking Stattion    | Lenovo ThinkPad 4338 Mini Dock plus Series 3  |

[**ThinkPad T530 User Guide (PDF)**](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t530_t530i_w530_ug_en.pdf)
</details>
<details>
<summary><strong>Incompatible Components</strong></summary>

### Incompatible Hardware
- [ ] NVIDIA Optimus GPU is not supported by macOS and must be disabled in BIOS - otherwise no boot!
- [ ] Fingerprint Reader - model not supported by macOS
- [ ] VGA Port – not supported since macOS Mountain Lion: [Intel HD Graphics VGA Support](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md#vga-support)
</details>

## INSTALLATION
<details>
<summary><strong>Preparation: Dos and Don'ts</strong></summary>

### Dos and Don'ts
Before you copy the EFI onto your system SSD/HDD, you should do the following:

- **Test it**: Test the EFI folder first using a FAT32 formatted USB Stick! Also perform an NVRAM reset prior to booting.
- **Pick a Config**: The EFI Folder cotains 2 config files: `config.plist` and `config_Monterey.plist`. The major differences between them are:
	- `config.plist` uses `MacBookPro10,1` as System Definition. It can run everything from macOS 10.13 High Sierra up to macOS 11 Big Sur. Big Sur requires changing the `SystemProductName` to `MacBookPro11,1`, though. Adjust `csr-active-config` accordingly.
	- `config_Monterey.plist` uses `MacBookPro11,4` and is for booting macOS Monterey (obvioulsy). It uses a different combination of Bluetooth Kexts for Broadcom Cards, otherwise the system won't boot (see "Wifi/Bluetooth" further down).
- **Integrated Graphics**: Three variants of T530 models with different display panels exist: `HD+` (including FullHD) and `HD` models. Both are using different identifiers:

	`AAPL,ig-platform-id 04006601` = HD+/FullHD ≥ 1600x900 px </br>
	`AAPL,ig-platform-id 03006601` = HD = 1366x768 px

	By default, the iGPU (Intel(R) HD 4000) is configured for T530 models with `HD+` and FullHD panels. If your model has an `HD` panel you need to select a different Framebuffer-Patch, which is included in the config but is disabled. To enable it, do the folowing:
	1. Go to `DeviceProperties` > `PciRoot(0x0)/Pci(0x2,0x0)`. 
	2. Disable the HD+ Frambuffer-Patch by placing a `#` in front of `PciRoot(0x0)/Pci(0x2,0x0)`.
	3. 	Next, enable "#PciRoot(0x0)/Pci(0x2,0x0) 1366x768 px" by deleting the leading `#` and the description after the bracket, so that it looks this: `PciRoot(0x0)/Pci(0x2,0x0)`.
	
	**HINT**: If your screen turns off during boot, you are using the wrong Framebuffer-Patch!
- **CPU**: The `SSDT-PM.aml` inside the ACPI Folder is for an **Intel i7 3630QM**. If you use a differnt CPU, disable it for now and create your own using `ssdtPRGEN` in Post-Install. (See 'Fixing CPU Power Management' in the 'Post-Install Section')
- **SMBIOS**: Create SMBIOS infos using GenSMBIOS and add the data to `PlatformInfo > Generic`. 
	- High Sierra to Catalina require `MacBookPro10,1`
	- Big Sur requires `MaBookPro11,1`
	- Monterey requires `MaBookPro11,4` – amongst other files and settings. That's why There's an extra `config_Monterey.plist` included.
- **Disabling System Integrity Protection (SIP)**: to Disable SIP, go to `NVRAM` > `Add` > `7C436110-AB2A-4BBB-A880-FE41995C9F82 `and change the value of `csr-active-config` according to the installes version of macOS
  - For High Sierra: `FF030000`
  - For Mojave/Catalina: `FF070000`
  - For Big Sur/Monterey: `67080000`
  - For Monterey (alternative): `EF0F0000`
- **Wifi/Bluetooth**
	- I use a Broadcom Card but built-in Intel(r) WiFi/Bluetooth Cards may also work. Check [OpenIntelWireless](https://github.com/OpenIntelWireless) to find out if your card is supported (yet).
	- 3rd Party WiFi/BT Cards require the 1vyrain Jailbreak to unlock the BIOS in order to disable the WLAN Whitelist (unless the 3rd party card is whitelisted).
   - If you use a WiFi/BT Card from a different vendor than Broadcom, remove the BluetoolFixup and Brcm Kexts, add the required Kext(s) for your card and create a new snapshot of `config.plist` using ProperTree before trying to boot from this EFI.
   - I use `BrcmFirmwareData.kext` for Bluetooth which can be injected by OpenCore and Clover. Alternatively, you could use `BrcmFirmwareRepo.kext` instead. But it needs to be installed into System/Library/Extensions since it cannot be injected by Bootloaders. It's supposed to be more efficient than BrcmFirmwareData.kext, but it also takes more effort to install and update.
   - macOS Monterey cannot handle `BrcmBluetoothInjector.kext` and causes a boot loop so use `BlueToolFixup.kext` instead!
- **Editing/Updating config files**: If you create Snapshots for the included config.plists using `ProperTree`, make sure to double-check the `Kernel` > `Add` Section afterwards for the following:
	- `config.plist` must not include `BlueToolFixup.kext`. If it is present after generating a Snapshot, disable it. 
	- `config_Monterey.plist` must not include `BrcmBluetoothInjector.kext`. If it is present after generating a Snapshot, disable it. 
- **Optional Kexts**: 
	- [`NoTouchID.kext`](https://github.com/al3xtjames/NoTouchID) is only required for macOS 10.13 and 10.14, so you can disable it if you are using macOS 10.15.7 or newer. (excluded from current releases anyway).
	- For additional features like Sidecar, NighShift, Airplay to Mac or Universal Control you can try [Feature Unlock](https://github.com/acidanthera/FeatureUnlock).
- **Backlight Brightness Level tweaks**: 
  - Set boot-arg `applbkl=1` for reasonable maximum brightness level controlled by `WhateverGreen`. 
  - Set boot-arg `applbkl=0` for increased maximum brightness as defined in `SSDT-PNLF.aml`

</details>
<details>
<summary><strong>EFI Handling</strong></summary>

### EFI How To
0. Download the EFI Folder from the `Releases` Section on the right and unpack it
1. Read "Preparations" Section first
2. Rename the config file of your choice to "config.plist"
3. Mount the EFI
4. Replace EFI Folder
5. Restart
6. **IMPORTANT**: Perform a NVRAM Reset (in Bootpicker, hit Space Bar and select "Clean NVRAM")
7. Reboot again
8. Select macOS to boot. It's currently configured for running macOS Mojave/Catalina but there's an extra config file for running Monterey included. If you want to run Big Sur, use the default config, change `SystemProductName` to `MacBookPro11,1` and `csr-active-config` value accordingly. You can research a suitable/matching SMBIOS for your CPU on everymac.com.

</details>
<details>
<summary><strong>BIOS Settings</strong></summary>

### BIOS Settings
**Latest BIOS Version:** `2.77`
[**DOWNLOAD**](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t530/downloads/ds029246?clickid=RhAUWZ1-exyLRCuwUx0Mo3ELUkERY-RmHTlwSg0&Program=3786&pid=269814&acid=ww%3Aaffiliate%3A74clty&cid=de%3Aaffiliate%3Axg02ds)

**CONFIG [TAB]**

* USB UEFI BIOS Support: `Enabled`
* USB 3.0 Mode: `Enabled`
* Display > Boot Display Device: `ThinkPad LCD`
* Display > OS Detection for NVIDIA Optimus: `Disabled`
* SATA > SATA Controller Mode: `XHCI`
* CPU > Core Multi-Processing: `Enabled`
* CPU > Intel (R) Hyper-Threading: `Enabled` (CPU must support it)

**SECURITY [TAB]**

* Security Chip: `Disabled`
* UEFI BIOS Update Options > Flash BIOS Updating by End-Users: `Enabled`
* UEFI BIOS Update Options > Secure Rollback Prevention: `Enabled`
* Memory Protection: `Enabled`
* Virtualization > Intel (R) Virtualization Technology: `Enabled` (Relevant for Windows only, disabled in macOS via `DisableIOMapper` Quirk)
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
* Boot Order Lock: `Enabled` Enable this *after* you've set-up the order of the Boot Drives. This prohibits `WindowsBootManager` from taking over the first slot of the boot drives.
</details>
<details>
<summary><strong>How to install macOS</strong></summary>

### Installing macOS
If you have already have macOS installed but want to perform a clean install, you can either download macOS from the App Store or use [**ANYmacOS**](https://www.sl-soft.de/en/anymacos/). It's a hassle-free App than can download macOS High Sierra, Catalina, Big Sur and Monterey and also create a USB Installer for you.

If you are on Windows or Linux follow the guide provided by [Dortania](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/#making-the-installer)
</details>

## POST-INSTALL
<details>
<summary><strong>Strengthen Security</strong></summary>
Change the following settings to make your systm more secure:

- Change UEFI > APFS: `MinDate` and `MinVersion` from `-1` (disabled) to the correct values for the macOS version you are using. A list with the correct values for macOS High Sierra up to Big Sur can be found [here](https://github.com/acidanthera/OpenCorePkg/blob/master/Include/Acidanthera/Library/OcApfsLib.h).</br>

	**BACKGROUND**: OpenCore 0.7.2 introduced a new security feature which prevents loading the APFS driver if it does not match a specific Date and Version. If these values are left at their default `0`, your macOS partition will not show up in the Boot Picker unless macOS Big Sur or newer is installed since the APFS driver will not be loaded. For ease of use (and since I don't know which macOS you will be using) I've deactivated this feature. If you plan to setup a multiboot system running various iterations of macOS you probably should leave it at `-1`. Otherwise you won't be able to boot older OSes.

**NOTE**: You should test this setting first, booting from a USB Stick since it can prevent the system from booting.
</details>
<details>
<summary><strong>Fixing CPU Power Management</strong></summary>

### Fixing CPU Power Management 
1. Open Config
2. Disable `SSDT-PM.aml` under ACPI > Add  	
2. Enable the 2 Patches under ACPI > Delete (`Drop CpuPm` and `Drop Cpu0Ist`)
3. Save config and reboot
4. Install [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
5. Open Terminal and type: sudo /Users/YOURUSERNAME/ssdtPRGen.sh
6. Go to Users/YOURUSERNAME/Library/ssdtPRGen. There you'll find an ssdt.aml
7. Rename `ssdt.aml` to `SSDT-PM.aml` and replace the one in EFI > OC > ACPI with it
8. In config, go to ACPI > Add and re-enable `SSDT-PM.aml` if it is disabled.
9. Disable the two patches from step 2 again.
10. Save config and reboot. 

CPU Power Management should work fine after that. Optionally, you can install Intel Power Gadget to check if the CPU runs within it's specs.

**NOTE 1**: Only necessarry if you use a differnt CPU than i7 3630QM </br>
**NOTE 2**: You can also add modifiers to the terminal command for building the SSDT. You can - for example - drop the low frequency from their default 1200 MHz to 900 MHz in 100 mHz increments, but no lower than that. Otherwise the system crashes during boot. I suggests you experiement with the modifiers a bit.</br>
**NOTE 3**: If you feel really confident and enthusiastic you could also re-enable XCPM. But in my experience the machine does not perform as good. You can follow this guide if you're so inclined: https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Guides/Enable%20XCPM.md/<br>
**NOTE 4**: If you are running macOS Big Sur or Monterey, you can achieve better CPU Power Management and thermals (with a lot less fan activity) if you define the System as `MacBookPro10,1` instead of the required `MacBookPro11,4`. But then you also need to add the boot-arg `-no_compat_check` as well. Otherwise your system won't boot since macOS Monterey is not supposed to run on anything older than MacBookPro11,4. The downside of using `-no_compat_check` is that you won't be able to download Systenm Updates directly (use ANYmacOS instead). But in my opionion, using `MacBookPro10,1` makes much more sense because the system is more power efficient and silent since the idle Frequency is around 800 mHz lower.
</details>
<details>
<summary><strong>Fixing Sleep Issues</strong></summary>

### Fixing Sleepimage
If you have issues with sleep, run the following commands in Terminal:

	sudo pmset hibernatemode 0
	sudo rm /var/vm/sleepimage
	sudo touch /var/vm/sleepimage
	sudo chflags uchg /var/vm/sleepimage
</details>
<details>
<summary><strong>Fixing Command and Option Keys</strong></summary>

### Fixing Command and Option Keys positions
Prior to version 0.7.4 of my OpenCore EFI Folder, the [**Command**] and [**Option**] keys were set to "swapped" in the `info.plist` of `VoodooPS2Keyboard.kext` by default. So in macOS, the [**WINDOWS**] key got bound to the [**Option**] function and the [**ALT**] Key got bound to the [**Command**] function which just felt weird. Therefore, users had to swap these Keys back around in the System Settings so everything worked as expected again.

Since then, I've undone the key swap inside the `VoodooPS2Keyboard.kext` plugin so that the Key bindings are working as expected out of the box. So if you are updating from 0.7.3 or lower to 0.7.4, reset the Keyboard Modifier Keys back to Default in System Settings > Keyboard to so everything is back to normal.
</details>
<details>
<summary><strong>Changing Themes</strong></summary>

### Changing Themes
Besides the 3 themes from Acidanthera which provide the standard macOS look and feel, I've added 2 additional themes by Chris1111: `Minimal` and `Minimal-SSD.` Neither of them is enabled by default. To enable them, do the following:

- Open `config.plist`
- Go tp Misc > Boot and change `PickerVariant` to: `chris1111\Minimal` or `chris1111\Minimal-SSD`
- Next, go to Misc > Tools and change `Flavour` from `Auto` to: `ResetNVRAM:NVRAMTool` (otherwise the Icon for NVRAM Reset is not applied)
- Save config.plist and reboot

To revert these changes, enter `Acidanthera\GoldenGate` as PickerVarinat and change the Flavour of the NVRAM Reset Tool back to `Auto`.
</details>
<details>
<summary><strong>Adding `Eject` Button to the Menu bar</strong></summary>

### Eject Button 
macOS locks the optical drive sometimes so that you can't open it with the physical eject button – even if no media is present. To fix this you have 2 Options.

- Option 1: Adding an Eject Button to the Menu Bar
	- Go to `System > Library > CoreService > Menu Extras` and double-click on `Eject.menu`. This adds an Eject Button to the Menu Bar.
- Option 2: Press and hold the `INS` button (right below the Power Button) until the Eject Icon appears on the screen and the CD tray opens.
</details>

## CPU BENCHMARK

![Screenshot](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Pics/benchmark_latest.png)

[Benchmark Results](https://browser.geekbench.com/v5/cpu/9553877)

## CREDITS and THANK YOUs

- George Kushnir for [1vyrain BIOS Jailbreak](https://github.com/n4ru/1vyrain) to remove WLAN whitelist
- Acidanthera and Team for [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg)
- Dortantia for the [OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide)
- SergeySlice for [Clover Bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- khronokernel for [Clover Vanilla Install Guide](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/)
- [Corpnewt](https://github.com/corpnewt) for SSDTTime, GenSMBIOS and ProperTree
- [1Revenger1](https://github.com/1Revenger1/ECEnabler) for ECEnabler
- Piker-Alpha for [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
- daliansky for [OC Little](https://github.com/5T33Z0/OC-Little-Translated) ACPI Hotpatch Collection
- [Rehabman](https://github.com/RehabMan) for Laptop and DSDT patching guides
- [RealKiro](https://github.com/RealKiro/Hackintosh) for Clover EFI with ACPI Patches for referencing
- [banhbaoxamlan](https://github.com/banhbaoxamlan/X230-Hackintosh) for his EFI folder containing ACPI files to fix the post-sleep pulsing LED issue.
- [SL-Soft](https://www.sl-soft.de/software/) for Kext Updater and ANYmacOS
- [Pavo-IM](https://github.com/Pavo-IM/) for OC_Gen-X
- jsassu20 for [MacDown](https://macdown.uranusjr.com/) Markdown Editor
- [chris1111](https://github.com/chris1111/Patch-HD4000-Monterey) for IntelHD4000 Patcher for macOS Monterey
