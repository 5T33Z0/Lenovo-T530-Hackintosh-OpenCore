# Lenovo ThinkPad T530 Hackintosh OpenCore

**5T4TU5**: 100% Completed!

[![T530](https://img.shields.io/badge/ThinkPad-T530-informational.svg)](https://psref.lenovo.com/syspool/Sys/PDF/withdrawnbook/ThinkPad_T530.pdf)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.6.9-orange.svg)](https://github.com/acidanthera/OpenCorePkg/releases/latest)
[![MacOS High Sierra](https://img.shields.io/badge/macOS-10.13.6-white.svg)](https://support.apple.com/kb/SP765?locale=en_US) 
[![MacOS Catalina](https://img.shields.io/badge/macOS-10.15.7-white.svg)](https://www.apple.com/li/macos/catalina/) 
[![MacOS Big Sur](https://img.shields.io/badge/macOS-11.2.3-white.svg)](https://www.apple.com/macos/big-sur/)
[![release](https://img.shields.io/badge/Download-latest-success.svg)](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/releases)

![](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Pics/BootPicker.png)

## SUMMARY

This Repo contains an EFI Folder with configs for running macOS Catalina and Big Sur with either a patched `DSDT` or `DSDT-less` on a Lenovo T530 Laptop using OpenCore. Compatible and tested with: macOS High Sierra, Catalina and Big Sur.

**NOTE**: Please read the README carefully and follow the instructions.

## PICK a CONFIG

The EFI Folder contains 2 configs. The 1st utilizes a patched `DSDT` and works flawlessly. The 2nd config is DSDT-less, solely based on binary Renames and SSDT Hotpatches – just like it's suppossed to be done in OpenCore. It's not working perfectly (99 %) but overall, it runs smoother and snappier than the DSDT-based config and also performs better according to the test results in Geekbench.

<details>
<summary><strong>DSDT-less config (recommended)</strong></summary>

### Hotpatch-based config (DSDT-less)
This config is for running macOS without a patched `DSDT` – it relies solely on binary Renames and ACPI Hotpatches (SSDTs) instead, which is the recommended method for using OpenCore anyway. You need to rename it to `config.plist` in order to make it bootable.

Since this method does not rely on a patched DSDT which might mismatch the system's DSDT for the installed BIOS, the process of hotpatching is more precise and independent of the installed BIOS version.

So, instead of just replacing the whole system `DSDT` with a patched one during the boot process, only the things which need fixing are patched-in on the fly. This makes the system boot faster, run smoother and snappier and slightly improves overall performance as well.

**NOTE**: by default, the iGPU (IntelHD 4000) is configured for T530 models with `HD+` panels (≥1600x900 px). If you have a model with a `HD` panel (1366x768), you need to enable the other Framebuffer-Patch under `DevicePropeties` instead. See the section "Preparation: Do's and Dont's" for Details.
</details>
<details>
<summary><strong>DSDT-based config</strong></summary>

### DSDT-based config
This config is working 100% for T530 Models and supports both HD and HD+ display panels.

If you simply want to a well-running system, use this config! You need to rename it to `config.plist` in order to boot with this. But before you do, open the config and have a look at the `ACPI > Add` section. Enable either `DSDT-HD.aml` or `DSDT-HD+.aml` *(never both)* depending on the display panel of your T530:

`AAPL,ig-platform-id` `04006601` = **HD+** = 1600x900 px  
`AAPL,ig-platform-id` `03006601` = **HD** = 1366x768 px

Check the comments of the entries to decide which one you need to enable. By default, the DSDT for HD+ panels is enabled.
</details>

## HARDWARE SPECS
<details>
<summary><strong>ThinkPad Model</strong></summary>

### ThinkPad T530 Specs 
| Component           | Details                                       |
| ------------------: | :-------------------------------------------- |
| Model               | Lenovo ThinkPad T530, Model# 2429-62G         |
| BIOS Version        | 2.77, unlocked with IvyRain                   |
| Processor           | Intel(r) Core i7 3630QM                       |
| Memory              | 16GB Samsung DDR3 1600MHz, Dual-Channel       |
| Hard Disk           | Samsung 840 Evo 250GB                         |
| Integrated Graphics | Intel(r) HD Graphics 4000                     |
| Display             | 15.6" HD+ TFT Display (1600x900 px)           |
| Audio               | Realtek ALC269VC Rev.3 (Layout-id:`29`)       |
| Ethernet            | Intel(r) 82579LM Gigabit Network Connection   |
| WIFI+BT             | Broadcom BCM94352HMB DW1550, 802.11 a/b/g/n/ac|
| Docking Stattion    | Lenovo ThinkPad 4338 Mini Dock plus Series 3  |
</details>
<details>
<summary><strong>Incompatible Components</strong></summary>

### Incompatible Hardware
- [ ] NVIDIA Optimus GPU is not supported by macOS and must be disabled in BIOS - otherwise no Boot!
- [ ] Fingerprint Reader - model not supported by macOS
- [ ] VGA Port is not working: [Intel HD Graphics VGA Support](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md#vga-support)
</details>

## INSTALLATION
<details>
<summary><strong>Preparation: Do's and Dont's</strong></summary>

### Do's and Dont's
Before you copy the EFI onto your system SSD/HDD, you should do the following:

- **CAUTION**: Test the EFI first, using a FAT32 formatted USB Stick!
- **SMBIOS**: Create SMBIOS infos using GenSMBIOS and add the data to `PlatformInfo > Generic`
- **Integrtaed Graphics**: 
Two variants of T530 models with different display panels and screen resolutions exist: `HD+` and `HD` models. Both are using different identifiers:

	`AAPL,ig-platform-id 04006601` = HD+ ≥ 1600x900 px
	`AAPL,ig-platform-id 03006601` = HD = 1366x768 px

	By default, the Framebuffer-Patch for `HD+` models is enabled in the config under `DeviceProperties` > `PciRoot(0x0)/Pci(0x2,0x0)`.

	If your model uses a `HD` panel, you need to disable `PciRoot(0x0)/Pci(0x2,0x0)` by placing a `#` in front of it. 
	Next, enable "#PciRoot(0x0)/Pci(0x2,0x0) 1366x768 px" instead. Delete the leading `#` and the description after the bracket, so that it looks this: `PciRoot(0x0)/Pci(0x2,0x0)`.
	
	**HINT**: if your screen turns off during boot, you are using the wrong Framebuffer-Patch!

- **System Integrity Protection (SIP)**
  - For Catalina: `MacBookPro10,1` or 10,2 (depending on CPU) and `csr-active-config: FF070000` to deactivate SIP
  - For Big Sur: `MacBookPro11,1` or 11,2 (depending on CPU) and `csr-active-config: 67080000` to deactivate SIP
- **CPU**
  - The `SSDT-PM.aml` inside the ACPI Folder is for an i7 3630QM. If you use a differnt CPU, disable it in the config and create your own using `ssdtPRGEN` in Post-Install. (See 'Fixing CPU Power Management' in 'Post-Install Section')
- **Wifi/Bluetooth**
  - Built-in Intel Wifi/Bluetooth may work. Have a look at [OpenIntelWireless](https://github.com/OpenIntelWireless) to check if your card is supported yet.
  - 3rd Party cards require the `1vyrain` jailbreak to unlock the BIOS in order to disable WLAN Whitelist (unless the 3rd party card is whitelisted)
  - Broadcom cards require an additional kext for Bluetooth. Either `BrcmFirmwareData.kext` in "EFI > OC > Kexts" which will be injected through OpenCore or
    `BrcmFirmwareRepo.kext` which needs to be installed into S/L/E since it cannot be injected by bootloaders, but works a bit more efficient according to the documentation.
  - If you use a card from a different vendor replace the Kext(s) for networking for your device and update your config.
- **Editing/Updating config files:**
  - If you create Snapshots for the DSDT-less config using `ProperTree`, make sure to disable the "ACPI > Add" entries for `DSDT` files afterwards. Best practice would be to delete both DSDTs from the EFI anyway, if you use the DSDT-less config.
  - DON'T create Snapshots for the config_DSDT.plist which is using the DSDT Files. Because this will add all the SSDTs back in, which are unnecessary since all these patches exist in the patched DSDT already. If you plan to use the DSDT-based config, you should delete all of the SSDTs except for `SSDT-PM`.
  - Bootstrap: if you only have macOS installed on your HDD you can disable `BootstrapShort`. To do so, change Misc > Security > BootProtect to `None`.
- **Kexts**
  - `NoTouchID.kext` is no longer necessary for macOS 10.15.7 and beyond, so you can disable it (it's excluded from current release anyway).
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
6. **IMPORTANT**: Perform a NVRAM Reset (in Bootpicker, hit Space Bar and select Clean NVRAM). Especially important when switching from a DSDT to DSDT-less config!
7. Reboot again
8. Select macOS to boot. It's currently configured for running Catalina. If you want to run Big Sur, you need to use SMBIOS 11,x. You can research a suitable/matching SMBIOS for your CPU on everymac.com

**NOTE**: If your macOS Drive or macOS Installer does not shown up in the BootPicker, enable `ConnectDrivers` in the Config located under `UEFI`.
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
If you have already have macOS installed but want to perform a clean install, you can either download macOS from the App Store or use [**ANYmacOS**](https://www.sl-soft.de/en/anymacos/). It's hassl-free App than can download High Sierra, Catalina and Big Sur and also create a USB Installer for you.

If you are on Windows or Linux follow the guide provided by [Dortania](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/#making-the-installer)
</details>

## POST-INSTALL
<details>
<summary><strong>Fixing CPU Power Management</strong></summary>

### Fixing CPU Power Management 
1. Open Config
2. Enable the 2 Patches under "ACPI > Delete" (`Drop CpuPm` and `Drop Cpu0Ist`)
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
**NOTE 3**: If you feel really confident and enthusiastic you could also re-enable XCPM. But in my experience the machine does not perform as good. You can follow this guide if you're so inclined: https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Guides/Enable%20XCPM.md
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
By default, in macOS the [**ALT**] key is the [**CMD**] Key and the [**Windows**] Key is the [**Option Key**]. To switch them around, open System Settings > Keyboard. On the right there's a button for "Special Keys". Just switch the Option and Command keys to the opposite and everything's fine.
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

[Benchmark Results](https://browser.geekbench.com/v5/cpu/7355955)

## CREDITS and THANK YOU's

- George Kushnir for [1vyrain BIOS Jailbreak](https://github.com/n4ru/1vyrain) to remove WLAN whitelist
- Acidanthera and Team for the [OpenCore Bootloader](https://github.com/acidanthera/OpenCorePkg) 
- Dortantia for the [OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide)
- [Corpnewt](https://github.com/corpnewt) for incredibly useful Tools like SSDTTime, GenSMBIOS and ProperTree
- Piker-Alpha for [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
- Daliansky for [OC Little Repo](https://ooh3dpsdytm34sfhws63yjfbwy--github-com.translate.goog/daliansky/OC-little) containing all the ACPI Hotpatches for OpenCore
- [RealKiro](https://github.com/RealKiro/Hackintosh) for Clover EFI with ACPI Patches for referencing
- [Rehabman](https://github.com/RehabMan) for Laptop and DSDT patching guides
- uranusjr for [MacDown](https://github.com/MacDownApp/macdown) Markdown Editor
- [banhbaoxamlan](https://github.com/banhbaoxamlan/X230-Hackintosh) for his X230 repo which had all the files for fixing the LED pulsing issue.
