## Additional SSDT-PM Files

Here you'll find additional SSDT-PM files for optimizing the CPU power management of different Ivy Bridge CPU models. The file names are a combination of CPU Model and Low Frequency (either 900 or 1200 mHz). For mobile Ivy Bridge CPUs, the default Low Frequency is 1200 mHz, the optimised frequency is 900 mHz.

### How To:
- **CAUTION**: Before you use this, backup your current EFI Folder on a FAT32 formatted bootstick!
- Rename the file of your choise to `SSDT-PM.aml`before adding it to EFI > OC > ACPI.
- Don't add the `.dsl` files to your EFI folder!
- Update you `config.plist` make sure the SSDt-PM is in the list of ACPI > Add
- Disable the 2 Patches under ACPI > Delete (Drop CpuPm and Drop Cpu0Ist)
- Try the 900 mhz variant first.
- If the system crashes during boot, boot from the stick and the try the 1200 variant.

### My CPU model is not in the list?! Generate your own SSDT-PM!
- Install [ssdtPRGen](https://github.com/Piker-Alpha/ssdtPRGen.sh)
- Open Terminal and enter: `sudo /Users/YOURUSERNAME/ssdtPRGen.sh`
- The generated file will be located at `/Users/YOURUSERNAME/Library/ssdtPRGen`
- To generate a SSDT-PM for a different CPU, enter: `sudo /Users/YOURUSERNAME/ssdtPRGen.sh -p 'MODELNAME'` (for example `'i7-3360QM'`)
