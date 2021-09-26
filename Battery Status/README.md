## Enabling Battery Status Indicator on the Lenovo T530

Although the Battery Status Indicator is already working in both my Clover and OpenCore EFIs, this is for documenting how to enable it otherwise – just in case you want to use a different method for enabling it.

To enable the battery status indictaor in macOS 2 methods exist:

- **Method 1**: Using `ECEnabler.kext` (new method, current default)
- **Method 2**: Using a combinatiion of Binary Renames and a `SSDT-BATTERY.aml` (old method)

Since the current set-up of my EFI uses `ECENabler.kext` there's not much to cover here since the kext takes care of everything. Therefore this section focuses on the old method as a fallback – just in case the Kext stops working in the furture.

### Method 1: Using ECEnabler.kext
Add the kext, update your config.plist (OpenCore only), save and reboot. Done!

### Method 2: Using Binary Renames and SSDT (Clover/OpenCore)

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