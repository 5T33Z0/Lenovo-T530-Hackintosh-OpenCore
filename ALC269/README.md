# Slimmed AppleALC kext for Lenovo T530

**System**: Lenovo ThinkPad T530 </br>
**Codec**: Realtek ALC269 </br>
**Included Layouts**: `18` and `39`</br>
**Slimmed Kext**: AppleALC v1.7.7 ([**Download**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/blob/main/ALC269/Resources/AppleALC-1.7.7-RELEASE.zip?raw=true)) (95 kb) </br>
**Codec Dump**: [**Download**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/blob/main/ALC269/Resources/ALC269_Dump.zip?raw=true)</br>
**Resources Folder:** [**Download**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/blob/main/ALC269/Resources/AppleALC_Resources.zip)

## Codec Schematic
![](https://raw.githubusercontent.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/7980459d36642573cf98038a886dc28558817e2a/ALC269/Resources/codec_dump.svg)

## How to
- Download and extract my latest [**AppleALC build**](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore/blob/main/ALC269/Resources/AppleALC-1.7.7-RELEASE.zip?raw=true)
- Replace the existing AppleALC.kext in your `EFI/OC/Kexts` folder
- Change the Layout-ID in boot-args or Device Properties to `18` (for regular use) or `39` (when use with a docking station)
- Save and Reboot 

## Notes
- If you update AppleALC with OCAT or similar, this kext will be overwritten and you're back to stock.
- Don't use this kext with any other Layout-Id than `19` or `39` – it won't work!
- If you want to compile your own slimmed down AppleALC kext, you can follow my tutorial [**here**](https://github.com/5T33Z0/AppleALC-Guides/tree/main/Slimming_AppleALC)
