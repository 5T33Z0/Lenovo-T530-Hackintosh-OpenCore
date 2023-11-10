# Enabling XCPM for Ivy Bridge CPUs
> **Compatibility**: macOS Catalina and newer

## Background
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management up to macOS Big Sur.

Although Ivy Bridge CPUs are capable of utilizing `XCPM`, it's deactivated in macOS. And there isn't much info about how to re-enable it in OpenCore's documentation:

> Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. `_xcpm_bootstrap` should manually be patched to enforce XCPM on these CPUs […].

This guide explains re-enable `XCPM` with a kernel patch, 2 kernel quirks and a modified `SSDT-XCPM.aml` or `SSDT-PLUG.aml` to use the `X86PlatformPlugin` (i.e. setting Plugin Type to `1`).

> [!WARNING] 
> 
> Enabling `X86PlatformPlugin` for Ivy Bridge CPUs is not recommended – in my experience CPU performance is worse than using the legacy plugin. This guide only exists to show you that you *can* re-enable it – not that you *should* do it!

### macOS Monterey
With the release of macOS Monterey, Apple dropped the Plugin-Type check, so that the `X86PlatformPlugin` is loaded by default. For Haswell and newer CPUs this is great, since you no longer need `SSDT-PLUG` to enable Plugin-Type 1. But for Ivy Bridge and older, you now need to select Plugin-Type 0 explicitly. If you've previously generated an `SSDT-PM` with ssdtPRGen, it's already configured to use Plugin-Type 0, so ACPI CPU Power Management is still working. From macOS Ventura onwards, it's a different story…

### macOS Ventura and newer
When Apple released macOS Ventura, they removed the actual `ACPI_SMC_PlatformPlugin` binary from the `ACPI_SMC_PlatformPlugin.kext` itself (previously located under S/L/E/IOPlatformPluginFamily.kext/Contents/PlugIns/ACPI_SMC_PlatformPlugin.kext/Contents/MacOS/), rendering `SSDT-PM` generated for Plugin-Type 0 useless since it cannot utilize a plugin which is no longer present. Instead, the `X86PlaformPlugin` is loaded by default. Therefore, CPU Power Management doesn't work correctly on legacy Intel CPUs out of the box (no turbo states, incorrect LFM frequency, higher average clock). So when switching to macOS Ventura or newer, you either have to:

- [**Re-enable ACPI CPU Power Management**](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/CPU_Power_Management/CPU_Power_Management_(Legacy)#re-enabling-acpi-power-management-in-macos-13-and-newer) (recommended, default in my EFI)
- Force-enable XCPM (Ivy Bridge only) (not recommended)

## Requirements:

- **CPU**: Intel Ivy Bridge
- **Supported SMBIOS:** iMac13,x (for Desktops), MacBookPo9,x/10,x (for Notebooks), Macmini6,x (for NUCs)
- **Tools**: Terminal, [**ssdtPRGen**](https://github.com/Piker-Alpha/ssdtPRGen.sh), [**ProperTree**](https://github.com/corpnewt/ProperTree), [**MaciASL**](https://github.com/acidanthera/MaciASL), [**IORegistryExplorer**](https://github.com/utopia-team/IORegistryExplorer) (optional), [**SSDTTime**](https://github.com/corpnewt/SSDTTime) (optional), [**CPUFriendFriend**](https://github.com/corpnewt/CPUFriendFriend) (optional)

## Instructions

### 1. Enable `XCPM` for Ivy Bridge:
- Mount the ESP
- Open `config.plist`
- Under `ACPI/Add`, disable `SSDT-PM.aml` (if present)
- Under `ACPI/Delete`, enable rules "**Drop CpuPm**" and "**Drop Cpu0Ist**" (copy them over from XCPM_IvyBridge.plist if missing)
- Under `Kernel/Patch`, enable "XCPM for Ivy Bridge" (copy it over from XCPM_IvyBridge.plist if missing)
- Optional: Adjust `MinKernel` to only enable XCPM for a specific version of macOS (for example `21.0.0` for Monterey and newer).
- Under `Kernel/Quirks`, enable `AppleXcpmCfgLock` and `AppleXcpmExtraMsrs`
- Save and reboot

After a succesful reboot, run Terminal and enter: 

```shell
sysctl machdep.xcpm.mode
```
If the output is `1`, XCPM is working, if the output is `0`, it is not.

### 2. Generate `SSDT-XCPM` for optimizing CPU Power Management

#### Method 1: using ssdtPRGen
Next, we need to generate a new SSDT with ssdtPRGen for optimzed CPU power management. Since it generatea SSDTs without XCPM support by default, we have to modify the command line in terminal.

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
