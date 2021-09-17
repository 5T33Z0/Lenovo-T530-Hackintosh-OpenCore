# Enabling XCPM for Ivy Bridge CPUs in Catalina and Big Sur

## Background: 
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management, although `XCPM` is supported by Ivy Bridge CPUs natively. But there isn't much info about how to re-enable it in OpenCore's documentation:

> **Note 4:** Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. `_xcpm_bootstrap` should manually be patched to enforce XCPM on these CPUs […].

So that's exactly what we are going to do: re-enable `XPCM` with a kernel patch and a modified `SSDT-PM.aml` or `SSDT-PLUG.aml` to use the `X86PlatformPlugin` (i.e. setting Plugin Type to `1`).

**NOTE:** Enabling `X86PlatformPlugin` for Ivy Bridge CPUs is not recommended – the CPU performance is worse than using the legacy pluign. This guide only exists to show you that you can re-enable it – not that you should do it! 

## Compatibility: macOS Catalina (10.15.5+) to Big Sur (11.3+)

## Requirements:

* Intel Ivy Bridge CPU
* Tools: Terminal, ssdtPRGEN, SSDTTime (optional), Plist Editor, MaciASL (optional), IORegistryExplorer (optional), CPUFriendFriend (optional)
* SMBIOS that supports Ivy Bridge CPUs (like MacBookPro9,x or 10,x)

## How-To:

### 1. Enable XCPM for Ivy Bridge:
* Add the Kernel Patch inside of [XCPM_IvyBridge.plist](https://github.com/5T33Z0/Lenovo-T530-Hackinosh-OpenCore/blob/main/Guides/XCPM_IvyBridge.plist) to your `config.plist` and save it
* Enable `AppleXcpmExtraMsrs` under Kernel > Quirks.
* Save.

### 2. Generate a modified `SSDT-PM` for Plugin Type 1
Next, we need to set the plugin type of SSDT-PM.aml to "1". To do this, we generate a new SSDT-PM with ssdtPRGen. Since it generatea SSDTs without XCPM support by default, we have to modify the command line in terminal.

Terminal command for ssdtPRGen: `sudo /Users/YOUR_USERNAME/ssdtPRGen.sh -x 1`

`-x 1` sets plugin type to 1

The finished ssdt.aml and ssdt.dsl are located in `/Users/YOUR_USERNAME/Library/ssdtPRGen`

A look into the ssdt.aml file list a summary of all settings for the SSDT. If there is a "1" in the last line, everything is correct:

> Debug = "machdep.xcpm.mode.....: 1"

* Rename the newly generated "ssdt.aml" to "SSDT-PM.aml"
* Copy it to EFI > OC > ACPI (backup or rename the original)
* Update your config.plist
* Reboot
* Enter in terminal: `sysctl machdep.xcpm.mode`

If the output is "1", the `X86PlatformPlugin` is active, otherwise it is not.

## NOTE for macOS Big Sur and Monterey Users:
Since macOS Big Sur and Monterey require `MacBookPro11,1` (`MacBookPro11,4` on Monterey) to boot, `ssdtPRGen` fails to generate a SSDT-PM.aml, because it relies on Board-IDs containing data for Plugin-Type 0. As a workaround, you can either:

- use `SSDTTime` to generate a `SSDT-PLUG.aml` **or** 
- use `MacBookPro10,1`, add `-no_compat_check` to `boot-args`, reboot and then you can use `ssdtPRGen`

**Advantages** of using `MacBookPro10,1` with `-no_compat_check` are:

- You can boot Big Sur **and** use ssdtPRGen. 
- The CPU runs at lower clock speeds in idle since this SMBIOS was written for Ivy Bridge, while 11,x was written for Haswell CPUs. Therefore the CPU produces less heat and the machine runs quieter.
- Another benefit of using `MacBookPro10,1` is that you get the correct P-States and C-States for your CPU from ssdtPRGen.

**Disadvantages** of using `MacBookPro10,1`: You won't be able to install System Updates because you won't be notified about them. But there's a simple **workaround**:

  - Change `SystemProductName` back to `MacBookPro11,1` or `MacBookPro11,1` (for macOS Monterey)
  - Set `csr-active-config` to `67080000` (for Big Sur/Monterey)
  - Disable `-no_compat_check` boot-arg (add a '#' in front of it)
  - Reboot
  - Reset NVRAM
  - Boot macOS
  - Check for and install Updates
  - After the Updates are installed, revert to SMBIOS `MacBookPro10,1`
  - re-enable `-no_compat_check` boot-arg 
  - Reboot
