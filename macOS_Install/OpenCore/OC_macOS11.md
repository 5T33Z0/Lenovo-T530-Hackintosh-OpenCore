# Installing macOS Big Sur

The board-id skip used in my config which allows using the `MacBookPro10,1` SMBIOS with macOS 11.3 or newer requires virtualization technology which is only present in 11.3 and newer. Therefore, you can't UPGRADE from macOS Catalina or older with the `MacBookPro10,1` SMBIOS since it is not supported by Big Sur and newer. The skip only works when upgrading from Big Sur 11.3 or later to Monterey and newer.

## Instructions

In order to install to macOS Big Sur, you need to temporarily switch the SMBIOS when upgrading from macOS Catalina or older:

- Disbale Wifi/LAN (flip the physical switch for the AirPlane mode on the left near the USB ports which disables all communication). Otherwise you have to generate new Serials, etc.
- Change `SystemProductName` to `MacBookPro11,4` - leave the rest as is.
- Reboot
- Install Big Sur
- Once the installation is finished, change `SystemProductName` back to `MacBookPro10`
- Save your config and reboot
- Enbale WifI/LAN again
