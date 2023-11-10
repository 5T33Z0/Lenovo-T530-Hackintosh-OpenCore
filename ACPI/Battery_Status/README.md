## Enabling Battery Status Indicator on the Lenovo T530

Although the Battery Status Indicator is already working in both my Clover and OpenCore EFIs, this is kept for documentation purposes.

To enable the battery status indictaor in macOS, two methods exist (use either or):

- **Method 1**: Using `ECEnabler.kext` (new, default)
- **Method 2**: Using a combination of Binary Renames and `SSDT-BATTERY.aml` (old, obsolete method)

### Method 1: Using `ECEnabler.kext` (default)
Since my EFI is alread configured to use `ECENabler.kext` to display Battery Status, there's nothing to do here.

- Add `ECEnabler.kext` to `EFI/OC/Kexts` and your config.plist (OpenCore only)
- Disable previously used patches (SSDT-BATTERY.aml and corresponding Binary Renames)
- Save and reboot

### Method 2: Using Binary Renames and SSDT (Clover/OpenCore)
This is the previoulsy uses method from the era before ECEnabler existed. It's still valid and if ECEnabler might no longer work in the future or if you prefer to enable Battery Status via ACPI patching, you still can. 

**OpenCore**:

- Disable `ECEnabler.kext` (if present) 
- Open `Battery_Patches_OC.plist` with a plist Editor
- Copy the entries in the `ACPI/Add `and `ACPI/Patch` sections to the respective sections of your config.plist and save it.
- Copy `SSDT-BATTERY.aml` to `EFI/OC/ACPI`
- Reboot

**Clover**:

- Disable/Delete `ECEnabler.kext` (if present)
- Open `Battery_Patches_Clover.plist` with a plist Editor
- Copy the entries from `ACPI/DSDT/Patches` to the corresponding section of your config.plist and save it.
- Copy `SSDT-BATTERY.aml` to: `/EFI/CLOVER/ACPI/patched`
- Reboot
