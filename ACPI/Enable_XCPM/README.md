# Enabling XCPM for Ivy Bridge CPUs
>**Compatibility**: macOS Catalina and newer

## Background: 
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management up to macOS Big Sur. Since macOS Monterey 12.3+, Apple dropped the 'plugin-type' check within X86PlatformPlugin. This will load the plugin automatically so that `SSDT-PLUG` is no longer required. Since macOS Ventura removed the `ACPI_SMC_PlatformPlugin`, `SSDT-PM` tables generated for 'plugin-type' 0 can't attach to the mising plugin and therefore CPU Power management won't work corectly any more (no Turbo states). So when switching to macOS Ventura, re-generating you SSDT-PM with XCPM Support is mandatory!

Although `XCPM` is supported by Ivy Bridge CPUs natively. But there isn't much info about how to re-enable it in OpenCore's documentation:

>Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. `_xcpm_bootstrap` should manually be patched to enforce XCPM on these CPUs […].

So that's exactly what we are going to do: re-enable `XCPM` with a kernel patch, 2 kernel quirks and a modified `SSDT-XCPM.aml` or `SSDT-PLUG.aml` to use the `X86PlatformPlugin` (i.e. setting Plugin Type to `1`).

**NOTE:** Enabling `X86PlatformPlugin` for Ivy Bridge CPUs is not recommended – in my experience the CPU performance is worse than using the legacy plugin. This guide only exists to show you that you *can* re-enable it – not that you *should* do it! But when using macOS Monterey and newer it's mandatory since Apple dropped the ACPI_SMC_PlatformPlugin which took care of CPU Power Management on Ivy Bridge and older.

## Requirements:

- **CPU**: Intel Ivy Bridge
- **Supported SMBIOS:** iMac13,x (for Desktops), MacBookPo9,x/10,x (for Notebooks), Macmini6,x (for NUCs)
- **Tools**: Terminal, [**ssdtPRGen**](https://github.com/Piker-Alpha/ssdtPRGen.sh), [**ProperTree**](https://github.com/corpnewt/ProperTree), [**MaciASL**](https://github.com/acidanthera/MaciASL), [**IORegistryExplorer**](https://github.com/utopia-team/IORegistryExplorer) (optional), [**SSDTTime**](https://github.com/corpnewt/SSDTTime) (optional), [**CPUFriendFriend**](https://github.com/corpnewt/CPUFriendFriend) (optional)

## How-To

### 1. Enable `XCPM` for Ivy Bridge:
- Mount the ESP
- Open `config.plist`
- Under `ACPI/Add`, disable `SSDT-PM.aml` (if present)
- Under `ACPI/Delete`, enable rules "**Drop CpuPm**" and "**Drop Cpu0Ist**" (copy them over from XCPM_IvyBridge.plist if missing)
- Under `Kernel/Patch`, enable "XCPM for Ivy Bridge" (copy it over from XCPM_IvyBridge.plist)
- Optional: Adjust `MinKernel` to only enable XCPM for a specific version of macOS (for example Kernel 21.0.0 for Monterey and newer).
- Under `Kernel/Quirks`, enable `AppleXcpmCfgLock` and `AppleXcpmExtraMsrs`
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
- The generated `SSDT.aml` will be located in `~/Library/ssdtPRGen`

The ssdt.aml file contains a summary of all the set parameters. If there is a "1" in the last line, everything is correct:

> Debug = "machdep.xcpm.mode.....: 1"

- Rename `ssdt.aml` to `SSDT-XCPM.aml`
- Copy it to `EFI/OC/ACPI` 
- Add the file to your config.plist in the `ACPI/Add` section
- Under `ACPI/Delete`, disable "**Drop CpuPm**" and "**Drop Cpu0Ist**" again
- Save and reboot

Monitor the behavior of the CPU using Intel Power Gadget. If the CPU Power Management is working correctly, the CPU should step through the whole range of frequencies according to its specs – from the lowest (in idle) to its maximum (when running cpu-intense tasks).
