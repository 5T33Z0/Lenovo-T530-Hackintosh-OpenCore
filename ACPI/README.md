# Alternative ACPI Hotfixes

This section contains alternative and optional/cosmetical SSDT Hotfixes which since then have been substituted by kexts or have been dropped. They are included for archival and educational purposes mainly.

- **SSDT-AC** &rarr; Not required son SMC Battery Manager handles this.
- **Battery Status fixes** (SSDT and Binary renames) &rarr; have been replaced by `ECEnabler.kext`
- **Alt. IRQ Fixes** &rarr; more complex SSDT for fixing IRQ and enabling Audio in macOS than the one provided by SSDTTime. I am using those currently because I think the implementation is cleaner.
- **SSDT-PM** &rarr; Collection of SSDT-PM files for various CPU models
- Guide and SSDT for **enabling XCPM** on Ivy Bridge CPUs
