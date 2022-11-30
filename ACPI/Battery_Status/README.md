## Enabling Battery Status Indicator on the Lenovo T530

Although the Battery Status Indicator is already working in both my Clover and OpenCore EFIs, this is for documenting how to enable it via ACPI.

To enable the battery status indictaor in macOS, two methods exist (use either or):

- **Method 1**: Using `ECEnabler.kext` (new, and currently used method)
- **Method 2**: Using a combination of Binary Renames and `SSDT-BATTERY.aml` (old method)

Since the current set-up of my EFI uses `ECENabler.kext`, there's not much to cover here since the kext takes care of everything. Therefore this section focuses on the old method as a fallback – just in case the Kext may stop working in the furture.

### Method 1: Using `ECEnabler.kext` 

Add ECEnabler kext, update your config.plist (OpenCore only), save and reboot. Done! This is the currently used method so you don't have to do anything

### Method 2: Using Binary Renames and SSDT (Clover/OpenCore)

This is the old school method from the time before ECEnabler existed. It's still valid and if you prefer to enable Battery Status this way, you can.

**In OpenCore**:

- Disable `ECEnabler.kext` (if present) 
- Open `Battery_Patches_OC.plist` with a plist Editor
- Copy the entries in the Sections `ACPI > Add `and `ACPI > Patch` to the respective sections of your config.plist and save it.
- Copy `SSDT-BATTERY.aml` to `EFI/OC/ACPI`
- Reboot

**In Clover**:

- Disable/Delete `ECEnabler.kext` (if present)
- Open `Battery_Patches_Clover.plist` with a plist Editor
- Copy the entries in the Section `ACPI > DSDT > Patches` to the same section of your config.plist and save it.
- Copy `SSDT-BATTERY.aml` to: `/EFI/CLOVER/ACPI/patched`
- Reboot
