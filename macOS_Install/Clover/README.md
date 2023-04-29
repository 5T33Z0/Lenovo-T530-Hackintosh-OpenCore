# Clover EFI handling
>**Tested and compatible with**: macOS 10.13 up to macOS 13+</br>
**Recommended macOS**: macOS 10.15.7 Catalina </br>
**SMBIOS**: MacBookPro10,1 (for Core i7), MacBookPro10,2 (for Core i5)

## Info
Clover EFI Folder for running macOS on the Lenovo ThinkPad T530 built from scratch. A lot of T530 Clover configs on the web use a fake Embedded Controller but the T530 has a working `ECDT` Table and uses `LPC` as a bus name instead of `LPCB`.

## Modifying the `config.plist`
In order to adapt the `config.plist` to your hardware and macOS requirements, check the following settings and adjust them accordingly before deployment!

- Open `config.plist`
- `Devices/Properties`
	- Check if the correct Framebuffer-Patch for your display panel is enabled and adjust it accordingly. Two display panels exist: **HD+** (WSXGA and FullHD) and **HD** panels. Both are using different identifiers:</br></br>
	`AAPL,ig-platform-id 04006601` = HD+ = FullHD. Resolution: ≥ 1600x900 px. (Default)</br>
	`AAPL,ig-platform-id 03006601` = HD = SD. Resolution: ≤ 1366x768 px</br></br>
	If your T530 Model uses an SD Panel, do the following:
		- Disable `PciRoot(0x0)/Pci(0x2,0x0)` by placing `##` in front of it.
		- Enable `#PciRoot(0x0)/Pci(0x2,0x0) 1366x768 px` by deleting the leading `#` and the description `1366x768 px`, so that it looks this: `PciRoot(0x0)/Pci(0x2,0x0)`.
	- `PciRoot(0x0)/Pci(0x1B,0x0)`: If you need digital Audio via HDMI/DP, disable/delete key `No-hda-gfx`.
- `SMBIOS`: generate a serial for `MacBookPro10,1` (i7) or `MacBookPro10,2` (i5)
- Adjust `RtVariables/CsrActiveConfig`:
	- macOS Big Sur and newer → `0x803`
 	- macOS Big Sur and newer → `0xFEF` (Disables even more fetaures, breaks system updates. May be necessary for installing HD4000 Drivers in Post-Install)
 	- macOS Mojave/Catalina → `0x7EF`
	- macOS High Sierra → `0x3FF`
- Save `config.plist`
- Copy the EFI Folder to a FAT32 (MBR) formatted USB flash Drive
- Reboot from USB flash Drive
- Reset NVRAM
- Reboot again
- Boot macOS
- If it works, add it to your System's EFI partition

Have phun!

## About conditional Kext-Loading
I've incorporated conditional Kext-Loading, so all Kext requirements for various macOS versions are covered automatically (from macOS High Sierra all the way up to macOS Monterey), so you don't have to worry about it.

**How it works**: Kexts required by *any* macOS are placed in `Kexts\Other`. These will be loaded every time for every macOS. Kexts which are only required by specific versions of macOS are placed in sub-folders corresponding to that macOS version instead (e.g. `10.15`, `11`, `12`, etc.) and will only be loaded once the corresponding macOS version is booted. This way, you don't have to worry about juggling Kexts around between the "off" and "other" folders. 

This method is similar to the `MinKernel` and `MaxKernel` parameters used in OpenCore – although not as elegant – since this requires duplicate kexts which all have to be updated once a new version of a kext is available.

## Running macOS Monterey and newer
macOS Monterey and newer require patching-in the Drivers for the Intel HD 4000 on-board graphics in Post-Install using OpenCore Legacy Patcher. Read the included macOS install instructions for details.
