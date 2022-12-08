# Alternate IRQ Fix
If you don't want to use SSDTTime to generate `SSDT-HPET`, you can use this instead.

## Preparations
If present, disable/delete the following:

- Disable `SSDT-HPET`
- Disable ACPI Patches:
	- change _CRS to XCRS, pair with SSDT-HPET
	- RTC IRQ 8 Patch
	- TIMR IRQ 0 Patch 

## Instructions
- Add SSDTs:
	- `SSDT-HPET_RTC_TIMR-Fix.aml` 
	- `SSDT-IPIC.aml`
- Add Renames included in `IRQ_Fix_Renames.plist` to config.plist
- Add AppleALC.kext, Layout-ID `18` or `39` (when using a Dock)
