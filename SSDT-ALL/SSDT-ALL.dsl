/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/5t33z0/Documents/GitHub/Lenovo-T530-Hackintosh-OpenCore/SSDT-ALL/SSDT-ALL.aml, Fri Jul  1 08:06:20 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000EC8 (3784)
 *     Revision         0x02
 *     Checksum         0x7D
 *     OEM ID           "STZO"
 *     OEM Table ID     "T530"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "STZO", "T530", 0x00000000)
{
    External (_SB_.LID_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.AZAL, DeviceObj)
    External (_SB_.PCI0.CNVW, DeviceObj)
    External (_SB_.PCI0.EH01, DeviceObj)
    External (_SB_.PCI0.EH02, DeviceObj)
    External (_SB_.PCI0.GLAN, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HDEF, DeviceObj)
    External (_SB_.PCI0.IGBE, DeviceObj)
    External (_SB_.PCI0.IGPU, DeviceObj)
    External (_SB_.PCI0.LPC_, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.AC__, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1.XSTA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.HPET, DeviceObj)
    External (_SB_.PCI0.LPC_.TPM_, DeviceObj)
    External (_SB_.PCI0.LPC_.TPM_.XDSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.PEG_.VID_, DeviceObj)
    External (_SB_.PCI0.PEG_.VID_.XDSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.SMBU, DeviceObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (EXT1, MethodObj)    // 1 Arguments
    External (EXT2, MethodObj)    // 1 Arguments
    External (EXT3, MethodObj)    // 1 Arguments
    External (EXT4, MethodObj)    // 1 Arguments
    External (EXT5, MethodObj)    // 1 Arguments
    External (EXT6, MethodObj)    // 1 Arguments
    External (NBCF, IntObj)
    External (RMCF.BKLT, IntObj)
    External (RMCF.FBTP, IntObj)
    External (RMCF.GRAN, IntObj)
    External (RMCF.LEVW, IntObj)
    External (RMCF.LMAX, IntObj)
    External (ZPTS, MethodObj)    // 1 Arguments
    External (ZTTS, MethodObj)    // 1 Arguments
    External (ZWAK, MethodObj)    // 1 Arguments

    Scope (\_SB.PCI0.LPC.EC.AC)
    {
        If (_OSI ("Darwin"))
        {
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x18, 
                0x03
            })
        }
    }

    Scope (_SB)
    {
        Device (ALS0)
        {
            Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
            Name (_CID, "smc-als")  // _CID: Compatible ID
            Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
            Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
            {
                Package (0x02)
                {
                    0x64, 
                    0x012C
                }
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (\_SB.PCI0.LPC.EC.BAT1)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (\_SB.PCI0.LPC.EC.BAT1.XSTA ())
            }
        }
    }

    Method (EXT4, 1, NotSerialized)
    {
        If ((0x03 == Arg0))
        {
            Notify (\_SB.LID, 0x80) // Status Change
        }
    }

    Method (EXT5, 1, NotSerialized)
    {
        If ((Arg0 == Zero))
        {
            \_SI._SST (One)
        }
    }

    Scope (_SB.PCI0.LPC)
    {
        Device (FWHD)
        {
            Name (_HID, EisaId ("INT0800") /* Intel 82802 Firmware Hub Device */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadOnly,
                    0xFF000000,         // Address Base
                    0x01000000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Name (\_SB.PCI0.LPC.HPET._CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
        IRQNoFlags ()
            {0}
        IRQNoFlags ()
            {8}
        IRQNoFlags ()
            {11}
        Memory32Fixed (ReadWrite,
            0xFED00000,         // Address Base
            0x00000400,         // Address Length
            )
    })
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            NBCF = One
        }
    }

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.IGPU)
        {
            OperationRegion (RMP3, PCI_Config, Zero, 0x14)
            Device (PNLF)
            {
                Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                Name (_CID, "backlight")  // _CID: Compatible ID
                Name (_UID, 0x0E)  // _UID: Unique ID
                Name (_STA, 0x0B)  // _STA: Status
                Field (^RMP3, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    GDID,   16, 
                    Offset (0x10), 
                    BAR1,   32
                }

                OperationRegion (RMB1, SystemMemory, (BAR1 & 0xFFFFFFFFFFFFFFF0), 0x000E1184)
                Field (RMB1, AnyAcc, Lock, Preserve)
                {
                    Offset (0x48250), 
                    LEV2,   32, 
                    LEVL,   32, 
                    Offset (0x70040), 
                    P0BL,   32, 
                    Offset (0xC2000), 
                    GRAN,   32, 
                    Offset (0xC8250), 
                    LEVW,   32, 
                    LEVX,   32, 
                    LEVD,   32, 
                    Offset (0xE1180), 
                    PCHL,   32
                }

                Method (INI1, 1, NotSerialized)
                {
                    If ((Zero == (0x02 & Arg0)))
                    {
                        Local5 = 0xC0000000
                        If (CondRefOf (\RMCF.LEVW))
                        {
                            If ((Ones != \RMCF.LEVW))
                            {
                                Local5 = \RMCF.LEVW /* External reference */
                            }
                        }

                        ^LEVW = Local5
                    }

                    If ((0x04 & Arg0))
                    {
                        If (CondRefOf (\RMCF.GRAN))
                        {
                            ^GRAN = \RMCF.GRAN /* External reference */
                        }
                        Else
                        {
                            ^GRAN = Zero
                        }
                    }
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Local4 = One
                    If (CondRefOf (\RMCF.BKLT))
                    {
                        Local4 = \RMCF.BKLT /* External reference */
                    }

                    If (!(One & Local4))
                    {
                        Return (Zero)
                    }

                    Local0 = ^GDID /* \_SB_.PCI0.IGPU.PNLF.GDID */
                    Local2 = Ones
                    If (CondRefOf (\RMCF.LMAX))
                    {
                        Local2 = \RMCF.LMAX /* External reference */
                    }

                    Local3 = Zero
                    If (CondRefOf (\RMCF.FBTP))
                    {
                        Local3 = \RMCF.FBTP /* External reference */
                    }

                    If (((One == Local3) || (Ones != Match (Package (0x10)
                                        {
                                            0x010B, 
                                            0x0102, 
                                            0x0106, 
                                            0x1106, 
                                            0x1601, 
                                            0x0116, 
                                            0x0126, 
                                            0x0112, 
                                            0x0122, 
                                            0x0152, 
                                            0x0156, 
                                            0x0162, 
                                            0x0166, 
                                            0x016A, 
                                            0x46, 
                                            0x42
                                        }, MEQ, Local0, MTR, Zero, Zero))))
                    {
                        If ((Ones == Local2))
                        {
                            Local2 = 0x0710
                        }

                        Local1 = (^LEVX >> 0x10)
                        If (!Local1)
                        {
                            Local1 = Local2
                        }

                        If ((!(0x08 & Local4) && (Local2 != Local1)))
                        {
                            Local0 = ((^LEVL * Local2) / Local1)
                            Local3 = (Local2 << 0x10)
                            If ((Local2 > Local1))
                            {
                                ^LEVX = Local3
                                ^LEVL = Local0
                            }
                            Else
                            {
                                ^LEVL = Local0
                                ^LEVX = Local3
                            }
                        }
                    }
                    ElseIf (((0x03 == Local3) || (Ones != Match (Package (0x19)
                                        {
                                            0x3E9B, 
                                            0x3EA5, 
                                            0x3E92, 
                                            0x3E91, 
                                            0x3EA0, 
                                            0x3EA6, 
                                            0x3E98, 
                                            0x9BC8, 
                                            0x9BC5, 
                                            0x9BC4, 
                                            0xFF05, 
                                            0x8A70, 
                                            0x8A71, 
                                            0x8A51, 
                                            0x8A5C, 
                                            0x8A5D, 
                                            0x8A52, 
                                            0x8A53, 
                                            0x8A56, 
                                            0x8A5A, 
                                            0x8A5B, 
                                            0x9B41, 
                                            0x9B21, 
                                            0x9BCA, 
                                            0x9BA4
                                        }, MEQ, Local0, MTR, Zero, Zero))))
                    {
                        If ((Ones == Local2))
                        {
                            Local2 = 0xFFFF
                        }
                    }
                    Else
                    {
                        If ((Ones == Local2))
                        {
                            If ((Ones != Match (Package (0x16)
                                            {
                                                0x0D26, 
                                                0x0A26, 
                                                0x0D22, 
                                                0x0412, 
                                                0x0416, 
                                                0x0A16, 
                                                0x0A1E, 
                                                0x0A1E, 
                                                0x0A2E, 
                                                0x041E, 
                                                0x041A, 
                                                0x0BD1, 
                                                0x0BD2, 
                                                0x0BD3, 
                                                0x1606, 
                                                0x160E, 
                                                0x1616, 
                                                0x161E, 
                                                0x1626, 
                                                0x1622, 
                                                0x1612, 
                                                0x162B
                                            }, MEQ, Local0, MTR, Zero, Zero)))
                            {
                                Local2 = 0x0AD9
                            }
                            Else
                            {
                                Local2 = 0x056C
                            }
                        }

                        INI1 (Local4)
                        Local1 = (^LEVX >> 0x10)
                        If (!Local1)
                        {
                            Local1 = Local2
                        }

                        If ((!(0x08 & Local4) && (Local2 != Local1)))
                        {
                            Local0 = ((((^LEVX & 0xFFFF) * Local2) / Local1) | 
                                (Local2 << 0x10))
                            ^LEVX = Local0
                        }
                    }

                    If ((Local2 == 0x0710))
                    {
                        _UID = 0x0E
                    }
                    ElseIf ((Local2 == 0x0AD9))
                    {
                        _UID = 0x0F
                    }
                    ElseIf ((Local2 == 0x056C))
                    {
                        _UID = 0x10
                    }
                    ElseIf ((Local2 == 0x07A1))
                    {
                        _UID = 0x11
                    }
                    ElseIf ((Local2 == 0x1499))
                    {
                        _UID = 0x12
                    }
                    ElseIf ((Local2 == 0xFFFF))
                    {
                        _UID = 0x13
                    }
                    Else
                    {
                        _UID = 0x63
                    }
                }
            }
        }
    }

    Scope (_SB)
    {
        Device (PCI9)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (FNOK, Zero)
            Name (MODE, Zero)
            Name (TPTS, Zero)
            Name (TWAK, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TPTS = Arg0
            If ((\_SB.PCI9.FNOK == One))
            {
                Arg0 = 0x03
            }

            If (CondRefOf (EXT1))
            {
                EXT1 (Arg0)
            }

            If (CondRefOf (EXT2))
            {
                EXT2 (Arg0)
            }
        }

        ZPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (_OSI ("Darwin"))
        {
            \_SB.PCI9.TWAK = Arg0
            If ((\_SB.PCI9.FNOK == One))
            {
                \_SB.PCI9.FNOK = Zero
                Arg0 = 0x03
            }

            If (CondRefOf (EXT3))
            {
                EXT3 (Arg0)
            }

            If (CondRefOf (EXT4))
            {
                EXT4 (Arg0)
            }
        }

        Local0 = ZWAK (Arg0)
        Return (Local0)
    }

    Method (_TTS, 1, NotSerialized)  // _TTS: Transition To State
    {
        If (_OSI ("Darwin"))
        {
            If (CondRefOf (EXT5))
            {
                EXT5 (Arg0)
            }

            If (CondRefOf (EXT6))
            {
                EXT6 (Arg0)
            }
        }

        If (CondRefOf (ZTTS))
        {
            ZTTS (Arg0)
        }
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Device (_SB.PCI0.SMBU.BUS0)
    {
        Name (_CID, "smbus")  // _CID: Compatible ID
        Name (_ADR, Zero)  // _ADR: Address
        Device (DVL0)
        {
            Name (_ADR, 0x57)  // _ADR: Address
            Name (_CID, "diagsvault")  // _CID: Compatible ID
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x57                                             // W
                    })
                }

                Return (Package (0x02)
                {
                    "address", 
                    0x57
                })
            }
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (_SB)
    {
        Method (PPPW, 0, Serialized)
        {
            Return (Package (0x02)
            {
                0x0D, 
                Zero
            })
        }
    }

    If (CondRefOf (\_SB.PCI0.EH01))
    {
        Scope (_SB.PCI0.EH01)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.EH02))
    {
        Scope (_SB.PCI0.EH02)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC))
    {
        Scope (_SB.PCI0.XHC)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XDCI))
    {
        Scope (_SB.PCI0.XDCI)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.HDEF))
    {
        Scope (_SB.PCI0.HDEF)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.HDAS))
    {
        Scope (_SB.PCI0.HDAS)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.AZAL))
    {
        Scope (_SB.PCI0.AZAL)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.GLAN))
    {
        Scope (_SB.PCI0.GLAN)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.IGBE))
    {
        Scope (_SB.PCI0.IGBE)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.CNVW))
    {
        Scope (_SB.PCI0.CNVW)
        {
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (\_SB.PPPW ())
            }
        }
    }

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.PCI0.LPC.TPM)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Return (\_SB.PCI0.LPC.TPM.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }

        Scope (\_SB.PCI0.PEG.VID)
        {
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                Return (\_SB.PCI0.PEG.VID.XDSM (Arg0, Arg1, Arg2, Arg3))
            }
        }
    }

    Method (XOSI, 1, NotSerialized)
    {
        Local0 = Package (0x14)
            {
                "Windows 2001", 
                "Windows 2001.1", 
                "Windows 2001 SP1", 
                "Windows 2001 SP2", 
                "Windows 2001 SP3", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2009", 
                "Windows 2012", 
                "Windows 2013", 
                "Windows 2015", 
                "Windows 2016", 
                "Windows 2017", 
                "Windows 2018", 
                "Windows 2019", 
                "Windows 2020", 
                "Windows 2021", 
                "Microsoft Windows NT", 
                "Microsoft Windows", 
                "Microsoft WindowsME: Millennium Edition"
            }
        If (_OSI ("Darwin"))
        {
            Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}

