# Installing macOS Big Sur

## Upgrading from macOS Catalina or older
When upgrading from macOS Catalina or older, you need to temporarily switch the SMBIOS to `MacBookPro11,4` in order to be able to install macOS Big Sur or newer.

### Technical Background
The board-id skip included in my configuration which allows using the `MacBookPro10,1` SMBIOS with macOS Big Sur and newer requires virtualization technology which first got introduced with macOS 11.3 (Darwin Kernel 20.4). Therefore, you can't simply upgrade from macOS Catalina or older using the `MacBookPro10,X` SMBIOS since the required virtualization technology to make the board-id skip work isn't present. That's why you need to switch the SMBIOS to MBP11,1 (for Monterey) or MBP11,4 (Monterey and Ventura) for upgrading macOS.

## Install instructions
- Download macOS Big Sur via the App Store or [**Open Core Legacy Patcher**](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html#creating-the-installer)
- Once that's complete, disable WiFi an LAN (unplug LAN and flip the physical switch near the USB ports to disable all wireless communication). Otherwise you have to generate new Serials, etc.
- In `config.plist`, change `SystemProductName` to `MacBookPro11,1` – leave the rest as is.
- Save and Reboot
- Create a new Volume in Disk Utility if you want to run Big Sur as a separate installation. If you just want to upgrade macOS you can skip this step.
- Run the Install Big Sur App
- Once the installation is completed, change `SystemProductName` back to `MacBookPro10.1` (i7) or `MacBookPro10,2` (i5)
- Save your config and reboot
- Enable WifI/LAN again

Enjoy macOS Big Sur with the correct SMBIOS for Ivy Bridge CPUs and the ability to install OTA Updates!

## Credits
- Acidanthera for OpenCore, OCLP and numerous Kexts
- IC005K for OCAT
