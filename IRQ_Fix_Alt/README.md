# Alternate IRQ Fix
If you don't wnat to use SSDTTime to generate `SSDT-HPET`.

## Instructions

- Add SSDTs:
	- `SSDT-HPET_RTC_TIMR-Fix.aml` 
	- `SSDT-IPIC.aml`
- Add Renames included in `IRQ_Fix_Renames.plist` to config.plist
- Add AppleALC.kext, Layout-ID `18` or `39` (when using a Dock)
