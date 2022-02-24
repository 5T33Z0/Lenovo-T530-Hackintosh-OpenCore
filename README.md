# Lenovo ThinkPad T530 Hackintosh OpenCore

[![T530](https://img.shields.io/badge/ThinkPad-T530-informational.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_T530.pdf)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.9-cyan.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest)
[![Clover Version](https://img.shields.io/badge/Clover-r5144-lime.svg)](https://github.com/CloverHackyColor/CloverBootloader/releases)
[![MacOS Mojave](https://img.shields.io/badge/macOS-10.14.6-white.svg)](https://support.apple.com/kb/SP777?locale=en_US)
[![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.7-white.svg)](https://www.apple.com/li/macos/catalina/) 
[![MacOS Big Sur](https://img.shields.io/badge/macOS-11.6-white.svg)](https://www.apple.com/macos/big-sur/)
[![MacOS Monterey](https://img.shields.io/badge/macOS-12.3-white.svg)](https://www.apple.com/macos/monterey/)
[![release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases/latest)
![](https://raw.githubusercontent.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/main/Pics/BootPicker_alt2.png)

## ABOUT

OpenCore and Clover EFI Folders for running macOS 10.13 to 12 on a Lenovo ThinkPad T530. They utilize the new `ECEnabler.kext` which enables battery status read-outs without the need for additional Battery Patches. The OpenCore EFI also includes the latest Booter and Kernel patches which make use of macOS Monterey's virtualization capabilities (VMM) to spoof a fake Board-ID. This allows installing and running macOS 12 with the `MacBookPro10,1` SMBIOS for Ivy Bridge CPUs which wouldn't be possible otherwise. So you can enjoy the benefits of optimal CPU Power Management and System Updates. If you want to know how these patches work, [read this](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof).

## DSDT-less config

The configs contained in this repo are configured DSDT-less. This means, besides Settings and Kexts they are solely based on Binary Renames and ACPI Hotpatches (SSDTs) – they don't use a patched DSDT – just like it is supposed to be done nowadays. So instead of replacing the *whole* system DSDT by a patched one during boot, only things which need fixing are addressed and patched-in on the fly (hence the term "hot-patching"). The benefits of this approach are:

- Hotpatching is cleaner, more precise and independent of the installed BIOS version since it only addresses specific areas of ACPI tables which need patching.
- Overall, the system boots faster, runs smoother and snappier than using a patched DSDT.
- Issues which might occur with newer macOS versions can be addressed and resolved easier by modifying or adding specific SSDTs without having to update and export the whole patched DSDT again.

**NOTE**: Read and follow the install instruction carefully and thoroughly before you deploy the EFI folder if you want your system to boot successfully!

|:warning: Issues related to macOS (beyond my control)|
|:----------------------------------------------------|
**macOS Monterey**: requires [Intel HD4000 Patcher](https://github.com/chris1111/Patch-HD4000-Monterey) to get graphics acceleration working
[Bluetooth issues](https://dortania.github.io/OpenCore-Install-Guide/extras/monterey.html#bluetooth) on legacy Broadcom and Intel cards.

<details>
<summary><strong>EFI Folder Content (OpenCore)</strong></summary>

### EFI Folder Structure (OpenCore)

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
    │   ├── SSDT-FWHD.aml
    │   ├── SSDT-HPET.aml
    │   ├── SSDT-LID.aml
    │   ├── SSDT-NBCF.aml
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
    │   ├── BrcmPatchRAM2.kext
    │   ├── BrcmPatchRAM3.kext
    │   ├── BrightnessKeys.kext
    │   ├── ECEnabler.kext
    │   ├── IntelMausi.kext
    │   ├── Lilu.kext
    │   ├── SMCBatteryManager.kext
    │   ├── VirtualSMC.kext
    │   ├── VoodooPS2Controller.kext
    │   ├── VoodooSDHC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources (NOTE: removed files of sub-folders from tree to reduce clutter)
    │   ├── Font
    │   ├── Image
    │   │   └── Acidanthera
    │   │   │   ├── Chardonnay
    │   │   │   ├── GoldenGate
    │   │   │   └── Syrah
    │   │   └── Blackosx
    │   │   │   └── BsxM1
    │   │   └── Label
    ├── Tools
    │   └── CleanNvram.efi
    └── config.plist
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
| Audio               | Realtek ALC269VC Rev.3 (Layout-id:`40`)       |
| Ethernet            | Intel(r) 82579LM Gigabit Network Connection   |
| WIFI+BT             | Broadcom BCM94352HMB DW1550, 802.11 a/b/g/n/ac|
| Docking Station     | Lenovo ThinkPad 4338 Mini Dock plus Series 3  |

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

### Preparing the config.plist
Please read the explanations in the following sections carefully and follow the given instructions. In order to boot macOS with this EFI successfully, adjustments to the `config.plist` may be necessary according to the used hardware and macOS version you want to use. 

Open the `config.plist` and do the following:

**IMPORTANT**: You can skip steps 1 and 2 on macOS Monterey &rarr; the new Board ID skip and VMM patches enable native SMBIOS support for your CPU. No need to use a newer one which was not written for Ivy Bridge CPUs: either use `MacBookPro9,x` or `MacbookPro10,x` and macOS Monterey will boot and install updates via Software Update.

1. Set `SystemProductName` according to the CPU and the macOS version you want to use: 
	-  For Intel i5/i7, macOS 12: `MacBookPro10,1` or `MacBookPro10,2`
	-  For Intel i5/i7, macOS 11.3+: `MacBookPro10,1` or `MacBookPro10,2`
	-  For Intel i7, macOS 10.13 to 10.15: `MacBookPro10,1` (Recommended combo)
	-  For Intel i5, macOS 10.13 to 10.15: `MacBookPro10,2`
	
	**NOTE**: This config uses special Boooter and Kernel Patched in OpenCore which allow using the correct SMBIOS for Ivy Bridge CPUs on macOS 11.3 and newer (Darwin Kernel 20.4+) whch wouldn't be posible otherwise. If you are using macOS Big Sur lower than 11.3, you need to use `MacBookPro11,X` instead, since the patches won't work with earlier versions of Big Sur.

2. Adjust `csr-active-config` according to the macOS version you want to use:
	- For macOS Monterey: `EF0F0000`(0xFEF in Clover)
	- For macOS Big Sur: `67080000`(0x867)
	- For macOS Mojave/Catalina: `FF070000`(0x7FF)
	- For macOSHigh Sierra: `FF030000` (0x3FF)
	
	**NOTE**: You need to disable SIP if you use macOS Monteray with patched-in Intel HD 4000 Drivers!

3. Select the correct Framebuffer-Patch for your T530 model. Two display panels exist: `HD+` (WSXGA and FullHD) and `HD` panels. Both are using different identifiers:</br>
	
	`AAPL,ig-platform-id 04006601` = `HD+` = FullHD. Resolution: ≥ 1600x900 px. (**Default**)</br>
	`AAPL,ig-platform-id 03006601` = `HD` = SD. Resolution: ≤ 1366x768 px</br>
	
	If your T530 Model uses an SD Panel, do the following;
	 
	- Go to `DeviceProperties` 
	- Disable the `PciRoot(0x0)/Pci(0x2,0x0)` by placing `#` in front of it.
	- Next, enable `#PciRoot(0x0)/Pci(0x2,0x0) 1366x768 px` by deleting the leading `#` and the description ` 1366x768 px`, so that it looks this: `PciRoot(0x0)/Pci(0x2,0x0)`.
	
	**HINT**: If your screen turns off during boot, you are using the wrong Framebuffer-Patch!

4. **CPU**: The `SSDT-PM.aml` inside the ACPI Folder is for an **Intel i7 3630QM**. If you use a different CPU model, disable it for now and create your own using `ssdtPRGen` in Post-Install. (See 'Fixing CPU Power Management' in the 'Post-Install Section')

5. **WiFi/Bluetooth** (Read carefully!)
	- I use a 3rd Party WiFi/BT Card with a Broadcom Chip
	- 3rd Party WiFi/BT Cards require the `1vyrain` Jailbreak to unlock the BIOS which disables the WiFi Whitelist (not necessary if the 3rd party card is whitelisted).
	- I use `BrcmFirmwareData.kext` for Bluetooth which can be injected by OpenCore and Clover. Alternatively, you could use `BrcmFirmwareRepo.kext` instead. But it needs to be installed into System/Library/Extensions since it cannot be injected by Bootloaders. It's supposed to be more efficient than BrcmFirmwareData.kext, but it also takes more effort to install and update.
	- If you use a WiFi/BT Card from a different vendor than Broadcom, remove BluetoolFixup and the "Brcm…" Kexts, add the Kext(s) required for your card to your kext folder and `config.plist` before trying to boot from this EFI!
	- If you use the stock Intel(r) WiFi/Bluetooth Card, it may work with the OpenIntelWireless kext. Check [OpenIntelWireless](https://github.com/OpenIntelWireless) to find out if your card is supported (yet). If so, remove the BluetoolFixup and Brcm Kexts, add the required Kext(s) card to your kext folder and `config.plist` before trying to boot from this EFI!

6. **Alternative/Optional Kexts**:
	- [**itlwm**](https://github.com/OpenIntelWireless/itlwm): Kext for Intel WiFi Cards. Use instead of `AirportBrcmFixup`if you don't use a Broadcom WiFi Card
	- [**IntelBluetoothFirmware**](https://github.com/OpenIntelWireless/IntelBluetoothFirmware): Kext for Intel Bluetooth Cards. Use instead of `BrcmPatchRam` and Plugins if you don't use a Broadcom BT Card
	- [**NoTouchID**](https://github.com/al3xtjames/NoTouchID): only required for macOS 10.13 and 10.14 so the boot process won't stall while looking for a Touch ID sensor.
	- [**Feature Unlock**](https://github.com/acidanthera/FeatureUnlock): Unlocks additional features like Sidecar, NighShift, Airplay to Mac, Universal Control and Content Caching. Under macOS Monterey, Content Caching also requires `-allow_assetcache` boot-arg.

7. **Backlight Brightness Level tweaks** (optional): 
  - Set boot-arg `applbkl=1` for reasonable maximum brightness level controlled by `WhateverGreen`. 
  - Set boot-arg `applbkl=0` for increased maximum brightness as defined in `SSDT-PNLF.aml`
</details>
<details>
<summary><strong>EFI Handling</strong></summary>

### EFI How To
0. Download the EFI Folder from the `Releases` Section on the right and unpack it
1. Open config.plist and follow the instructions given in the "Preparation" Section
2. Mount the EFI
3. Replace EFI Folder
4. Restart
5. **IMPORTANT**: Perform a NVRAM Reset (in Bootpicker, hit Space Bar to reveal Tools)
6. Reboot
7. Select macOS to boot. It's currently configured for running macOS Mojave up to Monterey. You can research a suitable/matching SMBIOS for your CPU on everymac.com.
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
**Coming from Windows/Linux**: If you are on Windows or Linux, follow the guide provided by [Dortania](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/#making-the-installer). **NOTE**: No support from my end for issues related to UBS Installers created in Windows or Linux!

**Coming from macOS**: If you already have access macOS, you can either download macOS from the App Store or use [**ANYmacOS**](https://www.sl-soft.de/en/anymacos/) instead. It's a hassle-free app than can download any macOS from High Sierra up to Monterey and can create an USB Installer as well.

**macOS Monterey**: For installing macOS Monterey follow the `Monterey Instructions-md` included in the EFI Downloads you find the [Releases](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases) Section.
</details>

## POST-INSTALL
<details>
<summary><strong>Strengthen Security</strong></summary>
Change the following settings to make your system more secure:

- Change UEFI > APFS: `MinDate` and `MinVersion` from `-1` (disabled) to the correct values for the macOS version you are using. A list with the correct values for macOS High Sierra up to Big Sur can be found [here](https://github.com/acidanthera/OpenCorePkg/blob/master/Include/Acidanthera/Library/OcApfsLib.h).</br>

	**BACKGROUND**: OpenCore 0.7.2 introduced a new security feature which prevents loading the APFS driver if it does not match a specific Date and Version. If these values are left at their default `0`, your macOS partition will not show up in the Boot Picker unless macOS Big Sur or newer is installed since the APFS driver will not be loaded. For ease of use (and since I don't know which macOS you will be using) I've deactivated this feature. If you plan to setup a multiboot system running various iterations of macOS you probably should leave it at `-1`. Otherwise you won't be able to boot older OSes.

**NOTE**: You should test this setting first, booting from a USB Stick since it can prevent the system from booting.
</details>
<details>
<summary><strong>Fixing CPU Power Management</strong></summary>

### Fixing CPU Power Management 
1. Open Config
2. Disable `SSDT-PM.aml` under ACPI > Add
3. Enable the 2 Patches under ACPI > Delete (`Drop CpuPm` and `Drop Cpu0Ist`)
4. Save config and reboot
5. Install [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
6. Open Terminal and type: sudo /Users/YOURUSERNAME/ssdtPRGen.sh
7. Go to Users/YOURUSERNAME/Library/ssdtPRGen. There you'll find an ssdt.aml
8. Rename `ssdt.aml` to `SSDT-PM.aml` and replace the one in EFI > OC > ACPI with it
9. In config, go to ACPI > Add and re-enable `SSDT-PM.aml` if it is disabled.
10. Disable the two patches from step 2 again.
11. Save config and reboot. 

CPU Power Management should work fine after that. Optionally, you can install [Intel Power Gadget](https://www.intel.com/content/www/us/en/developer/articles/tool/power-gadget.html) to check if the CPU runs within specs. You don't need SMCProcessor and SMCSuperIO kexts if you use Intel Power Gadgets, btw.

**NOTEs**: 

- Only necessary if you use a different CPU than i7 3630QM
- You can add modifiers to the terminal command for building SSDT-PM. For example, you can drop the low frequency from the default 1200 MHz to 900 MHz in 100 MHz increments, but no lower than that. Otherwise the system crashes during boot. I suggests you experiment with the modifiers a bit.
- If you feel really confident and enthusiastic you could also re-enable XCPM. But in my experience the machine does not perform as good. You can [follow this guide](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/tree/main/Enable%20XCPM) if you're so inclined.<br>
- If you are running macOS Big Sur or Monterey, you can achieve better thermals (with a lot less fan activity) if you define the System as `MacBookPro10,1` instead of `MacBookPro11,1` (Big Sur) or `MacBookPro11,4` (Monterey). But then you also need to add the boot-arg `-no_compat_check`. Otherwise your system won't boot since macOS Monterey is not supposed to run on anything older than MacBookPro11,4. The downside of using `-no_compat_check` is that you won't be able to download System Updates directly (use ANYmacOS instead). But in my opinion, using `MacBookPro10,1` makes much more sense because the system is more power efficient and silent since the idle Frequency is around 800 mHz lower.
- Since Big Sur requires `MacBookPro11,1` to boot and Monterey `MacBookPro11,4`, `ssdtPRGen` fails to generate SSDT-PM, because it relies on Board-IDs containing data for Plugin-Type 0. As a workaround, you can either:

	- use `SSDTTime` to generate a `SSDT-PLUG.aml` **or** 
	- use `MacBookPro10,1` but add `-no_compat_check` to `boot-args`.

**Advantages** of using `MacBookPro10,1` with `-no_compat_check` are:

- You can boot Big Sur **and** use ssdtPRGen. 
- The CPU runs at lower clock speeds in idle since this SMBIOS was written for Ivy Bridge, while 11,x was written for Haswell CPUs. Therefore the CPU produces less heat and the machine runs quieter.
- Another benefit of using `MacBookPro10,1` is that you get the correct P-States and C-States for your CPU from ssdtPRGen.

**Disadvantage** of using `MacBookPro10,1`: you won't be able to install System Updates because you won't be notified about them. But there's a simple **workaround**:

  - Change `SystemProductName` back to `MacBookPro11,4`
  - Set `csr-active-config` to `EF0F0000`
  - Disable `-no_compat_check` boot-arg (add a '#' in front of it)
  - Reboot
  - Reset NVRAM
  - Boot macOS
  - Check for and install Updates
  - After the Updates are installed, revert to SMBIOS `MacBookPro10,1`
  - re-enable `-no_compat_check` boot-arg 
  - Reboot
</details>
<details>
<summary><strong>Fixing Sleep Issues</strong></summary>

### Fixing SLeep issues
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

If the "</>" and "^" Keys are switched you could try changing "Use ISO layout keyboard" from false to true in the `info.plist` of the `VoodooPS2Keyboard.kext` (resides inside of `VoodooPS2Controller.kext` as a Plugin). 

</details>
<details>
<summary><strong>Changing Themes</strong></summary>

### Changing Themes
Besides the 3 default themes by Acidanthera included in the OpenCore package, I've added an additional theme by Blackosx called BsxM1 which is set as default. To change the theme to something else, do the following: 

- Open `config.plist` in OpenCore Auxiliary Tools
- Go to Misc > Boot 
- Select a different theme from the dropdown menu in `PickerVariant`
- Save `config.plist` and reboot to apply the theme.

To revert these changes, enter `Acidanthera\GoldenGate` as `PickerVariant` and change the Flavour for the NVRAM Reset Tool back to `Auto`.
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

![Screenshot](https://raw.githubusercontent.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/main/Pics/benchmark_latest.png)</br>
[Benchmark Results](https://browser.geekbench.com/v5/cpu/9553877)

## CREDITS and THANK YOUs

- George Kushnir for [1vyrain Jailbreak](https://github.com/n4ru/1vyrain) to remove WLAN whitelist from BIOS
- Acidanthera and Team for [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) and additional Kexts
- Dortania for [OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide)
- SergeySlice for [Clover Bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- chris1111 for [IntelHD4000 Patcher](https://github.com/chris1111/Patch-HD4000-Monterey) for macOS Monterey and OC Themes
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
- Pavo-IM for [OC-Gen-X](https://github.com/Pavo-IM/OC-Gen-X)
- jsassu20 for [MacDown](https://macdown.uranusjr.com/) Markdown Editor
