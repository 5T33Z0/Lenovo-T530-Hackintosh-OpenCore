## Enabling XCPM for Ivy Bridge CPUs in Catalina and Big Sur

### Background: 
Apple deactivated the `X86PlatformPlugin` support for Ivy Bridge CPUs in macOS a few years back. Instead, the `ACPI_SMC_PlatformPlugin` is used for CPU power management, although `XCPM` is supported by Ivy Bridge natively. But there isn't much info about how to re-enable it in OpenCore's documentation:

> **Note 4:** Note that the following configurations are unsupported by XCPM (at least out of the box): Consumer Ivy Bridge (0x0306A9) as Apple disabled XCPM for Ivy Bridge and recommends legacy power management for these CPUs. _xcpm_bootstrap should manually be patched to enforce XCPM on these CPUs […].

So that's exactly what we are going to do: re-enable XPCM with a kernel patch and create a modified `SSDT-PM.aml` or `SSDT-PLUG.aml` (depending on your OS and SMBIOS Version) to use the `X86PlatformPlugin` (i.e. setting Plugin Type to "1").

#### Compatibility: macOS Catalina (10.15.5+) to Big Sur (11.3 beta)

#### Requirements:

* Intel Ivy Bridge CPU
* Tools: Terminal, ssdtPRGEN, SSDTTime (optional), Plist Editor, MaciASL (optional), IORegistryExplorer (optional), CPUFriendFriend (optional)
* SMBIOS that supports Ivy Bridge CPUs (like MacBookPro9,x or 10,x)

#### HOW-TO:

1) Enabling XCPM for Ivy Bridge

* Import the Kernel Patch inside of "XCPM_IvyBridge.plist" into your config.plist
* Enable `AppleXcpmExtraMsrs` under Kernel > Quirks.

2) Generate a modified SSDT-PM for Plugin Type 1

Next, we need to set the plugin type of SSDT-PM.aml to "1". To do this, we generate a new SSDT-PM with ssdtPRGen. Since it generatea SSDTs without XCPM support by default, we have to modify the command line in terminal.

> **NOTE FOR BIG SUR USERS**: Since Big Sur requires `MacBookPro11,x` to boot, `ssdtPRGen` will not work for generating the the ssdt. As a workaround you could either use `SSDTTime` or stay on `MacBookPro10,1` but add `-no_compat_check` to boot-args. Then you can still boot Big Sur and use use ssdtPRGen. The advantage of using `MacBookPro10,1` with `-no_compat_check` is that the CPU runs at lower clock speeds in idle since this SMBIOS was written for Ivy Bridge while 11,x was written for Haswell CPUs. Another plus is that you get the correct P-States and C-States for your CPU from ssdtPRGen.

The terminal command for ssdtPRGen is: `sudo /Users/YOUR_USERNAME/ssdtPRGen.sh -x 1`

`-x 1` sets plugin type to 1

The finished ssdt.aml and ssdt.dsl are located in `/Users/YOUR_USERNAME/Library/ssdtPRGen`

A look into the ssdt.aml file list a summary of all settings for the SSDT. If there is a "1" in the last line, everything is correct:

> Debug = "machdep.xcpm.mode.....: 1"

* Rename the newly generated "ssdt.aml" to "SSDT-PM.aml"
* Copy it to EFI > OC > ACPI (backup or rename the original)
* Update your config.plist
* Reboot
* Enter in terminal: `sysctl machdep.xcpm.mode`

If the output is "1", the `X86PlatformPlugin` is active, otherwise it is not active.


