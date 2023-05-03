# Alternate IRQ Fix
If you don't want to use SSDTTime to generate `SSDT-HPET`, you can use this approach instead. It doesn't require binary renames at all and is even more acpi-compliant.

## Preparations
If present, disable/delete the following in your `config.plist`:

- `ACPUI/Add`: 
	- Disable/delete `SSDT-HPET.aml` (and from EFI/OC/ACPI)
- `ACPI/Patch`: 
	- Disable/delete "change _CRS to XCRS, pair with SSDT-HPET"
	- Disable/delete "RTC IRQ 8 Patch"
	- Disable/delete "TIMR IRQ 0 Patch"

## Instructions
- Add `SSDT-IRQSSDT-IRQ_FIXES.aml` to EFI/OC/ACPI and your config.plist
- Change ALC Layout-ID to `18` or `39` (when using a Docking Station)
- Save and reboot

## Notes
- When using a docking station you can now attach external spaekers or a mic to the Audio Jacks of the dock.
- If you want to know how this patch works, [have a look at this ](https://github.com/5T33Z0/OC-Little-Translated/tree/main/01_Adding_missing_Devices_and_enabling_Features/IRQ_and_Timer_Fix_(SSDT-HPET)#if-hpaehpte-does-not-exist)
