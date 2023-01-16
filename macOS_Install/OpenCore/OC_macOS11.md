# Installing macOS Big Sur

The board-id skip used in my configuration which allows using the `MacBookPro10,1` SMBIOS with macOS 11.3 or newer requires virtualization technology which got introduced with macOS 11.3. Therefore, you can't simply upgrade from macOS Catalina or older with the `MacBookPro10,X` SMBIOS since the board-id skip doesn't work due to the missing virtualization technology. It only works on a systems running Darwin Kernel 20.4 or newer. In other words: upgrading macOS only works when coming from Big Sur 11.3+ in this case.

So when upgrading from macOS Catalina or older, you need to temporarily switch the SMBIOS to `MacBookPro11,1` in order to be able to install macOS Big Sur or newer.

## Instructions

- Download macOS Big Sur via the App Store or [**Open Core Legacy Patcher**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer)
- Once that's done, disable Wifi/LAN (flip the physical switch near the USB ports to enable Air Plane Mode – disables all communication). Otherwise you have to generate new Serials, etc.
- In `config.plist`, change `SystemProductName` to `MacBookPro11,1` – leave the rest as is.
- Save and Reboot
- Run the Install Big Sur App
- Once the installation is completed, change `SystemProductName` back to `MacBookPro10.1` (i7) or `MacBookPro10,2` (i5)
- Save your config and reboot
- Enable WifI/LAN again

Enjoy macOS Big Sur with the correct SMBIOS for Ivy Bridge CPUs and the ability to install OTA Updates!

## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- IC005K for OCAT
