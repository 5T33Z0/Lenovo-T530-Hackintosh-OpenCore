# Enabling XCPM for Ivy Bridge CPUs

## Background: 
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management up to macOS Big Sur. Since macOS Monterey 12.3+, Apple dropped the 'plugin-type' check within X86PlatformPlugin. This will load the plugin automatically so that `SSDT-PLUG` is no longer required. Since macOS Ventura removed the `ACPI_SMC_PlatformPlugin`, `SSDT-PM` tables generated for 'plugin-type' 0 can't attach to the mising plugin and therefore CPU Power management won't work corectly any more (no Turbo states). So when switching to macOS Ventura, re-generating you SSDT-PM with XCPM Support is mandatory!

although `XCPM` is supported by Ivy Bridge CPUs natively. But there isn't much info about how to re-enable it in OpenCore's documentation:

>Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. `_xcpm_bootstrap` should manually be patched to enforce XCPM on these CPUs […].

So that's exactly what we are going to do: re-enable `XCPM` with a kernel patch, 2 kernel quirks and a modified `SSDT-XCPM.aml` or `SSDT-PLUG.aml` to use the `X86PlatformPlugin` (i.e. setting Plugin Type to `1`).

**NOTE:** Enabling `X86PlatformPlugin` for Ivy Bridge CPUs is not recommended – in my experience the CPU performance is worse than using the legacy plugin. This guide only exists to show you that you *can* re-enable it – not that you *should* do it! But when using macOS Monterey and newer it's mandatory since Apple dropped the ACPI_SMC_PlatformPlugin which took care of CPU Power Management on Ivy Bridge and older.

## Compatibility: macOS Catalina to Ventura

## Requirements:

- **CPU**: Intel Ivy Bridge
- **Supported SMBIOS:** iMac13,x (for Desktops), MacBookPo9,x/10,x (for Notebooks), Macmini6,x (for NUCs)
- **Tools**: Terminal, [**ssdtPRGen**](https://github.com/Piker-Alpha/ssdtPRGen.sh), [**ProperTree**](https://github.com/corpnewt/ProperTree), [**MaciASL**](https://github.com/acidanthera/MaciASL), [**IORegistryExplorer**](https://github.com/utopia-team/IORegistryExplorer) (optional), [**SSDTTime**](https://github.com/corpnewt/SSDTTime) (optional), [**CPUFriendFriend**](https://github.com/corpnewt/CPUFriendFriend) (optional)

## How-To

### 1. Enable XCPM for Ivy Bridge:
- Mount the ESP
- Open `config.plist`
- Under `ACPI/Add`, disable `SSDT-PM.aml` (if present)
- Under `ACPI/Delete`, enable rules "Drop CpuPm" and "Drop Cpu0Ist" (get them from Sample.plist included in OpenCore Package if missing)
- Under `Kernel/Patch`, enable "XCPM for Ivy Bridge" (copy it over from XCPM_IvyBridge.plist)
- Optional: Adjust `MinKernel` to only enable XCPM for a specific version of macOS (for example Kernel 21.0.0 for Monterey and newer).
- Under `Kernel/Quirks`, enable `AppleXcpmCfgLock` and `AppleXcpmExtraMsrs`
- Under `PlatformInfo`, change `SystemProductName` to `MacBookPro11,4`
- Save and reboot

After a succesful reboot, run Terminal and enter: 

```shell
sysctl machdep.xcpm.mode
```
If the output is `1`, XCPM is working, if the output is `0`, it is not.

### 2. Generate `SSDT-XCPM` for optimizing CPU Power Management

#### Method 1: using ssdtPRGen
Next, we need to generate a new SSDT-PM with ssdtPRGen for optimzed CPU power management. Since it generatea SSDTs without XCPM support by default, we have to modify the command line in terminal.

- Open Terminal
- Enter the following command to download the ssdtPRGen Script: `curl -o ~/ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/Beta/ssdtPRGen.sh`
- Make it executable: `chmod +x ~/ssdtPRGen.sh` 
- Run the script: `sudo ~/ssdtPRGen.sh -x 1`
- The generated `SSDT.aml` will be located at `~/Library/ssdtPRGen`

A look into the ssdt.aml file list a summary of all settings for the SSDT. If there is a "1" in the last line, everything is correct:

> Debug = "machdep.xcpm.mode.....: 1"

- Rename the newly generated "ssdt.aml" to "SSDT-XCPM.aml"
- Copy it to `EFI/OC/ACPI`
- Update your `config.plist`
- Save and reboot
- Enter in Terminal: `sysctl machdep.xcpm.mode`

If the output is "1", the `X86PlatformPlugin` is active, otherwise it is not.

#### Method 2: using CPUFriendFriend
Since macOS Big Sur and Monterey require an SMBIOS witch support Plugin-Type 1 to boot, `ssdtPRGen` fails to generate the ssdt because it relies on Board-IDs containing data for Plugin-Type 0. As a workaround, you can either:

- Use `CPUFriendFriend` to generate a `SSDT_Data.aml` (located in "Result" Folder of "CPUFriendFriend-master") **or** 
- Use Ivy Bridge SMBIOS, add `-no_compat_check` to `boot-args`, reboot and then you can use `ssdtPRGen`

**Advantages** of using Ivy Bridge SMBIOS with `-no_compat_check` boot-arg:

- You can boot macOS Big Sur/Monterey **and** use `ssdtPRGen` to generate a SSDT-PM.
- The CPU runs at a lower idle frequency, since this SMBIOS was written for Ivy Bridge, while 11,x was written for Haswell CPUs. 
- The CPU produces less heat and the machine runs quieter since fans ramp up later.
- Another benefit of using `MacBookPro10,1` is that you get the correct P-States and C-States for your CPU from ssdtPRGen.

**Disadvantages** of using an Ivy Bridge SMBIOS with `-no_compat_check`: You won't be able to install System Updates because you won't be notified about them, but theres a simple workaround. 

**Workaround**: [**Enable board-id VMM spoof**](https://github.com/5T33Z0/OC-Little-Translated/tree/main/09_Board-ID_VMM-Spoof). This allows using the recommended SMBIOS for Ivy Bridge CPUs for optimal CPU Power Management, running macOS Monterey as well as installing macOS Updates.

