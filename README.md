# Lenovo-T530-Hackinosh-OpenCore
EFI Folder with configs for running macOS Catalina an Big Sur wih either a patched DSDT or DSDT-less.

The EFI for running macOS on the Lenovo T530 includes 2 configs:

1. config_DSDT.plist

This is 100% working for T530 Models wih both HD (AAPL,ig-platform-id 03006601) and HD+ Displays (AAPL,ig-platform-id 04006601). If you just want to have
a well running System, use this. You need to rename this config to config.plist in order to boot with this. You can't Boot Windows from within the BootPicker 
of OpenCore if you have Dual Boot Setup using a single HDD/SSD for both Windows and MacOS.

In this config, have a look at ACPI > Add and enable either DSDT-HD.aml or DSDT-HD-PLUS.am depending on the Display Panel your Lenovo T530 uses. Check the comments
for more info. 

2. config_DSDT-less.plist

This is the default config which runs macOS without a patched DSDT making use of ACPI Hotpatches (SSDT files and ACPI patches in config). This is independent 
of the installed BIOS Version and DSDT and also runs a lot snappier. The current config is for T530 Models with HD+ Displays (Resolution ≥1600x900 px). If you have a Laptop with a lower resolution you need to add the correct Framebuffer-Patch for IntelHD 4000 (AAPL,ig-platform-id 03006601).

But unfortunately, this config is currently not working 100% yet. 

What is not working:
- Audio via AppleALC. It uses VoodooHDA for now.
- Lid: Sleep/Clamshell Mode and switching over the Main Display to an External Monitor when the lid is closed
- Power LED keeps pulsing sleep

Any help on getting this fixed is highly appreciated.

Files are coming soon. I need to familiarize with how uploafing the EFI on githhb works first.
