# Enabling XCPM for Ivy Bridge CPUs (not recommended)

## Background: 
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management up to macOS Big Sur. Since macOS Monterey 12.3+, Apple dropped the 'plugin-type' check within X86PlatformPlugin. This will load the plugin automatically so that `SSDT-PLUG` is no longer required. Since macOS Ventura removed the `AppleIntelCPUPowerManagement.kext` which housed the `ACPI_SMC_PlatformPlugin`, `SSDT-PM` tables generated for 'plugin-type' 0 can't attach to the mising plugin and therefore CPU Power management won't work corectly any more (no turbo states). So when switching to macOS Ventura, re-generating you SSDT-PM with XCPM Support is mandatory!

although `XCPM` is supported by Ivy Bridge CPUs natively. But there isn't much info about how to re-enable it in OpenCore's documentation:

>Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. `_xcpm_bootstrap` should manually be patched to enforce XCPM on these CPUs […].

So that's exactly what we are going to do: re-enable `XCPM` with a kernel patch, 2 kernel quirks and a modified `SSDT-XCPM.aml` or `SSDT-PLUG.aml` to use the `X86PlatformPlugin` (i.e. setting Plugin Type to `1`).

**NOTE:** Enabling `X86PlatformPlugin` for Ivy Bridge CPUs is not recommended – in my experience the CPU performance is worse than using the legacy plugin. This guide only exists to show you that you *can* re-enable it – not that you *should* do it! 

## Compatibility: macOS Catalina to Big Sur

## Requirements:

* Intel Ivy Bridge CPU
* **Tools**: 
	* Terminal 
	* [**ssdtPRGen**](https://github.com/Piker-Alpha/ssdtPRGen.sh)
	* [**CPUFriendFriend**](https://github.com/corpnewt/CPUFriendFriend)
	* [**Plist Editor**](https://github.com/ic005k/PlistEDPlus)
	* [**MaciASL**](https://github.com/acidanthera/MaciASL) (optional)
	* [**IORegistryExplorer**](https://github.com/utopia-team/IORegistryExplorer) (optional)
	* [**SSDTTime**](https://github.com/corpnewt/SSDTTime) (optional)

## How-To:

### 1. Enable XCPM for Ivy Bridge:
* Open `config.plist`
* Under `ACPI > Add`, disable `SSDT-PM.aml` (if present)
* Under `ACPI > Delete`, enable "Drop CpuPm" and "Drop Cpu0Ist"
* Under `Kernel > Patch`, enable "XCPM for Ivy Bridge" 
* Under `Kernel > Quirks`, enable `AppleXcpmCfgLock` and `AppleXcpmExtraMsrs`
* Under `PlatformInfo`, change `SystemProductName` to `MacBookPro11,4`
* Save.
* Reboot.

After a succesful reboot, run Terminal and enter: `sysctl machdep.xcpm.mode`. If the output is `1`, XCPM is working, if the output is `0`, it is not.

### 2. Generate a modified `SSDT-PM` for optimizing CPU Power Management

#### Method 1: using ssdtPRGen (SMBIOS ≤ MacBookPro10,x only)

Next, we need to generate a new SSDT-PM with ssdtPRGen for optimzed CPU power management. Since it generatea SSDTs without XCPM support by default, we have to modify the command line in terminal.

Terminal command for ssdtPRGen: `sudo /Users/YOUR_USERNAME/ssdtPRGen.sh -x 1`

`-x 1` sets plugin type to 1

The finished ssdt.aml and ssdt.dsl are located in `/Users/YOUR_USERNAME/Library/ssdtPRGen`

A look into the ssdt.aml file list a summary of all settings for the SSDT. If there is a "1" in the last line, everything is correct:

> Debug = "machdep.xcpm.mode.....: 1"

* Rename the newly generated "ssdt.aml" to "SSDT-XCPM.aml" or "SSDT-PLUG.aml"
* Copy it to EFI > OC > ACPI (backup or rename the original)
* Update your config.plist
* Reboot
* Enter in terminal: `sysctl machdep.xcpm.mode`

If the output is "1", the `X86PlatformPlugin` is active, otherwise it is not.

#### Method 2: using CPUFriendFriend (SMBIOS ≥ MacBookPro11,x)
Since macOS Big Sur and Monterey require `MacBookPro11,1` (`MacBookPro11,4` on Monterey) to boot, `ssdtPRGen` fails to generate a SSDT-PM.aml, because it relies on Board-IDs containing data for Plugin-Type 0. As a workaround, you can either:

- Use `CPUFriendFriend` to generate a `SSDT_Data.aml` (llcated in "Result" Folder inside of "CPUFriendFriend-master") **or** 
- use `MacBookPro10,1`, add `-no_compat_check` to `boot-args`, reboot and then you can use `ssdtPRGen`

**Advantages** of using `MacBookPro10,1` with `-no_compat_check` boot-arg:

- You can boot macOS Big Sur/Monterey **and** use `ssdtPRGen` to generate a SSDT-PM.
- The CPU runs at a lower idle frequency, since this SMBIOS was written for Ivy Bridge, while 11,x was written for Haswell CPUs. 
- The CPU produces less heat and the machine runs quieter since fans ramp up later.
- Another benefit of using `MacBookPro10,1` is that you get the correct P-States and C-States for your CPU from ssdtPRGen.

**Disadvantages** of using `MacBookPro10,1` with `-no_compat_check`: You won't be able to install System Updates because you won't be notified about them, but theres a simple workaround. 

**Workaround**:

  - Change `SystemProductName` back to `MacBookPro11,1` or `MacBookPro11,4` (for macOS Monterey)
  - Set `csr-active-config` to `67080000` (for Big Sur/Monterey)
  - Disable `-no_compat_check` boot-arg (add a '#' in front of it)
  - Reboot
  - Reset NVRAM
  - Boot macOS
  - Check for Updates and install them
  - After the Updates are installed, revert to SMBIOS `MacBookPro10,1`
  - re-enable `-no_compat_check` boot-arg 
  - Reboot
