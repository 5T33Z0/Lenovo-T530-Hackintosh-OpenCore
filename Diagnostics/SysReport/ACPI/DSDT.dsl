/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLOM9Em5.aml, Tue Aug  1 08:17:49 2023
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000104B1 (66737)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xD8
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "TP-G4   "
 *     OEM Revision     0x00002770 (10096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20061109 (537268489)
 */
DefinitionBlock ("", "DSDT", 1, "LENOVO", "TP-G4   ", 0x00002770)
{
    External (_PR_.CPU0._PSS, IntObj)
    External (_SB_.PCI0.SAT1.PRIM.GTME, UnknownObj)
    External (_SB_.PCI0.SAT1.PRT1, UnknownObj)
    External (_SB_.PCI0.SAT1.SCND.GTME, UnknownObj)
    External (_SB_.PCI0.SAT1.SCND.MSTR, UnknownObj)
    External (PDC0, UnknownObj)
    External (PDC1, UnknownObj)
    External (PDC2, UnknownObj)
    External (PDC3, UnknownObj)
    External (PDC4, UnknownObj)
    External (PDC5, UnknownObj)
    External (PDC6, UnknownObj)
    External (PDC7, UnknownObj)

    Scope (\_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06){}
        Processor (CPU1, 0x02, 0x00000410, 0x06){}
        Processor (CPU2, 0x03, 0x00000410, 0x06){}
        Processor (CPU3, 0x04, 0x00000410, 0x06){}
        Processor (CPU4, 0x05, 0x00000410, 0x06){}
        Processor (CPU5, 0x06, 0x00000410, 0x06){}
        Processor (CPU6, 0x07, 0x00000410, 0x06){}
        Processor (CPU7, 0x08, 0x00000410, 0x06){}
    }

    Scope (\)
    {
        Method (PNTF, 1, NotSerialized)
        {
            If ((\PPMF & 0x0400))
            {
                If ((((PDC0 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC0 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU0, Arg0)
                }

                If ((((PDC1 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC1 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU1, Arg0)
                }

                If ((((PDC2 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC2 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU2, Arg0)
                }

                If ((((PDC3 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC3 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU3, Arg0)
                }

                If ((((PDC4 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC4 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU4, Arg0)
                }

                If ((((PDC5 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC5 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU5, Arg0)
                }

                If ((((PDC6 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC6 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU6, Arg0)
                }

                If ((((PDC7 & 0x08) && ((Arg0 == 0x80) || (
                    Arg0 == 0x82))) || ((PDC7 & 0x10) && (Arg0 == 0x81))))
                {
                    Notify (\_PR.CPU7, Arg0)
                }
            }
            ElseIf (((Arg0 == 0x80) || ((Arg0 == 0x81) || (Arg0 == 
                0x82))))
            {
                Notify (\_PR.CPU0, Arg0)
            }
        }
    }

    OperationRegion (MNVS, SystemMemory, 0xDAF9D018, 0x1000)
    Field (MNVS, DWordAcc, NoLock, Preserve)
    {
        Offset (0xD00), 
        GAPA,   32, 
        GAPL,   32, 
        DCKI,   32, 
        DCKS,   32, 
        VCDL,   1, 
        VCDC,   1, 
        VCDT,   1, 
        VCDD,   1, 
            ,   1, 
        VCSS,   1, 
        VCDB,   1, 
        VCIN,   1, 
        VVPO,   8, 
        BRTN,   8, 
        BRLV,   8, 
        CDFL,   8, 
        CDAH,   8, 
        PMOD,   2, 
        PDIR,   1, 
        PDMA,   1, 
        Offset (0xD17), 
        LFDC,   1, 
        Offset (0xD18), 
        C2NA,   1, 
        C3NA,   1, 
        C4NA,   1, 
        C6NA,   1, 
        C7NA,   1, 
        Offset (0xD19), 
        Offset (0xD1A), 
            ,   2, 
            ,   1, 
        NHPS,   1, 
        NPME,   1, 
        Offset (0xD1B), 
        UOPT,   8, 
        BTID,   32, 
        DPP0,   1, 
        DPP1,   1, 
        DPP2,   1, 
        DPP3,   1, 
        DPP4,   1, 
        DPP5,   1, 
        Offset (0xD21), 
        Offset (0xD22), 
        TCRT,   16, 
        TPSV,   16, 
        TTC1,   16, 
        TTC2,   16, 
        TTSP,   16, 
        SRAH,   8, 
        SRHE,   8, 
        SRE1,   8, 
        SRE2,   8, 
        SRE3,   8, 
        SRE4,   8, 
        SRE5,   8, 
        SRE6,   8, 
        SRU1,   8, 
        SRU2,   8, 
        SRU3,   8, 
        SRU7,   8, 
        SRU4,   8, 
        SRU5,   8, 
        SRU8,   8, 
        SRPB,   8, 
        SRLP,   8, 
        SRSA,   8, 
        SRSM,   8, 
        CWAC,   1, 
        CWAS,   1, 
        CWUE,   1, 
        CWUS,   1, 
        Offset (0xD40), 
        CWAP,   16, 
        CWAT,   16, 
        DBGC,   1, 
        Offset (0xD45), 
        FS1L,   16, 
        FS1M,   16, 
        FS1H,   16, 
        FS2L,   16, 
        FS2M,   16, 
        FS2H,   16, 
        FS3L,   16, 
        FS3M,   16, 
        FS3H,   16, 
        TATC,   1, 
            ,   6, 
        TATL,   1, 
        TATW,   8, 
        TNFT,   4, 
        TNTT,   4, 
        TDFA,   4, 
        TDTA,   4, 
        TDFD,   4, 
        TDTD,   4, 
        TCFA,   4, 
        TCTA,   4, 
        TCFD,   4, 
        TCTD,   4, 
        TSFT,   4, 
        TSTT,   4, 
        TIT0,   8, 
        TCR0,   16, 
        TPS0,   16, 
        TIT1,   8, 
        TCR1,   16, 
        TPS1,   16, 
        TIT2,   8, 
        TCR2,   16, 
        TPS2,   16, 
        TIF0,   8, 
        TIF1,   8, 
        TIF2,   8, 
        Offset (0xD78), 
        BTHI,   1, 
        Offset (0xD79), 
        HDIR,   1, 
        HDEH,   1, 
        HDSP,   1, 
        HDPP,   1, 
        HDUB,   1, 
        HDMC,   1, 
        Offset (0xD7A), 
        TPME,   8, 
        BIDE,   4, 
        IDET,   4, 
            ,   1, 
        DTSE,   1, 
        Offset (0xD7D), 
        DTS0,   8, 
        DTS1,   8, 
        DT00,   1, 
        DT01,   1, 
        DT02,   1, 
        DT03,   1, 
        Offset (0xD80), 
        LIDB,   1, 
        C4WR,   1, 
        C4AC,   1, 
        ODDX,   1, 
        CMPR,   1, 
        ILNF,   1, 
        PLUX,   1, 
        Offset (0xD81), 
        Offset (0xD8C), 
            ,   4, 
            ,   1, 
        IDMM,   1, 
        Offset (0xD8D), 
            ,   3, 
            ,   1, 
            ,   1, 
        LIDS,   1, 
        Offset (0xD8E), 
        Offset (0xD8F), 
            ,   4, 
        Offset (0xD90), 
        TCG0,   1, 
        TCG1,   1, 
        Offset (0xD91), 
        SWGP,   8, 
        IPMS,   8, 
        IPMB,   120, 
        IPMR,   24, 
        IPMO,   24, 
        IPMA,   8, 
        VIGD,   1, 
        VDSC,   1, 
            ,   2, 
        VDSP,   1, 
        Offset (0xDAA), 
        Offset (0xDAD), 
        ASFT,   8, 
        PL1L,   8, 
        PL1M,   8, 
        CHKC,   32, 
        CHKE,   32, 
        ATRB,   32, 
        Offset (0xDBD), 
        PPCR,   8, 
        TPCR,   5, 
        Offset (0xDBF), 
        Offset (0xDCE), 
        CTDP,   8, 
        PPCA,   8, 
        TPCA,   5, 
        Offset (0xDD1), 
        BFWB,   296, 
        OSPX,   1, 
        OSC4,   1, 
        Offset (0xDF7), 
        SPEN,   1, 
        SCRM,   1, 
        GFPL,   1, 
        ETAU,   1, 
        IHBC,   1, 
        APMD,   1, 
        APMF,   1, 
        TDNV,   1, 
        FTPS,   8, 
        HIST,   8, 
        LPST,   8, 
        LWST,   8, 
        Offset (0xDFF), 
        MTAU,   8, 
        Offset (0xE20), 
        HPET,   32, 
        PKLI,   16, 
        VLCX,   16, 
        VNIT,   8, 
        VBD0,   8, 
        VBDT,   128, 
        VBPL,   16, 
        VBPH,   16, 
        VBML,   8, 
        VBMH,   8, 
        VEDI,   1024, 
        PDCI,   16, 
        ISCG,   32, 
        ISSP,   1, 
        ISWK,   2, 
        Offset (0xEC7), 
        SHA1,   160, 
        FFDT,   1, 
        Offset (0xEDC), 
        LWCP,   1, 
        LWEN,   1, 
        Offset (0xEDD), 
        USBR,   1, 
        Offset (0xEDE), 
        Offset (0xEDF), 
        Offset (0xEE1), 
        LPAW,   8, 
        XPFG,   1, 
        SVHC,   1, 
        Offset (0xEE3), 
            ,   2, 
        CPUC,   1, 
        Offset (0xEE4)
    }

    Field (MNVS, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB00), 
        WITM,   8, 
        WSEL,   8, 
        WLS0,   8, 
        WLS1,   8, 
        WLS2,   8, 
        WLS3,   8, 
        WLS4,   8, 
        WLS5,   8, 
        WLS6,   8, 
        WLS7,   8, 
        WLS8,   8, 
        WLS9,   8, 
        WLSA,   8, 
        WLSB,   8, 
        WLSC,   8, 
        WLSD,   8, 
        WENC,   8, 
        WKBD,   8, 
        WPTY,   8, 
        WPAS,   1032, 
        WPNW,   1032, 
        WSPM,   8, 
        WSPS,   8, 
        WSMN,   8, 
        WSMX,   8, 
        WSEN,   8, 
        WSKB,   8, 
        WASB,   8, 
        WASI,   16, 
        WASD,   8, 
        WASS,   32
    }

    Field (MNVS, ByteAcc, NoLock, Preserve)
    {
        Offset (0xA00), 
        DBGS,   1024
    }

    OperationRegion (GNVS, SystemMemory, 0xDAF6CE18, 0x01C8)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        Offset (0x10), 
        PWRS,   8, 
        Offset (0x1E), 
        Offset (0x25), 
        REVN,   8, 
        Offset (0x28), 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        C67L,   8, 
        Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        Offset (0x78), 
        TPMP,   8, 
        Offset (0x7A), 
        MORD,   8, 
        TCGP,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        PLID,   8, 
        AOAC,   8, 
        SLDR,   32, 
        WAKR,   8, 
        Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        Offset (0xE1), 
        OSCC,   8, 
        NEXP,   8, 
        SDGV,   8, 
        SDDV,   8, 
        Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        Offset (0xEE), 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        Offset (0x100), 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        EBAS,   32, 
        CPSP,   32, 
        EECP,   32, 
        EVCP,   32, 
        XBAS,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        Offset (0x157), 
        ATMC,   8, 
        PTMC,   8, 
        ATRA,   8, 
        PTRA,   8, 
        PNHM,   32, 
        TBAB,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        ATPC,   8, 
        PTPC,   8, 
        PFLV,   8, 
        BREV,   8, 
        HGMD,   8, 
        PWOK,   8, 
        HLRS,   8, 
        DSEL,   8, 
        ESEL,   8, 
        PSEL,   8, 
        PWEN,   8, 
        PRST,   8, 
        DPBM,   8, 
        DPCM,   8, 
        DPDM,   8, 
        ALFP,   8, 
        IMON,   8, 
        PDTS,   8, 
        PKGA,   8, 
        PAMT,   8, 
        AC0F,   8, 
        AC1F,   8, 
        Offset (0x1B2), 
        XHCM,   8, 
        XHPM,   8
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (CondRefOf (\_OSI, Local0))
            {
                If (\_OSI ("Windows 2001"))
                {
                    \WNTF = 0x01
                    \WXPF = 0x01
                    \WSPV = 0x00
                }

                If (\_OSI ("Windows 2001 SP1"))
                {
                    \WSPV = 0x01
                }

                If (\_OSI ("Windows 2001 SP2"))
                {
                    \WSPV = 0x02
                }

                If (\_OSI ("Windows 2006"))
                {
                    \WVIS = 0x01
                }

                If (\_OSI ("Windows 2009"))
                {
                    \WIN7 = 0x01
                }

                If (\_OSI ("Windows 2012"))
                {
                    \WIN8 = 0x01
                }

                If (\_OSI ("Linux"))
                {
                    \LNUX = 0x01
                }

                If (\_OSI ("FreeBSD"))
                {
                    \LNUX = 0x01
                }
            }
            ElseIf ((\SCMP (\_OS, "Microsoft Windows NT") == Zero))
            {
                \WNTF = 0x01
            }

            If ((\_REV >= 0x02))
            {
                \H8DR = 0x01
            }

            \OSIF = 0x01
            \PWRS = \_SB.PCI0.LPC.EC.AC._PSR ()
            \_SB.PCI0.LPC.MOU.MHID ()
            If (\LNUX)
            {
                \_SB.PCI0.LPC.EC.SAUM (0x02)
                \UCMS (0x1C)
            }

            \_SB.PCI0.RID = \SRAH
            If (VIGD)
            {
                \_SB.PCI0.VID.RID = \SRHE
            }
            Else
            {
                \_SB.PCI0.PEG.RID = \SRHE
            }

            \_SB.PCI0.EXP1.RID = \SRE1
            \_SB.PCI0.EXP2.RID = \SRE2
            \_SB.PCI0.EXP3.RID = \SRE3
            \_SB.PCI0.EHC1.RID = \SRU7
            \_SB.PCI0.EHC2.RID = \SRU8
            \_SB.PCI0.LPC.RID = \SRLP
            \_SB.PCI0.SAT1.RID = \SRSA
            \_SB.PCI0.SMBU.RID = \SRSM
            If (VDSP)
            {
                Local1 = \VHYB (0x05, 0x00)
                If ((Local1 & 0x80))
                {
                    If (\WIN7)
                    {
                        If (((Local1 & 0x03) != 0x03))
                        {
                            \VHYB (0x06, 0x03)
                        }
                    }
                    ElseIf (((Local1 & 0x03) == 0x03))
                    {
                        \VHYB (0x06, 0x02)
                    }
                }
            }

            If (\WIN7)
            {
                XPFG = 0x00
            }
            Else
            {
                XPFG = 0x01
            }

            \UCMS (0x1D)
        }

        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRA))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRA |= 0x80
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y00)
                    {}
            })
            CreateWordField (BUFA, \_SB.LNKA._Y00._INT, IRA1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRA & 0x8F)
                If (VPIR (Local0))
                {
                    IRA1 = (0x01 << Local0)
                }
                Else
                {
                    IRA1 = 0x00
                }

                Return (BUFA) /* \_SB_.LNKA.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRA2)
                FindSetRightBit (IRA2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRA & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRA = Local1
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRB))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRB |= 0x80
            }

            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y01)
                    {}
            })
            CreateWordField (BUFB, \_SB.LNKB._Y01._INT, IRB1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRB & 0x8F)
                If (VPIR (Local0))
                {
                    IRB1 = (0x01 << Local0)
                }
                Else
                {
                    IRB1 = 0x00
                }

                Return (BUFB) /* \_SB_.LNKB.BUFB */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRB2)
                FindSetRightBit (IRB2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRB & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRB = Local1
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRC))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRC |= 0x80
            }

            Name (BUFC, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y02)
                    {}
            })
            CreateWordField (BUFC, \_SB.LNKC._Y02._INT, IRC1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRC & 0x8F)
                If (VPIR (Local0))
                {
                    IRC1 = (0x01 << Local0)
                }
                Else
                {
                    IRC1 = 0x00
                }

                Return (BUFC) /* \_SB_.LNKC.BUFC */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRC2)
                FindSetRightBit (IRC2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRC & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRC = Local1
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRD))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRD |= 0x80
            }

            Name (BUFD, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y03)
                    {}
            })
            CreateWordField (BUFD, \_SB.LNKD._Y03._INT, IRD1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRD & 0x8F)
                If (VPIR (Local0))
                {
                    IRD1 = (0x01 << Local0)
                }
                Else
                {
                    IRD1 = 0x00
                }

                Return (BUFD) /* \_SB_.LNKD.BUFD */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRD2)
                FindSetRightBit (IRD2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRD & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRD = Local1
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRE))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRE |= 0x80
            }

            Name (BUFE, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y04)
                    {}
            })
            CreateWordField (BUFE, \_SB.LNKE._Y04._INT, IRE1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRE & 0x8F)
                If (VPIR (Local0))
                {
                    IRE1 = (0x01 << Local0)
                }
                Else
                {
                    IRE1 = 0x00
                }

                Return (BUFE) /* \_SB_.LNKE.BUFE */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRE2)
                FindSetRightBit (IRE2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRE & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRE = Local1
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRF))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRF |= 0x80
            }

            Name (BUFF, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y05)
                    {}
            })
            CreateWordField (BUFF, \_SB.LNKF._Y05._INT, IRF1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRF & 0x8F)
                If (VPIR (Local0))
                {
                    IRF1 = (0x01 << Local0)
                }
                Else
                {
                    IRF1 = 0x00
                }

                Return (BUFF) /* \_SB_.LNKF.BUFF */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRF2)
                FindSetRightBit (IRF2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRF & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRF = Local1
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRG))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRG |= 0x80
            }

            Name (BUFG, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y06)
                    {}
            })
            CreateWordField (BUFG, \_SB.LNKG._Y06._INT, IRG1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRG & 0x8F)
                If (VPIR (Local0))
                {
                    IRG1 = (0x01 << Local0)
                }
                Else
                {
                    IRG1 = 0x00
                }

                Return (BUFG) /* \_SB_.LNKG.BUFG */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRG2)
                FindSetRightBit (IRG2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRG & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRG = Local1
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (!VPIR (\_SB.PCI0.LPC.PIRH))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                \_SB.PCI0.LPC.PIRH |= 0x80
            }

            Name (BUFH, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y07)
                    {}
            })
            CreateWordField (BUFH, \_SB.LNKH._Y07._INT, IRH1)  // _INT: Interrupts
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.LPC.PIRH & 0x8F)
                If (VPIR (Local0))
                {
                    IRH1 = (0x01 << Local0)
                }
                Else
                {
                    IRH1 = 0x00
                }

                Return (BUFH) /* \_SB_.LNKH.BUFH */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, 0x01, IRH2)
                FindSetRightBit (IRH2, Local0)
                Local1 = (\_SB.PCI0.LPC.PIRH & 0x70)
                Local1 |= Local0--
                \_SB.PCI0.LPC.PIRH = Local1
            }
        }

        Method (VPIR, 1, NotSerialized)
        {
            Local0 = 0x01
            If ((Arg0 & 0x80))
            {
                Local0 = 0x00
            }
            Else
            {
                Local1 = (Arg0 & 0x0F)
                If ((Local1 < 0x03))
                {
                    Local0 = 0x00
                }
                ElseIf (((Local1 == 0x08) || (Local1 == 0x0D)))
                {
                    Local0 = 0x00
                }
            }

            Return (Local0)
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Name (MEMS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x000A0000,         // Address Length
                    )
                Memory32Fixed (ReadOnly,
                    0x000C0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y08)
                Memory32Fixed (ReadOnly,
                    0x000C4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y09)
                Memory32Fixed (ReadOnly,
                    0x000C8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0A)
                Memory32Fixed (ReadOnly,
                    0x000CC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0B)
                Memory32Fixed (ReadOnly,
                    0x000D0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0C)
                Memory32Fixed (ReadOnly,
                    0x000D4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0D)
                Memory32Fixed (ReadOnly,
                    0x000D8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0E)
                Memory32Fixed (ReadOnly,
                    0x000DC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0F)
                Memory32Fixed (ReadOnly,
                    0x000E0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y10)
                Memory32Fixed (ReadOnly,
                    0x000E4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y11)
                Memory32Fixed (ReadOnly,
                    0x000E8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y12)
                Memory32Fixed (ReadOnly,
                    0x000EC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y13)
                Memory32Fixed (ReadOnly,
                    0x000F0000,         // Address Base
                    0x00010000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00100000,         // Address Base
                    0x01EE0000,         // Address Length
                    _Y14)
                Memory32Fixed (ReadOnly,
                    0xFEC00000,         // Address Base
                    0x00140000,         // Address Length
                    _Y15)
                Memory32Fixed (ReadOnly,
                    0xFED4C000,         // Address Base
                    0x012B4000,         // Address Length
                    _Y16)
            })
            CreateDWordField (MEMS, \_SB.MEM._Y08._LEN, MC0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y09._LEN, MC4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0A._LEN, MC8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0B._LEN, MCCL)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0C._LEN, MD0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0D._LEN, MD4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0E._LEN, MD8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0F._LEN, MDCL)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y10._LEN, ME0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y11._LEN, ME4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y12._LEN, ME8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y13._LEN, MECL)  // _LEN: Length
            CreateBitField (MEMS, \_SB.MEM._Y08._RW, MC0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y09._RW, MC4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0A._RW, MC8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0B._RW, MCCW)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0C._RW, MD0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0D._RW, MD4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0E._RW, MD8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0F._RW, MDCW)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y10._RW, ME0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y11._RW, ME4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y12._RW, ME8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y13._RW, MECW)  // _RW_: Read-Write Status
            CreateDWordField (MEMS, \_SB.MEM._Y14._BAS, MEB1)  // _BAS: Base Address
            CreateDWordField (MEMS, \_SB.MEM._Y14._LEN, MEL1)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y15._LEN, MEL2)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y16._LEN, MEL3)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (\_SB.PCI0.PAM1 & 0x03)
                If (Local0)
                {
                    MC0L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        MC0W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM1 & 0x30)
                If (Local0)
                {
                    MC4L = 0x4000
                    If ((Local0 & 0x20))
                    {
                        MC4W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM2 & 0x03)
                If (Local0)
                {
                    MC8L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        MC8W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM2 & 0x30)
                If (Local0)
                {
                    MCCL = 0x4000
                    If ((Local0 & 0x20))
                    {
                        MCCW = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM3 & 0x03)
                If (Local0)
                {
                    MD0L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        MD0W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM3 & 0x30)
                If (Local0)
                {
                    MD4L = 0x4000
                    If ((Local0 & 0x20))
                    {
                        MD4W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM4 & 0x03)
                If (Local0)
                {
                    MD8L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        MD8W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM4 & 0x30)
                If (Local0)
                {
                    MDCL = 0x4000
                    If ((Local0 & 0x20))
                    {
                        MDCW = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM5 & 0x03)
                If (Local0)
                {
                    ME0L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        ME0W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM5 & 0x30)
                If (Local0)
                {
                    ME4L = 0x4000
                    If ((Local0 & 0x20))
                    {
                        ME4W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM6 & 0x03)
                If (Local0)
                {
                    ME8L = 0x4000
                    If ((Local0 & 0x02))
                    {
                        ME8W = 0x01
                    }
                }

                Local0 = (\_SB.PCI0.PAM6 & 0x30)
                If (Local0)
                {
                    MECL = 0x4000
                    If ((Local0 & 0x20))
                    {
                        MECW = 0x01
                    }
                }

                MEL1 = (\MEMX - MEB1) /* \_SB_.MEM_.MEB1 */
                If ((\_SB.PCI0.LPC.TPM._STA () != 0x0F))
                {
                    MEL2 = 0x01400000
                    MEL3 = 0x00
                }

                Return (MEMS) /* \_SB_.MEM_.MEMS */
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (((\ILNF == 0x00) && (\PLUX == 0x00)))
                {
                    If (\H8DR)
                    {
                        Return (\_SB.PCI0.LPC.EC.HPLD)
                    }
                    ElseIf ((\RBEC (0x46) & 0x04))
                    {
                        Return (0x01)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }
                Else
                {
                    Return (0x01)
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                If (\LWCP)
                {
                    Return (Package (0x02)
                    {
                        0x1D, 
                        0x04
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x1D, 
                        0x03
                    })
                }
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (\H8DR)
                {
                    If (Arg0)
                    {
                        \_SB.PCI0.LPC.EC.HWLO = 0x01
                    }
                    Else
                    {
                        \_SB.PCI0.LPC.EC.HWLO = 0x00
                    }
                }
                ElseIf (Arg0)
                {
                    \MBEC (0x32, 0xFF, 0x04)
                }
                Else
                {
                    \MBEC (0x32, 0xFB, 0x00)
                }

                If (\LWCP)
                {
                    If (Arg0)
                    {
                        \LWEN = 0x01
                    }
                    Else
                    {
                        \LWEN = 0x00
                    }
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x1D, 
                    0x03
                })
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (\H8DR)
                {
                    If (Arg0)
                    {
                        \_SB.PCI0.LPC.EC.HWFN = 0x01
                    }
                    Else
                    {
                        \_SB.PCI0.LPC.EC.HWFN = 0x00
                    }
                }
                ElseIf (Arg0)
                {
                    \MBEC (0x32, 0xFF, 0x10)
                }
                Else
                {
                    \MBEC (0x32, 0xEF, 0x00)
                }
            }
        }

        Scope (\)
        {
            Name (UPC0, Package (0x04)
            {
                0xFF, 
                0x00, 
                0x00, 
                0x00
            })
            Name (PLD0, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x91, 0x12, 0x80, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
            })
            Name (UPC1, Package (0x04)
            {
                0xFF, 
                0x00, 
                0x00, 
                0x00
            })
            Name (PLD1, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x91, 0x12, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00   // ........
            })
            Name (UPC2, Package (0x04)
            {
                0xFF, 
                0xFF, 
                0x00, 
                0x00
            })
            Name (PLD2, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x33, 0x1C, 0x80, 0x01, 0x03, 0x00, 0x00, 0x00   // 3.......
            })
            Name (UPC3, Package (0x04)
            {
                0xFF, 
                0x02, 
                0x00, 
                0x00
            })
            Name (PLD3, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x48, 0x1D, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00   // H.......
            })
            Name (UPC4, Package (0x04)
            {
                0xFF, 
                0x00, 
                0x00, 
                0x00
            })
            Name (PLD4, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x69, 0x0C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // i.......
            })
            Name (UPC5, Package (0x04)
            {
                0xFF, 
                0x02, 
                0x00, 
                0x00
            })
            Name (PLD5, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x19, 0x12, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
            })
            Name (UPC6, Package (0x04)
            {
                0x00, 
                0xFF, 
                0x00, 
                0x00
            })
            Name (PLD6, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 0.......
            })
            Name (UPC7, Package (0x04)
            {
                0xFF, 
                0xFF, 
                0x00, 
                0x00
            })
            Name (PLD7, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x33, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // 3.......
            })
            Name (UPC9, Package (0x04)
            {
                0xFF, 
                0x00, 
                0x00, 
                0x00
            })
            Name (PLD9, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x59, 0x12, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // Y.......
            })
            Name (UPCI, Package (0x04)
            {
                0xFF, 
                0xFF, 
                0x00, 
                0x00
            })
            Name (PLDI, Buffer (0x10)
            {
                /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 0.......
            })
            Name (PLDC, Buffer (0x14)
            {
                /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x24, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // $.......
                /* 0010 */  0xEA, 0x00, 0xA9, 0x00                           // ....
            })
        }

        Device (PCI0)
        {
            Name (_BBN, 0x00)  // _BBN: BIOS Bus Number
            Name (_ADR, 0x00)  // _ADR: Address
            Name (RID, 0x00)
            Name (_S3D, 0x02)  // _S3D: S3 Device State
            Name (LRRT, Package (0x16)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x01, 
                    \_SB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    \_SB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    \_SB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    0x00, 
                    \_SB.LNKE, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    \_SB.LNKG, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    \_SB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    \_SB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    \_SB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    \_SB.LNKH, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    \_SB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    \_SB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    \_SB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    \_SB.LNKF, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    \_SB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    \_SB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    \_SB.LNKA, 
                    0x00
                }
            })
            Name (ARRT, Package (0x16)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    0x00, 
                    0x00, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x00, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x00, 
                    0x00, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x00, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x01, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    0x00, 
                    0x10
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (\GPIC)
                {
                    Return (ARRT) /* \_SB_.PCI0.ARRT */
                }
                Else
                {
                    Return (LRRT) /* \_SB_.PCI0.LRRT */
                }
            }

            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            OperationRegion (MHCS, PCI_Config, 0x40, 0xC0)
            Field (MHCS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x40), 
                PAM0,   8, 
                PAM1,   8, 
                PAM2,   8, 
                PAM3,   8, 
                PAM4,   8, 
                PAM5,   8, 
                PAM6,   8, 
                Offset (0x7C), 
                    ,   20, 
                TLUD,   12
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, _Y25)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y19, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y20, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y21, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y22, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00100000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEB00000,         // Length
                    ,, _Y23, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED4BFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000C000,         // Length
                    ,, _Y24, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (_CRS, \_SB.PCI0._Y17._LEN, C0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y18._LEN, C4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y19._LEN, C8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1A._LEN, CCLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1B._LEN, D0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1C._LEN, D4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1D._LEN, D8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1E._LEN, DCLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1F._LEN, E0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y20._LEN, E4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y21._LEN, E8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y22._LEN, ECLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y23._MIN, XXMN)  // _MIN: Minimum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y23._MAX, XXMX)  // _MAX: Maximum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y23._LEN, XXLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y24._MIN, F4MN)  // _MIN: Minimum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y24._MAX, F4MX)  // _MAX: Maximum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y24._LEN, F4LN)  // _LEN: Length
            CreateWordField (_CRS, \_SB.PCI0._Y25._MAX, B0MX)  // _MAX: Maximum Base Address
            CreateWordField (_CRS, \_SB.PCI0._Y25._LEN, B0LN)  // _LEN: Length
            Method (_INI, 0, Serialized)  // _INI: Initialize
            {
                B0MX = 0x3F
                B0LN = (0x3F + 0x01)
                If (!\OSIF)
                {
                    \_SB._INI ()
                }

                Local0 = (TLUD << 0x14)
                \MEMX = Local0
                XXMN = Local0
                XXLN = ((XXMX - XXMN) + 0x01)
                If ((\TPMP == 0x00))
                {
                    F4LN = 0x00
                }

                If ((PAM1 & 0x03))
                {
                    C0LN = 0x00
                }

                If ((PAM1 & 0x30))
                {
                    C4LN = 0x00
                }

                If ((PAM2 & 0x03))
                {
                    C8LN = 0x00
                }

                If ((PAM2 & 0x30))
                {
                    CCLN = 0x00
                }

                If ((PAM3 & 0x03))
                {
                    D0LN = 0x00
                }

                If ((PAM3 & 0x30))
                {
                    D4LN = 0x00
                }

                If ((PAM4 & 0x03))
                {
                    D8LN = 0x00
                }

                If ((PAM4 & 0x30))
                {
                    DCLN = 0x00
                }

                If ((PAM5 & 0x03))
                {
                    E0LN = 0x00
                }

                If ((PAM5 & 0x30))
                {
                    E4LN = 0x00
                }

                If ((PAM6 & 0x03))
                {
                    E8LN = 0x00
                }

                If ((PAM6 & 0x30))
                {
                    ECLN = 0x00
                }
            }

            Name (SUPP, 0x00)
            Name (CTRL, 0x00)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, 0x00, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (\_SB.PCI0.XHCI.CUID (Arg0))
                {
                    Return (\_SB.PCI0.XHCI.POSC (Arg1, Arg2, Arg3))
                }

                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    CTRL &= 0x0D
                    If (!(CDW1 & 0x01))
                    {
                        If ((CTRL & 0x01))
                        {
                            If (!\VIGD)
                            {
                                \_SB.PCI0.PEG.HPGP = 0x00
                                \_SB.PCI0.PEG.GMGP = 0x00
                            }

                            \_SB.PCI0.EXP1.HPCE = 0x00
                            \_SB.PCI0.EXP1.HPCS = 0x01
                            \_SB.PCI0.EXP1.PDC = 0x01
                            \_SB.PCI0.EXP3.HPCE = 0x00
                            \_SB.PCI0.EXP3.HPCS = 0x01
                            \_SB.PCI0.EXP3.PDC = 0x01
                            \NHPS = 0x01
                        }

                        If ((CTRL & 0x04))
                        {
                            If (!\VIGD)
                            {
                                \_SB.PCI0.PEG.PMGP = 0x00
                                \_SB.PCI0.PEG.GMGP = 0x00
                            }

                            If (\_SB.PCI0.EXP1.PMCE)
                            {
                                \_SB.PCI0.EXP1.PMCE = 0x00
                                \_SB.PCI0.EXP1.PMCS = 0x01
                            }

                            If (\_SB.PCI0.EXP2.PMCE)
                            {
                                \_SB.PCI0.EXP2.PMCE = 0x00
                                \_SB.PCI0.EXP2.PMCS = 0x01
                            }

                            If (\_SB.PCI0.EXP3.PMCE)
                            {
                                \_SB.PCI0.EXP3.PMCE = 0x00
                                \_SB.PCI0.EXP3.PMCS = 0x01
                            }

                            \_SB.PCI0.LPC.EXPE = 0x00
                            \NPME = 0x01
                        }
                    }

                    If ((Arg1 != 0x01))
                    {
                        CDW1 |= 0x0A
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                }
                Else
                {
                    CDW1 |= 0x06
                }

                Return (Arg3)
            }

            Mutex (MDGS, 0x07)
            Name (VDEE, 0x01)
            Name (VDDA, Buffer (0x02){})
            CreateBitField (VDDA, 0x00, VUPC)
            CreateBitField (VDDA, 0x01, VQDL)
            CreateBitField (VDDA, 0x02, VQDC)
            CreateBitField (VDDA, 0x03, VQD0)
            CreateBitField (VDDA, 0x04, VQD1)
            CreateBitField (VDDA, 0x05, VQD2)
            CreateBitField (VDDA, 0x06, VSDL)
            CreateBitField (VDDA, 0x07, VSDC)
            CreateBitField (VDDA, 0x08, VSD0)
            CreateBitField (VDDA, 0x09, VSD1)
            CreateBitField (VDDA, 0x0A, VSD2)
            CreateBitField (VDDA, 0x0B, VSD3)
            CreateBitField (VDDA, 0x0C, VSD4)
            CreateBitField (VDDA, 0x0D, VSD5)
            CreateBitField (VDDA, 0x0E, MSWT)
            Device (VID)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (RID, 0x00)
                OperationRegion (VPCG, PCI_Config, 0x00, 0x0100)
                Field (VPCG, DWordAcc, NoLock, Preserve)
                {
                    Offset (0xD4), 
                    VPWR,   8
                }

                Name (MIDL, 0x0400)
                Name (MIDC, 0x0100)
                Name (MID0, 0x0300)
                Name (MID1, 0x0301)
                Name (MID2, 0x0302)
                Name (MID3, 0x0303)
                Name (MID4, 0x0304)
                Name (MID5, 0x0305)
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    CLID = \_SB.LID._LID ()
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    Noop
                }

                Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                {
                    Noop
                }

                Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                {
                    Noop
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    Noop
                }

                Method (VSWT, 0, NotSerialized)
                {
                    GHDS (0x00)
                }

                Method (VLOC, 1, NotSerialized)
                {
                    If ((Arg0 == \_SB.LID._LID ()))
                    {
                        \VSLD (Arg0)
                        If ((VPWR == 0x00))
                        {
                            CLID = Arg0
                            GNOT (0x02, 0x00)
                        }
                    }
                }

                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Arg0 &= 0x03
                    If ((Arg0 == 0x02))
                    {
                        Local0 = 0x14
                        While (Local0)
                        {
                            Local0--
                            Acquire (MDGS, 0xFFFF)
                            If ((0x00 == MSWT))
                            {
                                MSWT = 0x01
                                Local0 = 0x00
                                VDEE = Arg0
                            }

                            Release (MDGS)
                            Sleep (0xC8)
                        }
                    }
                    Else
                    {
                        Acquire (MDGS, 0xFFFF)
                        If ((VDEE == 0x02))
                        {
                            MSWT = 0x00
                        }

                        If ((Arg0 > 0x02))
                        {
                            VDEE = 0x01
                        }
                        Else
                        {
                            VDEE = Arg0
                        }

                        Release (MDGS)
                    }
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    NDID = 0x00
                    If ((DIDL != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL2 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL3 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL4 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL5 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL6 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL7 != 0x00))
                    {
                        NDID++
                    }

                    If ((DDL8 != 0x00))
                    {
                        NDID++
                    }

                    If ((NDID == 0x01))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            0xFFFFFFFF
                        })
                        TMP1 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        Return (TMP1) /* \_SB_.PCI0.VID_._DOD.TMP1 */
                    }

                    If ((NDID == 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP2 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP2 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        Return (TMP2) /* \_SB_.PCI0.VID_._DOD.TMP2 */
                    }

                    If ((NDID == 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP3 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP3 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP3 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        Return (TMP3) /* \_SB_.PCI0.VID_._DOD.TMP3 */
                    }

                    If ((NDID == 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP4 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP4 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP4 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        TMP4 [0x03] = (0x80010000 | (0x0F0F & DDL4))
                        Return (TMP4) /* \_SB_.PCI0.VID_._DOD.TMP4 */
                    }

                    If ((NDID == 0x05))
                    {
                        Name (TMP5, Package (0x05)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP5 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP5 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP5 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        TMP5 [0x03] = (0x80010000 | (0x0F0F & DDL4))
                        TMP5 [0x04] = (0x80010000 | (0x0F0F & DDL5))
                        Return (TMP5) /* \_SB_.PCI0.VID_._DOD.TMP5 */
                    }

                    If ((NDID == 0x06))
                    {
                        Name (TMP6, Package (0x06)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP6 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP6 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP6 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        TMP6 [0x03] = (0x80010000 | (0x0F0F & DDL4))
                        TMP6 [0x04] = (0x80010000 | (0x0F0F & DDL5))
                        TMP6 [0x05] = (0x80010000 | (0x0F0F & DDL6))
                        Return (TMP6) /* \_SB_.PCI0.VID_._DOD.TMP6 */
                    }

                    If ((NDID == 0x07))
                    {
                        Name (TMP7, Package (0x07)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP7 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP7 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP7 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        TMP7 [0x03] = (0x80010000 | (0x0F0F & DDL4))
                        TMP7 [0x04] = (0x80010000 | (0x0F0F & DDL5))
                        TMP7 [0x05] = (0x80010000 | (0x0F0F & DDL6))
                        TMP7 [0x06] = (0x80010000 | (0x0F0F & DDL7))
                        Return (TMP7) /* \_SB_.PCI0.VID_._DOD.TMP7 */
                    }

                    If ((NDID > 0x07))
                    {
                        Name (TMP8, Package (0x08)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        TMP8 [0x00] = (0x80010000 | (0x0F0F & DIDL))
                        TMP8 [0x01] = (0x80010000 | (0x0F0F & DDL2))
                        TMP8 [0x02] = (0x80010000 | (0x0F0F & DDL3))
                        TMP8 [0x03] = (0x80010000 | (0x0F0F & DDL4))
                        TMP8 [0x04] = (0x80010000 | (0x0F0F & DDL5))
                        TMP8 [0x05] = (0x80010000 | (0x0F0F & DDL6))
                        TMP8 [0x06] = (0x80010000 | (0x0F0F & DDL7))
                        TMP8 [0x07] = (0x80010000 | (0x0F0F & DDL8))
                        Return (TMP8) /* \_SB_.PCI0.VID_._DOD.TMP8 */
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Method (VDSW, 1, NotSerialized)
                {
                    If ((VPWR == 0x00))
                    {
                        GDCK (Arg0)
                    }
                }

                Method (VCAD, 1, NotSerialized)
                {
                    Local0 = 0x00
                    If (((DIDL & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL2 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL3 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL4 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL5 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL6 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL7 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }
                    ElseIf (((DDL8 & 0x0F0F) == Arg0))
                    {
                        Local0 = 0x0D
                    }

                    If (((CPDL & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL2 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL3 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL4 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL5 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL6 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL7 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }
                    ElseIf (((CPL8 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x10
                    }

                    If (((CADL & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL2 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL3 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL4 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL5 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL6 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL7 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }
                    ElseIf (((CAL8 & 0x0F0F) == Arg0))
                    {
                        Local0 |= 0x02
                    }

                    Return (Local0)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (((NADL & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL2 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL3 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL4 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL5 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL6 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL7 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }
                    ElseIf (((NDL8 & 0x0F0F) == Arg0))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Device (LCD0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0400)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MIDL))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MIDL))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSDL = (Arg0 & 0x01)
                    }

                    Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                    {
                        If ((Arg0 == 0x01))
                        {
                            Return (\VEDI)
                        }
                        ElseIf ((Arg0 == 0x02))
                        {
                            Return (\VEDI)
                        }

                        Return (0x00)
                    }
                }

                Device (CRT0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0100)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MIDC))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MIDC))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSDC = (Arg0 & 0x01)
                    }
                }

                Device (DVI0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0300)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID0))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID0))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD0 = (Arg0 & 0x01)
                    }
                }

                Device (DVI1)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0301)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID1))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID1))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD1 = (Arg0 & 0x01)
                    }
                }

                Device (DVI2)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0302)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID2))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID2))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD2 = (Arg0 & 0x01)
                    }
                }

                Device (DVI3)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0303)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID3))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID3))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD3 = (Arg0 & 0x01)
                    }
                }

                Device (DVI4)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0304)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID4))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID4))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD4 = (Arg0 & 0x01)
                    }
                }

                Device (DVI5)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0305)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID5))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID5))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        VSD5 = (Arg0 & 0x01)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                    Offset (0xB2), 
                    Offset (0xB5), 
                    LBPC,   8, 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, \ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                    SROT,   32, 
                    IUER,   32, 
                    FDSP,   64, 
                    FDSS,   32, 
                    Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    0x00, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0x00, 
                        0x00
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    If ((GEFC == 0x04))
                    {
                        GXFC = GBDA ()
                    }

                    If ((GEFC == 0x06))
                    {
                        GXFC = SBCB ()
                    }

                    GEFC = 0x00
                    \_SB.PCI0.LPC.SCIS = 0x01
                    GSSE = 0x00
                    SCIE = 0x00
                    Return (Zero)
                }

                Method (GBDA, 0, Serialized)
                {
                    If ((GESF == 0x00))
                    {
                        PARM = 0x0241
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x01))
                    {
                        PARM = 0x0202
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x04))
                    {
                        PARM &= 0xEFFF0000
                        PARM &= (DerefOf (DBTB [IBTT]) << 0x10)
                        PARM |= IBTT /* \_SB_.PCI0.VID_.PARM */
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x05))
                    {
                        If (\_SB.LID._LID ())
                        {
                            LIDS = 0x01
                        }
                        Else
                        {
                            LIDS = 0x00
                        }

                        PARM = IPSC /* \IPSC */
                        PARM += 0x01
                        PARM += 0x0300
                        PARM += 0x00010000
                        PARM |= (LIDS << 0x10)
                        PARM |= (IBIA << 0x14)
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x06))
                    {
                        PARM = ITVF /* \ITVF */
                        PARM |= (ITVM << 0x04)
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x07))
                    {
                        PARM = GIVD /* \_SB_.PCI0.VID_.GIVD */
                        PARM ^= 0x01
                        PARM |= (GMFN << 0x01)
                        PARM |= (0x03 << 0x0B)
                        PARM |= (0x03 << 0x11)
                        PARM |= (DerefOf (DerefOf (CDCT [HVCO]) [CDVL]) << 
                            0x15) /* \_SB_.PCI0.VID_.PARM */
                        GESF = 0x01
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x0A))
                    {
                        PARM = 0x00
                        If (ISSC)
                        {
                            PARM |= 0x03
                        }

                        GESF = 0x00
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    GESF = Zero
                    Return (CRIT) /* \_SB_.PCI0.VID_.CRIT */
                }

                Method (SBCB, 0, Serialized)
                {
                    If ((GESF == 0x00))
                    {
                        PARM = 0x0101
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x01))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x03))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x04))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x05))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x06))
                    {
                        ITVF = (PARM & 0x0F)
                        ITVM = ((PARM & 0xF0) >> 0x04)
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x07))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x08))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x09))
                    {
                        IBTT = (PARM & 0xFF)
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x0A))
                    {
                        IPSC = (PARM & 0xFF)
                        If (((PARM >> 0x08) & 0xFF))
                        {
                            IPAT = ((PARM >> 0x08) & 0xFF)
                            IPAT--
                        }

                        IBIA = ((PARM >> 0x14) & 0x07)
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x0B))
                    {
                        IF1E = ((PARM >> 0x01) & 0x01)
                        If ((PARM & (0x0F << 0x0D)))
                        {
                            IDMS = ((PARM >> 0x0D) & 0x0F)
                        }
                        Else
                        {
                            IDMS = ((PARM >> 0x11) & 0x0F)
                        }

                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x10))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x11))
                    {
                        PARM = (LIDS << 0x08)
                        PARM += 0x0100
                        GESF = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x12))
                    {
                        If ((PARM & 0x01))
                        {
                            If (((PARM >> 0x01) == 0x01))
                            {
                                ISSC = 0x01
                            }
                            Else
                            {
                                GESF = Zero
                                Return (CRIT) /* \_SB_.PCI0.VID_.CRIT */
                            }
                        }
                        Else
                        {
                            ISSC = 0x00
                        }

                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x13))
                    {
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    If ((GESF == 0x14))
                    {
                        PAVP = (PARM & 0x0F)
                        GESF = Zero
                        PARM = Zero
                        Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                    }

                    GESF = Zero
                    Return (SUCC) /* \_SB_.PCI0.VID_.SUCC */
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (!DRDY)
                    {
                        Sleep (ASLP)
                    }

                    Return (!DRDY)
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If ((CSTS > 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return ((CSTS == 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (0x01)
                    }

                    CEVT = Arg0
                    CSTS = 0x03
                    If (((CHPD == 0x00) && (Arg1 == 0x00)))
                    {
                        If ((Arg0 != 0x01))
                        {
                            If ((\WXPF && !\WVIS))
                            {
                                Notify (\_SB.PCI0, Arg1)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.VID, Arg1)
                            }
                        }
                    }

                    Notify (\_SB.PCI0.VID, 0x80) // Status Change
                    Return (0x00)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    TIDX = Arg0
                    Return (GNOT (0x01, 0x00))
                }

                Method (GLID, 1, NotSerialized)
                {
                    CLID = Arg0
                    Return (GNOT (0x02, 0x00))
                }

                Method (GLIS, 1, NotSerialized)
                {
                    CLID = Arg0
                    Return (0x00)
                }

                Method (GDCK, 1, NotSerialized)
                {
                    CDCK = Arg0
                    Return (GNOT (0x04, 0x80))
                }

                Method (GDCS, 1, NotSerialized)
                {
                    CDCK = Arg0
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (!ARDY)
                    {
                        Sleep (ASLP)
                    }

                    Return (!ARDY)
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (!(TCHE & (0x01 << Arg0)))
                    {
                        Return (0x01)
                    }

                    If (PARD ())
                    {
                        Return (0x01)
                    }

                    If ((Arg0 == 0x02))
                    {
                        PFIT ^= 0x07
                        PFIT |= 0x80000000
                        ASLC = 0x04
                    }
                    ElseIf ((Arg0 == 0x01))
                    {
                        BCLP = Arg1
                        BCLP |= 0x80000000
                        ASLC = 0x0A
                    }
                    ElseIf ((Arg0 == 0x03))
                    {
                        PFMB = Arg1
                        PFMB |= 0x80000100
                    }
                    ElseIf ((Arg0 == 0x00))
                    {
                        ALSI = Arg1
                        ASLC = 0x01
                    }
                    Else
                    {
                        Return (0x01)
                    }

                    ASLE = 0x01
                    Return (0x00)
                }
            }

            Device (LPC)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x00)  // _UID: Unique ID
                    Name (SCRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x15E0,             // Range Minimum
                            0x15E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1600,             // Range Minimum
                            0x1600,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF8000000,         // Address Base
                            0x04000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00001000,         // Address Length
                            _Y26)
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED10000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED18000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED19000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED45000,         // Address Base
                            0x00007000,         // Address Length
                            )
                    })
                    CreateDWordField (SCRS, \_SB.PCI0.LPC.SIO._Y26._BAS, TRMB)  // _BAS: Base Address
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        TRMB = \TBAB
                        If ((\_SB.PCI0.LPC.TPM._STA () == 0x0F))
                        {
                            Return (SCRS) /* \_SB_.PCI0.LPC_.SIO_.SCRS */
                        }
                        Else
                        {
                            Local0 = (SizeOf (SCRS) - 0x02)
                            Name (BUF0, Buffer (Local0){})
                            Local0 += SizeOf (\_SB.PCI0.LPC.TPM.BUF1)
                            Name (BUF1, Buffer (Local0){})
                            BUF0 = SCRS /* \_SB_.PCI0.LPC_.SIO_.SCRS */
                            Concatenate (BUF0, \_SB.PCI0.LPC.TPM.BUF1, BUF1) /* \_SB_.PCI0.LPC_.SIO_._CRS.BUF1 */
                            Return (BUF1) /* \_SB_.PCI0.LPC_.SIO_._CRS.BUF1 */
                        }
                    }
                }

                OperationRegion (LPCS, PCI_Config, 0x00, 0x0100)
                Field (LPCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    SERQ,   8, 
                    Offset (0x68), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                    Offset (0x80), 
                    XU1A,   3, 
                        ,   1, 
                    XU2A,   3, 
                    Offset (0x81), 
                    XPA,    2, 
                        ,   2, 
                    XFA,    1, 
                    Offset (0x82), 
                    XU1E,   1, 
                    XU2E,   1, 
                    XPE,    1, 
                    XFE,    1, 
                    Offset (0x84), 
                    XG1E,   1, 
                        ,   1, 
                    XG1A,   14, 
                    Offset (0x88), 
                    XG2E,   1, 
                        ,   1, 
                    XG2A,   14, 
                    Offset (0xA0), 
                        ,   2, 
                    CLKR,   1, 
                        ,   7, 
                    EXPE,   1, 
                    Offset (0xA2), 
                    Offset (0xAC), 
                    Offset (0xAD), 
                    Offset (0xAE), 
                    XUSB,   1, 
                    Offset (0xB8), 
                        ,   12, 
                    GR06,   2
                }

                OperationRegion (LPIO, SystemIO, 0x0500, 0x80)
                Field (LPIO, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                        ,   6, 
                    GLIS,   1, 
                    Offset (0x0F), 
                    Offset (0x10), 
                    Offset (0x2C), 
                        ,   6, 
                    XHPD,   1, 
                    Offset (0x38), 
                        ,   6, 
                    PIDH,   2, 
                    Offset (0x3A), 
                    PIDL,   2, 
                    Offset (0x48), 
                    DOI0,   1, 
                    DOI1,   1, 
                    DOI2,   1, 
                    DOI3,   1
                }

                OperationRegion (PMIO, SystemIO, 0x0400, 0x80)
                Field (PMIO, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x2A), 
                        ,   6, 
                    XHPE,   1, 
                    Offset (0x42), 
                        ,   1, 
                    SWGE,   1, 
                    Offset (0x64), 
                        ,   9, 
                    SCIS,   1, 
                    Offset (0x66)
                }

                OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
                Field (IO_T, ByteAcc, NoLock, Preserve)
                {
                    TRPI,   16, 
                    Offset (0x04), 
                    Offset (0x06), 
                    Offset (0x08), 
                    TRP0,   8, 
                    Offset (0x0A), 
                    Offset (0x0B), 
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    Offset (0x0F), 
                    Offset (0x10)
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((\WNTF && !\WXPF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y27)
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y27._BAS, HPT0)  // _BAS: Base Address
                        HPT0 = \HPET
                        Return (BUF0) /* \_SB_.PCI0.LPC_.HPET.BUF0 */
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, BusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (FPU)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (KBD)
                {
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        If (\WIN8)
                        {
                            Return (0x7100AE30)
                        }

                        Return (0x0303D041)
                    }

                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (MOU)
                {
                    Name (_HID, EisaId ("IBM3780"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (MHID, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.LPC.PADD)
                        {
                            _HID = 0x80374D24
                        }
                        Else
                        {
                            _HID = 0x1500AE30
                        }
                    }
                }

                OperationRegion (IMGA, SystemIO, 0x15E0, 0x10)
                Field (IMGA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    Offset (0x02), 
                    Offset (0x03), 
                    WAKR,   16, 
                    Offset (0x0C), 
                    GAIX,   8, 
                    Offset (0x0E), 
                    GADT,   8, 
                    Offset (0x10)
                }

                IndexField (GAIX, GADT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x50), 
                        ,   3, 
                    IVPW,   1, 
                    DVPW,   1, 
                    BLPL,   1, 
                    Offset (0x51), 
                    TP4R,   1, 
                    PADR,   1, 
                    BPAD,   1, 
                        ,   1, 
                        ,   1, 
                    PADD,   1, 
                    Offset (0x60), 
                    EPWG,   1, 
                        ,   1, 
                    CSON,   1, 
                    DSCI,   1, 
                    DSCS,   1, 
                    DLAN,   1, 
                    Offset (0xC2), 
                    GAID,   8
                }

                Scope (\_SB)
                {
                    Name (TCGP, Buffer (0x08)
                    {
                         0x1F, 0xE0, 0x1F, 0x01, 0x02, 0x04, 0x08, 0xF0   // ........
                    })
                    CreateByteField (TCGP, 0x00, PPRQ)
                    CreateByteField (TCGP, 0x01, PPL1)
                    CreateByteField (TCGP, 0x02, PPRP)
                    CreateByteField (TCGP, 0x03, TPRS)
                    CreateByteField (TCGP, 0x04, PPOR)
                    CreateByteField (TCGP, 0x05, TPMV)
                    CreateByteField (TCGP, 0x06, MOR)
                    CreateByteField (TCGP, 0x07, TVEN)
                    OperationRegion (TCGC, SystemIO, 0x72, 0x02)
                    Field (TCGC, ByteAcc, Lock, Preserve)
                    {
                        TIDX,   8, 
                        TPDA,   8
                    }

                    IndexField (TIDX, TPDA, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x40), 
                        TPP1,   8, 
                        PPLO,   8, 
                        TPP3,   8
                    }

                    OperationRegion (SMIP, SystemIO, 0xB2, 0x02)
                    Field (SMIP, ByteAcc, NoLock, Preserve)
                    {
                        SMIT,   8, 
                        SMID,   8
                    }
                }

                Device (TPM)
                {
                    Name (TMPV, 0x00)
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        If ((TVID == 0x15D1))
                        {
                            Return (0x0201D824)
                        }

                        If (((TVID == 0x1050) || (TVID == 0x100B)))
                        {
                            Return (0x0010A35C)
                        }

                        If ((TVID == 0x19FA))
                        {
                            Return (0x0435CF4D)
                        }

                        If ((TDID == 0x1002))
                        {
                            Return (0x02016D08)
                        }

                        If ((TDID == 0x1001))
                        {
                            Return (0x01016D08)
                        }

                        If ((TVID == 0x1114))
                        {
                            Return (0x00128D06)
                        }

                        If ((TVID == 0x104A))
                        {
                            Return (0x0012AF4D)
                        }

                        Return (0x310CD041)
                    }

                    Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x1000)
                    Field (TMMB, ByteAcc, Lock, Preserve)
                    {
                        ACCS,   8, 
                        Offset (0x18), 
                        TSTA,   8, 
                        TBCA,   8, 
                        Offset (0xF00), 
                        TVID,   16, 
                        TDID,   16
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((ACCS == 0xFF))
                        {
                            Return (0x00)
                        }
                        ElseIf ((TPME == 0x00))
                        {
                            Return (0x00)
                        }

                        Return (0x0F)
                    }

                    Name (BUF1, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED40000,         // Address Base
                            0x00005000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (BUF1) /* \_SB_.PCI0.LPC_.TPM_.BUF1 */
                    }

                    Method (UCMP, 2, NotSerialized)
                    {
                        If ((0x10 != SizeOf (Arg0)))
                        {
                            Return (0x00)
                        }

                        If ((0x10 != SizeOf (Arg1)))
                        {
                            Return (0x00)
                        }

                        Local0 = 0x00
                        While ((Local0 < 0x10))
                        {
                            If ((DerefOf (Arg0 [Local0]) != DerefOf (Arg1 [Local0]
                                )))
                            {
                                Return (0x00)
                            }

                            Local0++
                        }

                        Return (0x01)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Name (TTMP, Buffer (0x01)
                        {
                             0x00                                             // .
                        })
                        CreateByteField (TTMP, 0x00, TMPV)
                        If ((UCMP (Arg0, ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */) == 0x01))
                        {
                            If ((Arg2 == 0x00))
                            {
                                Return (Buffer (0x02)
                                {
                                     0xFF, 0x01                                       // ..
                                })
                            }

                            If ((Arg2 == 0x01))
                            {
                                Return (Buffer (0x04)
                                {
                                    "1.2"
                                })
                            }

                            If ((Arg2 == 0x02))
                            {
                                If (TPRS)
                                {
                                    If ((DerefOf (Arg3 [0x00]) <= 0x0B))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    If (((DerefOf (Arg3 [0x00]) >= 0x0E) && (
                                        DerefOf (Arg3 [0x00]) <= 0x12)))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    If (((DerefOf (Arg3 [0x00]) == 0x15) || (DerefOf (
                                        Arg3 [0x00]) == 0x16)))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    Return (0x01)
                                }

                                Return (0x02)
                            }

                            If ((Arg2 == 0x03))
                            {
                                Name (TMP1, Package (0x02)
                                {
                                    0x00, 
                                    0xFFFFFFFF
                                })
                                TMPV = TPP1 /* \_SB_.TPP1 */
                                TMP1 [0x01] = TMPV &= PPRQ /* \_SB_.PPRQ */
                                Return (TMP1) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP1 */
                            }

                            If ((Arg2 == 0x04))
                            {
                                Return (0x02)
                            }

                            If ((Arg2 == 0x05))
                            {
                                Name (TMP2, Package (0x03)
                                {
                                    0x00, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF
                                })
                                TMP2 [0x01] = \_SB.PPLO
                                If ((((\_SB.PPLO > 0x16) || (\_SB.PPLO == 0x0C)) || (\_SB.PPLO == 0x0D)))
                                {
                                    TMP2 [0x02] = 0xFFFFFFF1
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                If ((PPRQ == 0xFF))
                                {
                                    TMP2 [0x02] = 0xFFFFFFF1
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                TMPV = TPP3 /* \_SB_.TPP3 */
                                If ((TMPV & 0x04))
                                {
                                    TMP2 [0x02] = 0xFFFFFFF0
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                TMP2 [0x02] = 0x00
                                Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                            }

                            If ((Arg2 == 0x06))
                            {
                                Return (0x03)
                            }

                            If ((Arg2 == 0x07))
                            {
                                If (TPRS)
                                {
                                    If ((DerefOf (Arg3 [0x00]) <= 0x0B))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    If (((DerefOf (Arg3 [0x00]) >= 0x0E) && (
                                        DerefOf (Arg3 [0x00]) <= 0x12)))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    If (((DerefOf (Arg3 [0x00]) == 0x15) || (DerefOf (
                                        Arg3 [0x00]) == 0x16)))
                                    {
                                        SMID = DerefOf (Arg3 [0x00])
                                        SMIT = 0xC1
                                        TPP1 = DerefOf (Arg3 [0x00])
                                        Return (0x00)
                                    }

                                    Return (0x01)
                                }

                                Return (0x02)
                            }

                            If ((Arg2 == 0x08))
                            {
                                Name (PPIP, 0x00)
                                Name (PPIC, 0x00)
                                TMPV = TPP3 /* \_SB_.TPP3 */
                                If ((TMPV & 0x10))
                                {
                                    PPIP = 0x01
                                }

                                If ((TMPV & 0x20))
                                {
                                    PPIC = 0x01
                                }

                                If ((DerefOf (Arg3 [0x00]) == 0x05))
                                {
                                    If ((PPIC > 0x00))
                                    {
                                        Return (0x04)
                                    }

                                    Return (0x03)
                                }

                                If (((DerefOf (Arg3 [0x00]) >= 0x01) && (
                                    DerefOf (Arg3 [0x00]) <= 0x04)))
                                {
                                    If ((PPIP > 0x00))
                                    {
                                        Return (0x04)
                                    }

                                    Return (0x03)
                                }

                                If (((DerefOf (Arg3 [0x00]) >= 0x06) && (
                                    DerefOf (Arg3 [0x00]) <= 0x0B)))
                                {
                                    If ((PPIP > 0x00))
                                    {
                                        Return (0x04)
                                    }

                                    Return (0x03)
                                }

                                If (((DerefOf (Arg3 [0x00]) == 0x0E) || ((
                                    DerefOf (Arg3 [0x00]) >= 0x15) && (DerefOf (Arg3 [0x00]) <= 
                                    0x16))))
                                {
                                    If (((PPIP > 0x00) && (PPIC > 0x00)))
                                    {
                                        Return (0x04)
                                    }

                                    Return (0x03)
                                }

                                If (((DerefOf (Arg3 [0x00]) == 0x10) || (DerefOf (
                                    Arg3 [0x00]) == 0x12)))
                                {
                                    Return (0x03)
                                }

                                If (((DerefOf (Arg3 [0x00]) == 0x00) || ((DerefOf (
                                    Arg3 [0x00]) == 0x0F) || (DerefOf (Arg3 [0x00]) == 0x11))))
                                {
                                    Return (0x04)
                                }

                                Return (0x00)
                            }

                            Return (0x01)
                        }

                        If ((UCMP (Arg0, ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* Unknown UUID */) == 0x01))
                        {
                            If ((Arg2 == 0x00))
                            {
                                Return (Buffer (0x01)
                                {
                                     0x01                                             // .
                                })
                            }

                            If ((Arg2 == 0x01))
                            {
                                If ((DerefOf (Arg3 [0x00]) & 0x01))
                                {
                                    MORD = 0x01
                                    If ((DerefOf (Arg3 [0x00]) & 0x10))
                                    {
                                        SMID = 0x83
                                        SMIT = 0xC1
                                    }
                                    Else
                                    {
                                        SMID = 0x81
                                        SMIT = 0xC1
                                    }
                                }
                                Else
                                {
                                    MORD = 0x00
                                    If ((DerefOf (Arg3 [0x00]) & 0x10))
                                    {
                                        SMID = 0x82
                                        SMIT = 0xC1
                                    }
                                    Else
                                    {
                                        SMID = 0x80
                                        SMIT = 0xC1
                                    }
                                }

                                Return (0x00)
                            }

                            Return (0x01)
                        }

                        Return (Buffer (0x01)
                        {
                             0x00                                             // .
                        })
                    }

                    Method (CMOR, 0, NotSerialized)
                    {
                        MORD = 0x00
                        SMID = 0x80
                        SMIT = 0xC1
                    }
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, 0x00)  // _UID: Unique ID
                    Name (_GPE, 0x11)  // _GPE: General Purpose Events
                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If ((Arg0 == 0x03))
                        {
                            \H8DR = Arg1
                        }
                    }

                    OperationRegion (ECOR, EmbeddedControl, 0x00, 0x0100)
                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        HDBM,   1, 
                            ,   1, 
                            ,   1, 
                        HFNE,   1, 
                            ,   1, 
                            ,   1, 
                        HLDM,   1, 
                        Offset (0x01), 
                        BBLS,   1, 
                        BTCM,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        HBPR,   1, 
                        BTPC,   1, 
                        Offset (0x02), 
                        HDUE,   1, 
                            ,   4, 
                        SNLK,   1, 
                        Offset (0x03), 
                            ,   5, 
                        HAUM,   2, 
                        Offset (0x05), 
                        HSPA,   1, 
                        Offset (0x06), 
                        HSUN,   8, 
                        HSRP,   8, 
                        Offset (0x0C), 
                        HLCL,   8, 
                            ,   4, 
                        CALM,   1, 
                        Offset (0x0E), 
                        HFNS,   2, 
                        Offset (0x0F), 
                            ,   6, 
                        NULS,   1, 
                        Offset (0x10), 
                        HAM0,   8, 
                        HAM1,   8, 
                        HAM2,   8, 
                        HAM3,   8, 
                        HAM4,   8, 
                        HAM5,   8, 
                        HAM6,   8, 
                        HAM7,   8, 
                        HAM8,   8, 
                        HAM9,   8, 
                        HAMA,   8, 
                        HAMB,   8, 
                        HAMC,   8, 
                        HAMD,   8, 
                        HAME,   8, 
                        HAMF,   8, 
                        Offset (0x23), 
                        HANT,   8, 
                        Offset (0x26), 
                            ,   2, 
                        HANA,   2, 
                        Offset (0x27), 
                        Offset (0x2A), 
                        HATR,   8, 
                        HT0H,   8, 
                        HT0L,   8, 
                        HT1H,   8, 
                        HT1L,   8, 
                        HFSP,   8, 
                            ,   6, 
                        HMUT,   1, 
                        Offset (0x31), 
                            ,   2, 
                        HUWB,   1, 
                        Offset (0x32), 
                        HWPM,   1, 
                        HWLB,   1, 
                        HWLO,   1, 
                        HWDK,   1, 
                        HWFN,   1, 
                        HWBT,   1, 
                        HWRI,   1, 
                        HWBU,   1, 
                        HWLU,   1, 
                        Offset (0x34), 
                            ,   3, 
                        PIBS,   1, 
                            ,   3, 
                        HPLO,   1, 
                        Offset (0x36), 
                        Offset (0x38), 
                        HB0S,   7, 
                        HB0A,   1, 
                        HB1S,   7, 
                        HB1A,   1, 
                        HCMU,   1, 
                            ,   2, 
                        OVRQ,   1, 
                        DCBD,   1, 
                        DCWL,   1, 
                        DCWW,   1, 
                        HB1I,   1, 
                            ,   1, 
                        KBLT,   1, 
                        BTPW,   1, 
                        BTDT,   1, 
                        HUBS,   1, 
                        BDPW,   1, 
                        BDDT,   1, 
                        HUBB,   1, 
                        Offset (0x46), 
                            ,   1, 
                        BTWK,   1, 
                        HPLD,   1, 
                            ,   1, 
                        HPAC,   1, 
                        BTST,   1, 
                        Offset (0x47), 
                        HPBU,   1, 
                            ,   1, 
                        HBID,   1, 
                            ,   3, 
                        HBCS,   1, 
                        HPNF,   1, 
                            ,   1, 
                        GSTS,   1, 
                            ,   2, 
                        HLBU,   1, 
                        DOCD,   1, 
                        HCBL,   1, 
                        Offset (0x49), 
                        SLUL,   1, 
                        Offset (0x4C), 
                        HTMH,   8, 
                        HTML,   8, 
                        HWAK,   16, 
                        HMPR,   8, 
                            ,   7, 
                        HMDN,   1, 
                        Offset (0x78), 
                        TMP0,   8, 
                        Offset (0x80), 
                        Offset (0x81), 
                        HIID,   8, 
                        Offset (0x83), 
                        HFNI,   8, 
                        HSPD,   16, 
                        Offset (0x88), 
                        TSL0,   7, 
                        TSR0,   1, 
                        TSL1,   7, 
                        TSR1,   1, 
                        TSL2,   7, 
                        TSR2,   1, 
                        TSL3,   7, 
                        TSR3,   1, 
                        Offset (0x8D), 
                        HDAA,   3, 
                        HDAB,   3, 
                        HDAC,   2, 
                        Offset (0xB0), 
                        HDEN,   32, 
                        HDEP,   32, 
                        HDEM,   8, 
                        HDES,   8, 
                        MIAC,   8, 
                        PLSL,   8, 
                        PLMS,   8, 
                        PLLS,   8, 
                        PLTU,   8, 
                        Offset (0xC8), 
                        ATMX,   8, 
                        HWAT,   8, 
                        Offset (0xCC), 
                        PWMH,   8, 
                        PWML,   8, 
                        Offset (0xED), 
                            ,   4, 
                        HDDD,   1
                    }

                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        If (\H8DR)
                        {
                            HSPA = 0x00
                        }
                        Else
                        {
                            \MBEC (0x05, 0xFE, 0x00)
                        }

                        BINI ()
                        \_SB.PCI0.LPC.EC.HKEY.WGIN ()
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (LED, 2, NotSerialized)
                    {
                        Local0 = (Arg0 | Arg1)
                        If (\H8DR)
                        {
                            HLCL = Local0
                        }
                        Else
                        {
                            \WBEC (0x0C, Local0)
                        }
                    }

                    Name (BAON, 0x00)
                    Name (WBON, 0x00)
                    Method (BEEP, 1, NotSerialized)
                    {
                        If ((Arg0 == 0x05))
                        {
                            WBON = 0x00
                        }

                        Local2 = WBON /* \_SB_.PCI0.LPC_.EC__.WBON */
                        If (BAON)
                        {
                            If ((Arg0 == 0x00))
                            {
                                BAON = 0x00
                                If (WBON)
                                {
                                    Local0 = 0x03
                                    Local1 = 0x08
                                }
                                Else
                                {
                                    Local0 = 0x00
                                    Local1 = 0x00
                                }
                            }
                            Else
                            {
                                Local0 = 0xFF
                                Local1 = 0xFF
                                If ((Arg0 == 0x11))
                                {
                                    WBON = 0x00
                                }

                                If ((Arg0 == 0x10))
                                {
                                    WBON = 0x01
                                }
                            }
                        }
                        Else
                        {
                            Local0 = Arg0
                            Local1 = 0xFF
                            If ((Arg0 == 0x0F))
                            {
                                Local0 = Arg0
                                Local1 = 0x08
                                BAON = 0x01
                            }

                            If ((Arg0 == 0x11))
                            {
                                Local0 = 0x00
                                Local1 = 0x00
                                WBON = 0x00
                            }

                            If ((Arg0 == 0x10))
                            {
                                Local0 = 0x03
                                Local1 = 0x08
                                WBON = 0x01
                            }
                        }

                        If ((Arg0 == 0x03))
                        {
                            WBON = 0x00
                            If (Local2)
                            {
                                Local0 = 0x07
                                If (((\SPS == 0x03) || (\SPS == 0x04)))
                                {
                                    Local2 = 0x00
                                    Local0 = 0xFF
                                    Local1 = 0xFF
                                }
                            }
                        }

                        If ((Arg0 == 0x07))
                        {
                            If (Local2)
                            {
                                Local2 = 0x00
                                Local0 = 0xFF
                                Local1 = 0xFF
                            }
                        }

                        If (\H8DR)
                        {
                            If ((Local2 && !WBON))
                            {
                                HSRP = 0x00
                                HSUN = 0x00
                                Sleep (0x64)
                            }

                            If ((Local1 != 0xFF))
                            {
                                HSRP = Local1
                            }

                            If ((Local0 != 0xFF))
                            {
                                HSUN = Local0
                            }
                        }
                        Else
                        {
                            If ((Local2 && !WBON))
                            {
                                \WBEC (0x07, 0x00)
                                \WBEC (0x06, 0x00)
                                Sleep (0x64)
                            }

                            If ((Local1 != 0xFF))
                            {
                                \WBEC (0x07, Local1)
                            }

                            If ((Local0 != 0xFF))
                            {
                                \WBEC (0x06, Local0)
                            }
                        }

                        If ((Arg0 == 0x03)){}
                        If ((Arg0 == 0x07))
                        {
                            Sleep (0x01F4)
                        }
                    }

                    Method (EVNT, 1, NotSerialized)
                    {
                        If (\H8DR)
                        {
                            If (Arg0)
                            {
                                HAM7 |= 0x01
                                HAM5 |= 0x04
                            }
                            Else
                            {
                                HAM7 &= 0xFE
                                HAM5 &= 0xFB
                            }
                        }
                        ElseIf (Arg0)
                        {
                            \MBEC (0x17, 0xFF, 0x01)
                            \MBEC (0x15, 0xFF, 0x04)
                        }
                        Else
                        {
                            \MBEC (0x17, 0xFE, 0x00)
                            \MBEC (0x15, 0xFB, 0x00)
                        }
                    }

                    Name (USPS, 0x00)
                    PowerResource (PUBS, 0x03, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (\H8DR)
                            {
                                Local0 = HUBS /* \_SB_.PCI0.LPC_.EC__.HUBS */
                            }
                            Else
                            {
                                Local0 = (\RBEC (0x3B) & 0x10)
                            }

                            If (Local0)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            Local0 = 0x64
                            While ((USPS && Local0))
                            {
                                Sleep (0x01)
                                Local0--
                            }

                            If (\H8DR)
                            {
                                HUBS = 0x01
                            }
                            Else
                            {
                                \MBEC (0x3B, 0xFF, 0x10)
                            }
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            USPS = 0x01
                            If (\H8DR)
                            {
                                HUBS = 0x00
                            }
                            Else
                            {
                                \MBEC (0x3B, 0xEF, 0x00)
                            }

                            Sleep (0x14)
                            USPS = 0x00
                        }
                    }

                    Method (CHKS, 0, NotSerialized)
                    {
                        Local0 = 0x03E8
                        While (HMPR)
                        {
                            Sleep (0x01)
                            Local0--
                            If (!Local0)
                            {
                                Return (0x8080)
                            }
                        }

                        If (HMDN)
                        {
                            Return (Zero)
                        }

                        Return (0x8081)
                    }

                    Method (LPMD, 0, NotSerialized)
                    {
                        Local0 = 0x00
                        Local1 = 0x00
                        Local2 = 0x00
                        If (\H8DR)
                        {
                            If (HPAC)
                            {
                                If (HPLO)
                                {
                                    Local0 = \LPST
                                }
                                ElseIf ((HWAT < \LPAW))
                                {
                                    If (HB0A)
                                    {
                                        If (((HB0S & 0x10) || ((HB0S & 0x07) < 0x02)))
                                        {
                                            Local1 = 0x01
                                        }
                                    }
                                    Else
                                    {
                                        Local1 = 0x01
                                    }

                                    If (HB1A)
                                    {
                                        If (((HB1S & 0x10) || ((HB1S & 0x07) < 0x02)))
                                        {
                                            Local2 = 0x01
                                        }
                                    }
                                    Else
                                    {
                                        Local2 = 0x01
                                    }

                                    If ((Local1 && Local2))
                                    {
                                        Local0 = \LPST
                                    }
                                }
                            }
                        }
                        ElseIf ((\RBEC (0x46) & 0x10))
                        {
                            If ((\RBEC (0x34) & 0x80))
                            {
                                Local0 = \LPST
                            }
                            ElseIf ((\RBEC (0xC9) < \LPAW))
                            {
                                Local3 = \RBEC (0x38)
                                If ((Local3 & 0x80))
                                {
                                    If (((Local3 & 0x10) || ((Local3 & 0x07) < 0x02)))
                                    {
                                        Local1 = 0x01
                                    }
                                }
                                Else
                                {
                                    Local2 = 0x01
                                }

                                Local3 = \RBEC (0x39)
                                If ((Local3 & 0x80))
                                {
                                    If (((Local3 & 0x10) || ((Local3 & 0x07) < 0x02)))
                                    {
                                        Local1 = 0x01
                                    }
                                }
                                Else
                                {
                                    Local2 = 0x01
                                }

                                If ((Local1 && Local2))
                                {
                                    Local0 = \LPST
                                }
                            }
                        }

                        Return (Local0)
                    }

                    Method (CLPM, 0, NotSerialized)
                    {
                        If ((\PPMF & 0x01))
                        {
                            If (\OSPX)
                            {
                                \PNTF (0x80)
                            }
                            Else
                            {
                                Local0 = LPMD ()
                                If (Local0)
                                {
                                    \STEP (0x04)
                                }
                                Else
                                {
                                    \STEP (0x05)
                                }
                            }
                        }
                    }

                    Mutex (MCPU, 0x07)
                    Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x01))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1001)
                        }
                    }

                    Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Noop
                    }

                    Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x02))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1002)
                        }
                    }

                    Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1004)
                        }
                        Else
                        {
                            Notify (\_SB.SLPB, 0x80) // Status Change
                        }
                    }

                    Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x10))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1005)
                        }
                    }

                    Method (_Q65, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x20))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1006)
                        }
                    }

                    Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x40))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1007)
                        }
                        Else
                        {
                            If ((\VHYB (0x03, 0x00) == 0x03))
                            {
                                Notify (\_SB.PCI0.VID, 0x80) // Status Change
                                Return (Zero)
                            }

                            If (VIGD)
                            {
                                \_SB.PCI0.VID.VSWT ()
                            }
                            Else
                            {
                                \_SB.PCI0.PEG.VID.VSWT ()
                            }
                        }
                    }

                    Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x80))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1008)
                        }
                        ElseIf (!\WNTF)
                        {
                            VEXP ()
                        }
                    }

                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x0100))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1009)
                        }

                        Noop
                    }

                    Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x0200))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100A)
                        }
                    }

                    Method (_Q1A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x0400))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100B)
                        }
                    }

                    Method (_Q1B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100C)
                    }

                    Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x1000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100D)
                        }
                    }

                    Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x2000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100E)
                        }
                    }

                    Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x4000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x100F)
                        }
                    }

                    Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00020000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1012)
                        }

                        \UCMS (0x0E)
                    }

                    Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00040000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1013)
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x01000000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1019)
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x02000000))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x101A)
                        }
                    }

                    Method (_Q26, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (VIGD)
                        {
                            If (\WVIS)
                            {
                                \VBTD ()
                            }

                            \_SB.PCI0.LPC.EC.BRNS ()
                        }
                        Else
                        {
                            \UCMS (0x12)
                        }

                        If (\_SB.PCI0.PEG.VID.ISOP ())
                        {
                            Notify (\_SB.PCI0.PEG.VID, 0xDF) // Hardware-Specific
                        }

                        Sleep (0x01F4)
                        Notify (AC, 0x80) // Status Change
                        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
                        If (\WXPF)
                        {
                            Acquire (MCPU, 0xFFFF)
                        }

                        PWRS = 0x01
                        If ((\PPMF & 0x01))
                        {
                            If (\OSPX)
                            {
                                \PNTF (0x80)
                            }
                        }

                        If (\WXPF)
                        {
                            Sleep (0x64)
                        }

                        If (\OSC4)
                        {
                            \PNTF (0x81)
                        }

                        If (\WXPF)
                        {
                            Release (MCPU)
                        }

                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6040)
                        ATMC ()
                    }

                    Method (_Q27, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (VIGD)
                        {
                            If (\WVIS)
                            {
                                \VBTD ()
                            }

                            \_SB.PCI0.LPC.EC.BRNS ()
                        }
                        Else
                        {
                            \UCMS (0x12)
                        }

                        If (\_SB.PCI0.PEG.VID.ISOP ())
                        {
                            Notify (\_SB.PCI0.PEG.VID, 0xDF) // Hardware-Specific
                        }

                        Sleep (0x01F4)
                        Notify (AC, 0x80) // Status Change
                        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
                        If (\WXPF)
                        {
                            Acquire (MCPU, 0xFFFF)
                        }

                        PWRS = 0x00
                        If ((\PPMF & 0x01))
                        {
                            If (\OSPX)
                            {
                                \PNTF (0x80)
                            }
                        }

                        If (\WXPF)
                        {
                            Sleep (0x64)
                        }

                        If (\OSC4)
                        {
                            \PNTF (0x81)
                        }

                        If (\WXPF)
                        {
                            Release (MCPU)
                        }

                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6040)
                        ATMC ()
                    }

                    Method (_Q2A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \VCMS (0x01, \_SB.LID._LID ())
                        If ((\ILNF == 0x00))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x5002)
                            If ((\PLUX == 0x00))
                            {
                                If (VIGD)
                                {
                                    \_SB.PCI0.VID.GLIS (0x01)
                                    \_SB.PCI0.VID.VLOC (0x01)
                                }
                                Else
                                {
                                    \_SB.PCI0.PEG.VID.VLOC (0x01)
                                }

                                Notify (\_SB.LID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \UCMS (0x0D)
                        \VCMS (0x01, \_SB.LID._LID ())
                        If ((\ILNF == 0x00))
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x5001)
                            If ((\PLUX == 0x00))
                            {
                                If (VIGD)
                                {
                                    \_SB.PCI0.VID.GLIS (0x00)
                                }
                                Else
                                {
                                    \_SB.PCI0.PEG.VID.VLOC (0x00)
                                }

                                Notify (\_SB.LID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (_Q3D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q48, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((\PPMF & 0x01))
                        {
                            If (\OSPX)
                            {
                                \PNTF (0x80)
                            }
                            Else
                            {
                                \STEP (0x04)
                            }

                            \_SB.PCI0.LPC.EC.CALM = 0x01
                        }
                    }

                    Method (_Q49, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((\PPMF & 0x01))
                        {
                            If (\OSPX)
                            {
                                \PNTF (0x80)
                            }
                            Else
                            {
                                \STEP (0x05)
                            }
                        }
                    }

                    Method (_Q7F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Fatal (0x01, 0x80010000, 0x02AB)
                    }

                    Method (_Q4E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6011)
                    }

                    Method (_Q4F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6012)
                    }

                    Method (_Q46, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6012)
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CLPM ()
                        If (HB0A)
                        {
                            Notify (BAT0, 0x80) // Status Change
                        }

                        If (HB1A)
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q4A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CLPM ()
                        Notify (BAT0, 0x81) // Information Change
                    }

                    Method (_Q4B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q4C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CLPM ()
                        If (HB1A)
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x4010)
                        }
                        Else
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x4011)
                            If (^BAT1.XB1S)
                            {
                                Notify (\_SB.PCI0.LPC.EC.BAT1, 0x03) // Eject Request
                            }
                        }
                    }

                    Method (_Q4D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((^BAT1.SBLI == 0x01))
                        {
                            Sleep (0x0A)
                            If ((HB1A && (SLUL == 0x00)))
                            {
                                ^BAT1.XB1S = 0x01
                                Notify (\_SB.PCI0.LPC.EC.BAT1, 0x01) // Device Check
                            }
                        }
                        ElseIf ((SLUL == 0x01))
                        {
                            ^BAT1.XB1S = 0x00
                            Notify (\_SB.PCI0.LPC.EC.BAT1, 0x03) // Eject Request
                        }

                        If ((^BAT1.B1ST & ^BAT1.XB1S))
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CLPM ()
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If ((^BAT1.B1ST & ^BAT1.XB1S))
                        {
                            CLPM ()
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (BATW, 1, NotSerialized)
                    {
                        Local0 = \_SB.PCI0.LPC.EC.BAT1.XB1S
                        If ((HB1A && !SLUL))
                        {
                            Local1 = 0x01
                        }
                        Else
                        {
                            Local1 = 0x00
                        }

                        If ((Local0 ^ Local1))
                        {
                            \_SB.PCI0.LPC.EC.BAT1.XB1S = Local1
                            Notify (\_SB.PCI0.LPC.EC.BAT1, 0x01) // Device Check
                        }
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBRC,   16, 
                        SBFC,   16, 
                        SBAE,   16, 
                        SBRS,   16, 
                        SBAC,   16, 
                        SBVO,   16, 
                        SBAF,   16, 
                        SBBS,   16
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBBM,   16, 
                        SBMD,   16, 
                        SBCC,   16
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBDC,   16, 
                        SBDV,   16, 
                        SBOM,   16, 
                        SBSI,   16, 
                        SBDT,   16, 
                        SBSN,   16
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBCH,   32
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBMN,   128
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBDN,   128
                    }

                    Mutex (BATM, 0x07)
                    Method (GBIF, 3, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (Arg2)
                        {
                            HIID = (Arg0 | 0x01)
                            Local7 = SBBM /* \_SB_.PCI0.LPC_.EC__.SBBM */
                            Local7 >>= 0x0F
                            Arg1 [0x00] = (Local7 ^ 0x01)
                            HIID = Arg0
                            If (Local7)
                            {
                                Local1 = (SBFC * 0x0A)
                            }
                            Else
                            {
                                Local1 = SBFC /* \_SB_.PCI0.LPC_.EC__.SBFC */
                            }

                            Arg1 [0x02] = Local1
                            HIID = (Arg0 | 0x02)
                            If (Local7)
                            {
                                Local0 = (SBDC * 0x0A)
                            }
                            Else
                            {
                                Local0 = SBDC /* \_SB_.PCI0.LPC_.EC__.SBDC */
                            }

                            Arg1 [0x01] = Local0
                            Divide (Local1, 0x14, Local2, Arg1 [0x05])
                            If (Local7)
                            {
                                Arg1 [0x06] = 0xC8
                            }
                            ElseIf (SBDV)
                            {
                                Divide (0x00030D40, SBDV, Local2, Arg1 [0x06])
                            }
                            Else
                            {
                                Arg1 [0x06] = 0x00
                            }

                            Arg1 [0x04] = SBDV /* \_SB_.PCI0.LPC_.EC__.SBDV */
                            Local0 = SBSN /* \_SB_.PCI0.LPC_.EC__.SBSN */
                            Name (SERN, Buffer (0x06)
                            {
                                "     "
                            })
                            Local2 = 0x04
                            While (Local0)
                            {
                                Divide (Local0, 0x0A, Local1, Local0)
                                SERN [Local2] = (Local1 + 0x30)
                                Local2--
                            }

                            Arg1 [0x0A] = SERN /* \_SB_.PCI0.LPC_.EC__.GBIF.SERN */
                            HIID = (Arg0 | 0x06)
                            Arg1 [0x09] = SBDN /* \_SB_.PCI0.LPC_.EC__.SBDN */
                            HIID = (Arg0 | 0x04)
                            Name (BTYP, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00                     // .....
                            })
                            BTYP = SBCH /* \_SB_.PCI0.LPC_.EC__.SBCH */
                            Arg1 [0x0B] = BTYP /* \_SB_.PCI0.LPC_.EC__.GBIF.BTYP */
                            HIID = (Arg0 | 0x05)
                            Arg1 [0x0C] = SBMN /* \_SB_.PCI0.LPC_.EC__.SBMN */
                        }
                        Else
                        {
                            Arg1 [0x01] = 0xFFFFFFFF
                            Arg1 [0x05] = 0x00
                            Arg1 [0x06] = 0x00
                            Arg1 [0x02] = 0xFFFFFFFF
                        }

                        Release (BATM)
                        Return (Arg1)
                    }

                    Method (GBST, 4, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If ((Arg1 & 0x20))
                        {
                            Local0 = 0x02
                        }
                        ElseIf ((Arg1 & 0x40))
                        {
                            Local0 = 0x01
                        }
                        Else
                        {
                            Local0 = 0x00
                        }

                        If ((Arg1 & 0x07)){}
                        Else
                        {
                            Local0 |= 0x04
                        }

                        If (((Arg1 & 0x07) == 0x07))
                        {
                            Local0 = 0x04
                            Local1 = 0x00
                            Local2 = 0x00
                            Local3 = 0x00
                        }
                        Else
                        {
                            HIID = Arg0
                            Local3 = SBVO /* \_SB_.PCI0.LPC_.EC__.SBVO */
                            If (Arg2)
                            {
                                Local2 = (SBRC * 0x0A)
                            }
                            Else
                            {
                                Local2 = SBRC /* \_SB_.PCI0.LPC_.EC__.SBRC */
                            }

                            Local1 = SBAC /* \_SB_.PCI0.LPC_.EC__.SBAC */
                            If ((Local1 >= 0x8000))
                            {
                                If ((Local0 & 0x01))
                                {
                                    Local1 = (0x00010000 - Local1)
                                }
                                Else
                                {
                                    Local1 = 0x00
                                }
                            }
                            ElseIf (!(Local0 & 0x02))
                            {
                                Local1 = 0x00
                            }

                            If (Arg2)
                            {
                                Local1 *= Local3
                                Divide (Local1, 0x03E8, Local7, Local1)
                            }
                        }

                        Arg3 [0x00] = Local0
                        Arg3 [0x01] = Local1
                        Arg3 [0x02] = Local2
                        Arg3 [0x03] = Local3
                        Release (BATM)
                        Return (Arg3)
                    }

                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
                        Name (_UID, 0x00)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            \_SB
                        })
                        Name (B0ST, 0x00)
                        Name (BT0I, Package (0x0D)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0x2A30, 
                            0x00, 
                            0x00, 
                            0x01, 
                            0x01, 
                            "", 
                            "", 
                            "", 
                            ""
                        })
                        Name (BT0P, Package (0x04){})
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (\H8DR)
                            {
                                B0ST = HB0A /* \_SB_.PCI0.LPC_.EC__.HB0A */
                            }
                            ElseIf ((\RBEC (0x38) & 0x80))
                            {
                                B0ST = 0x01
                            }
                            Else
                            {
                                B0ST = 0x00
                            }

                            If (B0ST)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            Local7 = 0x00
                            Local6 = 0x0A
                            While ((!Local7 && Local6))
                            {
                                If (HB0A)
                                {
                                    If (((HB0S & 0x07) == 0x07))
                                    {
                                        Sleep (0x03E8)
                                        Local6--
                                    }
                                    Else
                                    {
                                        Local7 = 0x01
                                    }
                                }
                                Else
                                {
                                    Local6 = 0x00
                                }
                            }

                            Return (GBIF (0x00, BT0I, Local7))
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            Local0 = (DerefOf (BT0I [0x00]) ^ 0x01)
                            Return (GBST (0x00, HB0S, Local0, BT0P))
                        }

                        Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
                        {
                            HAM4 &= 0xEF
                            If (Arg0)
                            {
                                Local1 = Arg0
                                If (!DerefOf (BT0I [0x00]))
                                {
                                    Divide (Local1, 0x0A, Local0, Local1)
                                }

                                HT0L = (Local1 & 0xFF)
                                HT0H = ((Local1 >> 0x08) & 0xFF)
                                HAM4 |= 0x10
                            }
                        }
                    }

                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
                        Name (_UID, 0x01)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            \_SB
                        })
                        Name (B1ST, 0x00)
                        Name (SBLI, 0x01)
                        Name (XB1S, 0x00)
                        Name (BT1I, Package (0x0D)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0x2A30, 
                            0x00, 
                            0x00, 
                            0x01, 
                            0x01, 
                            "", 
                            "", 
                            "", 
                            ""
                        })
                        Name (BT1P, Package (0x04){})
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (\H8DR)
                            {
                                If (HB1A)
                                {
                                    B1ST = 0x01
                                    If (SLUL)
                                    {
                                        SBLI = 0x01
                                        XB1S = 0x00
                                    }
                                    Else
                                    {
                                        SBLI = 0x00
                                        XB1S = 0x01
                                    }
                                }
                                Else
                                {
                                    B1ST = 0x00
                                    SBLI = 0x01
                                    XB1S = 0x00
                                }
                            }
                            ElseIf ((\RBEC (0x39) & 0x80))
                            {
                                B1ST = 0x01
                                If ((\RBEC (0x49) & 0x01))
                                {
                                    SBLI = 0x01
                                    XB1S = 0x00
                                }
                                Else
                                {
                                    SBLI = 0x00
                                    XB1S = 0x01
                                }
                            }
                            Else
                            {
                                B1ST = 0x00
                                SBLI = 0x01
                                XB1S = 0x00
                            }

                            If (B1ST)
                            {
                                If (XB1S)
                                {
                                    Return (0x1F)
                                }
                                ElseIf (\WNTF)
                                {
                                    Return (0x00)
                                }
                                Else
                                {
                                    Return (0x1F)
                                }
                            }
                            ElseIf (\WNTF)
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            Local7 = 0x00
                            Local6 = 0x0A
                            While ((!Local7 && Local6))
                            {
                                If (HB1A)
                                {
                                    If (((HB1S & 0x07) == 0x07))
                                    {
                                        Sleep (0x03E8)
                                        Local6--
                                    }
                                    Else
                                    {
                                        Local7 = 0x01
                                    }
                                }
                                Else
                                {
                                    Local6 = 0x00
                                }
                            }

                            Return (GBIF (0x10, BT1I, Local7))
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            Local0 = (DerefOf (BT1I [0x00]) ^ 0x01)
                            Return (GBST (0x10, HB1S, Local0, BT1P))
                        }

                        Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
                        {
                            HAM4 &= 0xDF
                            If (Arg0)
                            {
                                Local1 = Arg0
                                If (!DerefOf (BT1I [0x00]))
                                {
                                    Divide (Local1, 0x0A, Local0, Local1)
                                }

                                HT1L = (Local1 & 0xFF)
                                HT1H = ((Local1 >> 0x08) & 0xFF)
                                HAM4 |= 0x20
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                        {
                            If (Arg0)
                            {
                                B1ST = 0x00
                                SBLI = 0x01
                                XB1S = 0x00
                            }
                        }
                    }

                    Device (AC)
                    {
                        Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
                        Name (_UID, 0x00)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            \_SB
                        })
                        Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                        {
                            If (\H8DR)
                            {
                                If (HPAC)
                                {
                                    If ((HWAT < MIAC))
                                    {
                                        Return (0x00)
                                    }
                                    ElseIf (DOCD)
                                    {
                                        If (\_SB.PCI0.LPC.EPWG)
                                        {
                                            Return (0x01)
                                        }
                                        Else
                                        {
                                            Return (0x00)
                                        }
                                    }
                                    Else
                                    {
                                        Return (0x01)
                                    }
                                }
                                Else
                                {
                                    Return (0x00)
                                }
                            }
                            ElseIf ((\RBEC (0x46) & 0x10))
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }
                    }

                    Device (WGSH)
                    {
                        Name (_HID, EisaId ("LEN0078"))  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (\WIN8)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (WLSW, 0, NotSerialized)
                        {
                            Return (\_SB.PCI0.LPC.EC.GSTS)
                        }
                    }

                    Device (HKEY)
                    {
                        Name (_HID, EisaId ("LEN0068"))  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (MHKV, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Name (DHKC, 0x00)
                        Name (DHKB, 0x01)
                        Mutex (XDHK, 0x07)
                        Name (DHKH, 0x00)
                        Name (DHKW, 0x00)
                        Name (DHKS, 0x00)
                        Name (DHKD, 0x00)
                        Name (DHKN, 0x0808)
                        Name (DHKT, 0x00)
                        Name (DHWW, 0x00)
                        Method (MHKA, 0, NotSerialized)
                        {
                            Return (0x07FFFFFB)
                        }

                        Method (MHKN, 0, NotSerialized)
                        {
                            Return (DHKN) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKN */
                        }

                        Method (MHKK, 1, NotSerialized)
                        {
                            If (DHKC)
                            {
                                Return ((DHKN & Arg0))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (MHKM, 2, NotSerialized)
                        {
                            Acquire (XDHK, 0xFFFF)
                            If ((Arg0 > 0x20))
                            {
                                Noop
                            }
                            Else
                            {
                                Local0 = (One << Arg0--)
                                If ((Local0 & 0x07FFFFFB))
                                {
                                    If (Arg1)
                                    {
                                        DHKN |= Local0 /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKN */
                                    }
                                    Else
                                    {
                                        DHKN &= (Local0 ^ 0xFFFFFFFF)
                                    }
                                }
                                Else
                                {
                                    Noop
                                }
                            }

                            Release (XDHK)
                        }

                        Method (MHKS, 0, NotSerialized)
                        {
                            Notify (\_SB.SLPB, 0x80) // Status Change
                        }

                        Method (MHKC, 1, NotSerialized)
                        {
                            DHKC = Arg0
                        }

                        Method (MHKP, 0, NotSerialized)
                        {
                            Acquire (XDHK, 0xFFFF)
                            If (DHWW)
                            {
                                Local1 = DHWW /* \_SB_.PCI0.LPC_.EC__.HKEY.DHWW */
                                DHWW = Zero
                            }
                            ElseIf (DHKW)
                            {
                                Local1 = DHKW /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKW */
                                DHKW = Zero
                            }
                            ElseIf (DHKD)
                            {
                                Local1 = DHKD /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKD */
                                DHKD = Zero
                            }
                            ElseIf (DHKS)
                            {
                                Local1 = DHKS /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKS */
                                DHKS = Zero
                            }
                            ElseIf (DHKT)
                            {
                                Local1 = DHKT /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKT */
                                DHKT = Zero
                            }
                            Else
                            {
                                Local1 = DHKH /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKH */
                                DHKH = Zero
                            }

                            Release (XDHK)
                            Return (Local1)
                        }

                        Method (MHKE, 1, NotSerialized)
                        {
                            DHKB = Arg0
                            Acquire (XDHK, 0xFFFF)
                            DHKH = Zero
                            DHKW = Zero
                            DHKS = Zero
                            DHKD = Zero
                            DHKT = Zero
                            DHWW = Zero
                            Release (XDHK)
                        }

                        Method (MHKQ, 1, NotSerialized)
                        {
                            If (DHKB)
                            {
                                If (DHKC)
                                {
                                    Acquire (XDHK, 0xFFFF)
                                    If ((Arg0 < 0x1000)){}
                                    ElseIf ((Arg0 < 0x2000))
                                    {
                                        DHKH = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x3000))
                                    {
                                        DHKW = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x4000))
                                    {
                                        DHKS = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x5000))
                                    {
                                        DHKD = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x6000))
                                    {
                                        DHKH = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x7000))
                                    {
                                        DHKT = Arg0
                                    }
                                    ElseIf ((Arg0 < 0x8000))
                                    {
                                        DHWW = Arg0
                                    }
                                    Else
                                    {
                                    }

                                    Release (XDHK)
                                    Notify (HKEY, 0x80) // Status Change
                                }
                                ElseIf ((Arg0 == 0x1004))
                                {
                                    Notify (\_SB.SLPB, 0x80) // Status Change
                                }
                            }
                        }

                        Method (MHKB, 1, NotSerialized)
                        {
                            If ((Arg0 == 0x00))
                            {
                                \_SB.PCI0.LPC.EC.BEEP (0x11)
                                \LIDB = 0x00
                            }
                            ElseIf ((Arg0 == 0x01))
                            {
                                \_SB.PCI0.LPC.EC.BEEP (0x10)
                                \LIDB = 0x01
                            }
                            Else
                            {
                            }
                        }

                        Method (MHKD, 0, NotSerialized)
                        {
                            If ((\PLUX == 0x00))
                            {
                                If (VIGD)
                                {
                                    \_SB.PCI0.VID.VLOC (0x00)
                                }
                                Else
                                {
                                    \_SB.PCI0.PEG.VID.VLOC (0x00)
                                }
                            }
                        }

                        Method (MHQC, 1, NotSerialized)
                        {
                            If (\WNTF)
                            {
                                If ((Arg0 == 0x00))
                                {
                                    Return (\CWAC)
                                }
                                ElseIf ((Arg0 == 0x01))
                                {
                                    Return (\CWAP)
                                }
                                ElseIf ((Arg0 == 0x02))
                                {
                                    Return (\CWAT)
                                }
                                Else
                                {
                                    Noop
                                }
                            }
                            Else
                            {
                                Noop
                            }

                            Return (0x00)
                        }

                        Method (MHGC, 0, NotSerialized)
                        {
                            If (\WNTF)
                            {
                                Acquire (XDHK, 0xFFFF)
                                If (CKC4 (0x00))
                                {
                                    Local0 = 0x03
                                }
                                Else
                                {
                                    Local0 = 0x04
                                }

                                Release (XDHK)
                                Return (Local0)
                            }
                            Else
                            {
                                Noop
                            }

                            Return (0x00)
                        }

                        Method (MHSC, 1, NotSerialized)
                        {
                            If ((\CWAC && \WNTF))
                            {
                                Acquire (XDHK, 0xFFFF)
                                If (\OSC4)
                                {
                                    If ((Arg0 == 0x03))
                                    {
                                        If (!\CWAS)
                                        {
                                            \PNTF (0x81)
                                            \CWAS = 0x01
                                        }
                                    }
                                    ElseIf ((Arg0 == 0x04))
                                    {
                                        If (\CWAS)
                                        {
                                            \PNTF (0x81)
                                            \CWAS = 0x00
                                        }
                                    }
                                    Else
                                    {
                                        Noop
                                    }
                                }

                                Release (XDHK)
                            }
                            Else
                            {
                                Noop
                            }
                        }

                        Method (CKC4, 1, NotSerialized)
                        {
                            Local0 = 0x00
                            If (\C4WR)
                            {
                                If (!\C4AC)
                                {
                                    Local0 |= 0x01
                                }
                            }

                            If (\C4NA)
                            {
                                Local0 |= 0x02
                            }

                            If ((\CWAC && \CWAS))
                            {
                                Local0 |= 0x04
                            }

                            If ((\CWUE && \CWUS))
                            {
                                Local0 |= 0x08
                            }

                            Local0 &= ~Arg0
                            Return (Local0)
                        }

                        Method (MHQE, 0, NotSerialized)
                        {
                            Return (\C4WR)
                        }

                        Method (MHGE, 0, NotSerialized)
                        {
                            If ((\C4WR && \C4AC))
                            {
                                Return (0x04)
                            }

                            Return (0x03)
                        }

                        Method (MHSE, 1, NotSerialized)
                        {
                            If (\C4WR)
                            {
                                Local0 = \C4AC
                                If ((Arg0 == 0x03))
                                {
                                    \C4AC = 0x00
                                    If ((Local0 ^ \C4AC))
                                    {
                                        If (\OSC4)
                                        {
                                            \PNTF (0x81)
                                        }
                                    }
                                }
                                ElseIf ((Arg0 == 0x04))
                                {
                                    \C4AC = 0x01
                                    If ((Local0 ^ \C4AC))
                                    {
                                        If (\OSC4)
                                        {
                                            \PNTF (0x81)
                                        }
                                    }
                                }
                            }
                        }

                        Method (UAWO, 1, NotSerialized)
                        {
                            Return (\UAWS (Arg0))
                        }

                        Method (MLCG, 1, NotSerialized)
                        {
                            Local0 = \KBLS (0x00, 0x00)
                            Return (Local0)
                        }

                        Method (MLCS, 1, NotSerialized)
                        {
                            Local0 = \KBLS (0x01, Arg0)
                            If (!(Local0 & 0x80000000))
                            {
                                If ((Arg0 & 0x00010000))
                                {
                                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6001)
                                }
                                ElseIf (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00020000))
                                {
                                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1012)
                                }
                            }

                            Return (Local0)
                        }

                        Method (DSSG, 1, NotSerialized)
                        {
                            Local0 = (0x0400 | \PDCI)
                            Return (Local0)
                        }

                        Method (DSSS, 1, NotSerialized)
                        {
                            \PDCI |= Arg0
                        }

                        Method (SBSG, 1, NotSerialized)
                        {
                            Return (\SYBC (0x00, 0x00))
                        }

                        Method (SBSS, 1, NotSerialized)
                        {
                            Return (\SYBC (0x01, Arg0))
                        }

                        Method (PBLG, 1, NotSerialized)
                        {
                            Local0 = \BRLV
                            Local1 = (Local0 | 0x0F00)
                            Return (Local1)
                        }

                        Method (PBLS, 1, NotSerialized)
                        {
                            \BRLV = Arg0
                            If (\VIGD)
                            {
                                \_SB.PCI0.LPC.EC.BRNS ()
                            }
                            Else
                            {
                                \VBRC (\BRLV)
                            }

                            If (!\NBCF)
                            {
                                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6050)
                            }

                            Return (0x00)
                        }

                        Method (PMSG, 1, NotSerialized)
                        {
                            Local0 = \PRSM (0x00, 0x00)
                            If (!\APIN)
                            {
                                If ((Local0 & 0x10))
                                {
                                    \APMD = 0x01
                                }
                                Else
                                {
                                    \APMD = 0x00
                                }

                                If (\OSPX)
                                {
                                    \PNTF (0x80)
                                }

                                \APIN = 0x01
                            }

                            Return (Local0)
                        }

                        Method (PMSS, 1, NotSerialized)
                        {
                            \PRSM (0x01, Arg0)
                            If (((!\APMD && (Arg0 & 0x10)) || (\APMD && !
                                (Arg0 & 0x10))))
                            {
                                If ((Arg0 & 0x10))
                                {
                                    \APMD = 0x01
                                }
                                Else
                                {
                                    \APMD = 0x00
                                }

                                If (\OSPX)
                                {
                                    \PNTF (0x80)
                                }
                            }

                            Return (0x00)
                        }

                        Method (ISSG, 1, NotSerialized)
                        {
                            Local0 = \ISSP
                            Local0 |= 0x80
                            Local0 |= (\ISCG & 0x30)
                            Return (Local0)
                        }

                        Method (ISSS, 1, NotSerialized)
                        {
                            \ISCG = Arg0
                            Return (0x00)
                        }

                        Method (FFSG, 1, NotSerialized)
                        {
                            Return (\IFRS (0x00, 0x00))
                        }

                        Method (FFSS, 1, NotSerialized)
                        {
                            \IFRS (0x01, Arg0)
                            Return (0x00)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC.HKEY)
                    {
                        Name (INDV, 0x00)
                        Method (MHQI, 0, NotSerialized)
                        {
                            If ((\IPMS & 0x01))
                            {
                                INDV |= 0x01
                            }

                            If ((\IPMS & 0x02))
                            {
                                INDV |= 0x02
                            }

                            If ((\IPMS & 0x04))
                            {
                                INDV |= 0x0100
                            }

                            If ((\IPMS & 0x08))
                            {
                                INDV |= 0x0200
                            }

                            If ((\IPMS & 0x10))
                            {
                                INDV |= 0x04
                            }

                            Return (INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                        }

                        Method (MHGI, 1, NotSerialized)
                        {
                            Name (RETB, Buffer (0x10){})
                            CreateByteField (RETB, 0x00, MHGS)
                            Local0 = (0x01 << Arg0)
                            If ((INDV & Local0))
                            {
                                If ((Arg0 == 0x00))
                                {
                                    CreateField (RETB, 0x08, 0x78, BRBU)
                                    BRBU = \IPMB
                                    MHGS = 0x10
                                }
                                ElseIf ((Arg0 == 0x01))
                                {
                                    CreateField (RETB, 0x08, 0x18, RRBU)
                                    RRBU = \IPMR
                                    MHGS = 0x04
                                }
                                ElseIf ((Arg0 == 0x08))
                                {
                                    CreateField (RETB, 0x10, 0x18, ODBU)
                                    CreateByteField (RETB, 0x01, MHGZ)
                                    ODBU = \IPMO
                                    If ((^^BDEV == 0x03))
                                    {
                                        If (\H8DR)
                                        {
                                            Local1 = ^^HPBU /* \_SB_.PCI0.LPC_.EC__.HPBU */
                                        }
                                        Else
                                        {
                                            Local1 = (\RBEC (0x47) & 0x01)
                                        }

                                        If (!Local1)
                                        {
                                            MHGZ |= 0x04 /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                        }

                                        If ((^^BSTS == 0x00))
                                        {
                                            MHGZ |= 0x01 /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                            MHGZ |= 0x02 /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                        }
                                    }

                                    MHGS = 0x05
                                }
                                ElseIf ((Arg0 == 0x09))
                                {
                                    CreateField (RETB, 0x10, 0x08, AUBU)
                                    AUBU = \IPMA
                                    RETB [0x01] = 0x01
                                    MHGS = 0x03
                                }
                                ElseIf ((Arg0 == 0x02))
                                {
                                    Local1 = \VDYN (0x00, 0x00)
                                    RETB [0x02] = (Local1 & 0x0F)
                                    Local1 >>= 0x04
                                    RETB [0x01] = (Local1 & 0x0F)
                                    MHGS = 0x03
                                }
                            }

                            Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.RETB */
                        }

                        Method (MHSI, 2, NotSerialized)
                        {
                            Local0 = (0x01 << Arg0)
                            If ((INDV & Local0))
                            {
                                If ((Arg0 == 0x08))
                                {
                                    If (Arg1)
                                    {
                                        If (\H8DR)
                                        {
                                            Local1 = ^^HPBU /* \_SB_.PCI0.LPC_.EC__.HPBU */
                                        }
                                        Else
                                        {
                                            Local1 = (\RBEC (0x47) & 0x01)
                                        }

                                        If (!Local1)
                                        {
                                            ^^BDEV = ^^BGID (0x00)
                                            ^^NBIN (Local1)
                                        }
                                    }
                                }
                                ElseIf ((Arg0 == 0x02))
                                {
                                    \VDYN (0x01, Arg1)
                                }
                            }
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (HDMC)
                            {
                                Noop
                            }
                            ElseIf (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x04000000))
                            {
                                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x101B)
                            }
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC.HKEY)
                    {
                        Method (MMTG, 0, NotSerialized)
                        {
                            Local0 = 0x0101
                            If (HDMC)
                            {
                                Local0 |= 0x00010000
                            }

                            Return (Local0)
                        }

                        Method (MMTS, 1, NotSerialized)
                        {
                            If (HDMC)
                            {
                                Noop
                            }
                            ElseIf ((Arg0 == 0x02))
                            {
                                \_SB.PCI0.LPC.EC.LED (0x0E, 0x80)
                            }
                            ElseIf ((Arg0 == 0x03))
                            {
                                \_SB.PCI0.LPC.EC.LED (0x0E, 0xC0)
                            }
                            Else
                            {
                                \_SB.PCI0.LPC.EC.LED (0x0E, 0x00)
                            }
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC.HKEY)
                    {
                        Method (PWMC, 0, NotSerialized)
                        {
                            Return (0x01)
                        }

                        Method (PWMG, 0, NotSerialized)
                        {
                            Local0 = \_SB.PCI0.LPC.EC.PWMH
                            Local0 <<= 0x08
                            Local0 |= \_SB.PCI0.LPC.EC.PWML
                            Return (Local0)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q45, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            If (DOCD)
                            {
                                Sleep (0x64)
                                If (\_SB.PCI0.LPC.EPWG)
                                {
                                    Noop
                                }
                                ElseIf (HPAC)
                                {
                                    _Q27 ()
                                }

                                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x4010)
                            }
                            Else
                            {
                                Sleep (0x64)
                                If (HPAC)
                                {
                                    _Q26 ()
                                }

                                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x4011)
                            }
                        }

                        Method (DKID, 0, NotSerialized)
                        {
                            Local0 = \_SB.PCI0.LPC.DOI0
                            Local1 = \_SB.PCI0.LPC.DOI1
                            Local2 = \_SB.PCI0.LPC.DOI2
                            Local0 |= (Local1 << 0x01)
                            Local0 |= (Local2 << 0x02)
                            Return (Local0)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC.HKEY)
                    {
                        Method (GDKS, 0, NotSerialized)
                        {
                            Local0 = 0x00
                            If ((\_SB.PCI0.LPC.EC.DOCD == 0x01))
                            {
                                Local0 |= 0x01
                                Local1 = \_SB.PCI0.LPC.EC.DKID ()
                                Local1 <<= 0x08
                                Local0 |= Local1
                            }

                            If ((\_SB.PCI0.LPC.EC.HB1A == 0x01))
                            {
                                If ((\_SB.PCI0.LPC.EC.SLUL == 0x01))
                                {
                                    Local0 |= 0x04
                                }
                            }

                            Return (Local0)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q3F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                        {
                            \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6000)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC.HKEY)
                    {
                        Method (NUMG, 0, NotSerialized)
                        {
                            Local0 = 0x00
                            Return (Local0)
                        }
                    }
                }
            }

            Device (PEG)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                Name (LART, Package (0x02)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.LNKB, 
                        0x00
                    }
                })
                Name (AART, Package (0x02)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (AART) /* \_SB_.PCI0.PEG_.AART */
                    }
                    Else
                    {
                        Return (LART) /* \_SB_.PCI0.PEG_.LART */
                    }
                }

                Mutex (MDGS, 0x07)
                Name (VDEE, 0x01)
                Name (VDDA, Buffer (0x04){})
                CreateBitField (VDDA, 0x00, VUPC)
                CreateBitField (VDDA, 0x01, VQDL)
                CreateBitField (VDDA, 0x02, VQDC)
                CreateBitField (VDDA, 0x03, VQD0)
                CreateBitField (VDDA, 0x04, VQD1)
                CreateBitField (VDDA, 0x05, VQD2)
                CreateBitField (VDDA, 0x06, VQD3)
                CreateBitField (VDDA, 0x07, VQD4)
                CreateBitField (VDDA, 0x08, VQD5)
                CreateBitField (VDDA, 0x09, VSDL)
                CreateBitField (VDDA, 0x0A, VSDC)
                CreateBitField (VDDA, 0x0B, VSD0)
                CreateBitField (VDDA, 0x0C, VSD1)
                CreateBitField (VDDA, 0x0D, VSD2)
                CreateBitField (VDDA, 0x0E, VSD3)
                CreateBitField (VDDA, 0x0F, VSD4)
                CreateBitField (VDDA, 0x10, VSD5)
                CreateBitField (VDDA, 0x11, MSWT)
                CreateBitField (VDDA, 0x12, VWST)
                Device (VID)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (VPCG, PCI_Config, 0x00, 0x0100)
                    Field (VPCG, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x2C), 
                        VSID,   32, 
                        Offset (0x40), 
                        VIDS,   32, 
                        Offset (0x70), 
                        VPWR,   8
                    }

                    OperationRegion (GPPB, PCI_Config, 0xB4, 0x14)
                    Field (GPPB, ByteAcc, NoLock, Preserve)
                    {
                        PBCI,   8, 
                        PBNP,   8, 
                        PBLS,   8, 
                        PBCC,   8, 
                        PBCR,   32, 
                        PBDI,   32, 
                        PBDO,   32, 
                        PBMR,   32
                    }

                    Name (_S3D, 0x03)  // _S3D: S3 Device State
                    Name (DGOS, 0x00)
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        \VUPS (0x02)
                        VQDL = \VCDL
                        VQDC = \VCDC
                        VQD0 = \VCDT
                        VQD1 = \VCDD
                        If (ISOP ())
                        {
                            \VHYB (0x04, 0x01)
                            HPDE (0x01)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        If (ISOP ())
                        {
                            If (DGOS)
                            {
                                \TDNV = 0x01
                                If ((\PPMF & 0x01))
                                {
                                    If (\OSPX)
                                    {
                                        \PNTF (0x80)
                                    }
                                }

                                \APMF = 0x01
                                If (\APMD)
                                {
                                    If ((\PPMF & 0x01))
                                    {
                                        If (\OSPX)
                                        {
                                            \PNTF (0x80)
                                        }
                                    }
                                }

                                \VHYB (0x02, 0x00)
                                Sleep (0x64)
                                \VHYB (0x00, 0x01)
                                Sleep (0x0A)
                                \VHYB (0x0A, 0x01)
                                Sleep (0x64)
                                \VHYB (0x02, 0x01)
                                Sleep (0x01)
                                \VHYB (0x08, 0x01)
                                Local0 = 0x0A
                                Local1 = 0x32
                                While (Local1)
                                {
                                    Sleep (Local0)
                                    If (\LCHK (0x01))
                                    {
                                        Break
                                    }

                                    Local1--
                                }

                                \VHYB (0x0A, 0x00)
                                \VHYB (0x04, 0x00)
                                \SWTT (0x01)
                                DGOS = Zero
                            }
                            ElseIf ((VSID != 0x21F517AA))
                            {
                                \VHYB (0x04, 0x00)
                            }

                            \VHYB (0x09, \_SB.PCI0.PEG.VID.HDAS)
                            HPDE (0x00)
                        }
                        Else
                        {
                            VIDS = 0x21F617AA
                        }
                    }

                    Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                    {
                        Noop
                    }

                    Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                    {
                        Noop
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        If (ISOP ())
                        {
                            If ((\_SB.PCI0.PEG.VID.OMPR == 0x03))
                            {
                                \SWTT (0x00)
                                \VHYB (0x08, 0x00)
                                Local0 = 0x0A
                                Local1 = 0x32
                                While (Local1)
                                {
                                    Sleep (Local0)
                                    If (\LCHK (0x00))
                                    {
                                        Break
                                    }

                                    Local1--
                                }

                                \VHYB (0x02, 0x00)
                                Sleep (0x64)
                                \VHYB (0x00, 0x00)
                                DGOS = One
                                \_SB.PCI0.PEG.VID.OMPR = 0x02
                                \TDNV = 0x00
                                If ((\PPMF & 0x01))
                                {
                                    If (\OSPX)
                                    {
                                        \PNTF (0x80)
                                    }
                                }

                                \APMF = 0x00
                                If (\APMD)
                                {
                                    If ((\PPMF & 0x01))
                                    {
                                        If (\OSPX)
                                        {
                                            \PNTF (0x80)
                                        }
                                    }
                                }

                                HPDE (0x01)
                            }
                        }
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (\CMPB (Arg0, ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0") /* Unknown UUID */))
                        {
                            Return (NVOP (Arg0, Arg1, Arg2, Arg3))
                        }

                        If (\CMPB (Arg0, ToUUID ("a3132d01-8cda-49ba-a52e-bc9d46df6b81") /* Unknown UUID */))
                        {
                            Return (NVPS (Arg0, Arg1, Arg2, Arg3))
                        }

                        If (\WIN8)
                        {
                            If (\CMPB (Arg0, ToUUID ("d4a50b75-65c7-46f7-bfb7-41514cea0244") /* Unknown UUID */))
                            {
                                Return (NBCI (Arg0, Arg1, Arg2, Arg3))
                            }
                        }

                        Return (Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x80                           // ....
                        })
                    }

                    Name (_IRC, 0x00)  // _IRC: Inrush Current
                    OperationRegion (ATRP, SystemMemory, \ATRB, 0x00010000)
                    Field (ATRP, AnyAcc, Lock, Preserve)
                    {
                        IDX0,   262144, 
                        IDX1,   262144
                    }

                    Method (_ROM, 2, Serialized)  // _ROM: Read-Only Memory
                    {
                        If ((Arg0 >= 0x8000))
                        {
                            Return (GETB ((Arg0 - 0x8000), Arg1, IDX1))
                        }

                        If (((Arg0 + Arg1) > 0x8000))
                        {
                            Local0 = (0x8000 - Arg0)
                            Local1 = (Arg1 - Local0)
                            Local3 = GETB (Arg0, Local0, IDX0)
                            Local4 = GETB (0x00, Local1, IDX1)
                            Concatenate (Local3, Local4, Local5)
                            Return (Local5)
                        }

                        Return (GETB (Arg0, Arg1, IDX0))
                    }

                    Method (GETB, 3, Serialized)
                    {
                        Local0 = (Arg0 * 0x08)
                        Local1 = (Arg1 * 0x08)
                        CreateField (Arg2, Local0, Local1, TBF3)
                        Return (TBF3) /* \_SB_.PCI0.PEG_.VID_.GETB.TBF3 */
                    }

                    Method (HPDE, 1, NotSerialized)
                    {
                        If ((Arg0 == 0x00))
                        {
                            \_SB.PCI0.LPC.XHPE = 0x00
                            \_SB.PCI0.LPC.GR06 = 0x00
                            \_SB.PCI0.LPC.XHPD = 0x00
                        }
                        Else
                        {
                            \_SB.PCI0.LPC.XHPE = 0x01
                            \_SB.PCI0.LPC.GR06 = 0x02
                            \_SB.PCI0.LPC.XHPD = 0x00
                        }
                    }

                    Method (VSWT, 0, NotSerialized)
                    {
                        If (\WVIS)
                        {
                            Local0 = \VEVT (0x07)
                        }
                        Else
                        {
                            Local0 = \VEVT (0x05)
                        }

                        Local1 = (0xFF & Local0)
                        If (Local1)
                        {
                            ASWT (Local1, 0x01)
                        }
                    }

                    Method (VLOC, 1, NotSerialized)
                    {
                        If ((Arg0 == \_SB.LID._LID ()))
                        {
                            \VSLD (Arg0)
                            If (((VPWR & 0x03) == 0x00))
                            {
                                If (Arg0)
                                {
                                    Local0 = \VEVT (0x01)
                                }
                                Else
                                {
                                    Local0 = \VEVT (0x02)
                                }

                                Local1 = (0x0F & Local0)
                                If (Local1)
                                {
                                    ASWT (Local1, 0x00)
                                }
                            }
                        }
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        If ((Arg0 == 0x02))
                        {
                            Local0 = 0x14
                            While (Local0)
                            {
                                Local0--
                                Acquire (MDGS, 0xFFFF)
                                If ((0x00 == MSWT))
                                {
                                    MSWT = 0x01
                                    Local0 = 0x00
                                    VDEE = Arg0
                                }

                                Release (MDGS)
                                Sleep (0xC8)
                            }
                        }
                        Else
                        {
                            Acquire (MDGS, 0xFFFF)
                            If ((VDEE == 0x02))
                            {
                                MSWT = 0x00
                            }

                            If ((Arg0 > 0x02))
                            {
                                VDEE = 0x01
                            }
                            Else
                            {
                                VDEE = Arg0
                            }

                            Release (MDGS)
                        }
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x08)
                        {
                            0x0100, 
                            0x0114, 
                            0x0111, 
                            0x0115, 
                            0x0112, 
                            0x0116, 
                            0x0113, 
                            0x0110
                        })
                    }

                    Method (ASWT, 2, NotSerialized)
                    {
                        If ((0x01 == VDEE))
                        {
                            Local1 = (0x01 & Arg1)
                            \VSDS (Arg0, Local1)
                        }
                        Else
                        {
                            Local0 = 0x14
                            While (Local0)
                            {
                                Local0--
                                Acquire (MDGS, 0xFFFF)
                                If ((0x00 == MSWT))
                                {
                                    Local0 = 0x00
                                    If ((0x01 & Arg1))
                                    {
                                        VUPC = 0x01
                                    }
                                    Else
                                    {
                                        VUPC = 0x00
                                    }

                                    If ((0x01 & Arg0))
                                    {
                                        VQDL = 0x01
                                    }
                                    Else
                                    {
                                        VQDL = 0x00
                                    }

                                    If ((0x02 & Arg0))
                                    {
                                        VQDC = 0x01
                                    }
                                    Else
                                    {
                                        VQDC = 0x00
                                    }

                                    If ((0x04 & Arg0))
                                    {
                                        VQD0 = 0x01
                                    }
                                    Else
                                    {
                                        VQD0 = 0x00
                                    }

                                    If ((0x08 & Arg0))
                                    {
                                        VQD1 = 0x01
                                    }
                                    Else
                                    {
                                        VQD1 = 0x00
                                    }

                                    If ((0x10 & Arg0))
                                    {
                                        VQD2 = 0x01
                                    }
                                    Else
                                    {
                                        VQD2 = 0x00
                                    }

                                    If ((0x20 & Arg0))
                                    {
                                        VQD3 = 0x01
                                    }
                                    Else
                                    {
                                        VQD3 = 0x00
                                    }

                                    If ((0x40 & Arg0))
                                    {
                                        VQD4 = 0x01
                                    }
                                    Else
                                    {
                                        VQD4 = 0x00
                                    }

                                    If ((0x80 & Arg0))
                                    {
                                        VQD5 = 0x01
                                    }
                                    Else
                                    {
                                        VQD5 = 0x00
                                    }
                                }

                                Release (MDGS)
                                Sleep (0xC8)
                            }

                            If ((0x02 & Arg1))
                            {
                                Notify (VID, 0x81) // Information Change
                            }
                            Else
                            {
                                Notify (VID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (VDSW, 1, NotSerialized)
                    {
                        If ((VPWR == 0x00))
                        {
                            If (Arg0)
                            {
                                Local0 = \VEVT (0x03)
                            }
                            Else
                            {
                                Local0 = \VEVT (0x04)
                            }

                            Local1 = (0x0F & Local0)
                            If (Local1)
                            {
                                ASWT (Local1, 0x00)
                            }
                        }
                    }

                    Device (LCD0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDL)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQDL) /* \_SB_.PCI0.PEG_.VQDL */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSDL = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }

                        Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                        {
                            If (ISOP ())
                            {
                                Return (0x00)
                            }

                            If ((Arg0 == 0x01))
                            {
                                Return (\VEDI)
                            }
                            ElseIf ((Arg0 == 0x02))
                            {
                                Return (\VEDI)
                            }

                            Return (0x00)
                        }
                    }

                    Device (CRT0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x01)
                            If (\VCSS)
                            {
                                If (\VCDC)
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            ElseIf (\VCDC)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQDC) /* \_SB_.PCI0.PEG_.VQDC */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSDC = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DVI0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0111)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD1) /* \_SB_.PCI0.PEG_.VQD1 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD1 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DP0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0114)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD0) /* \_SB_.PCI0.PEG_.VQD0 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD0 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DVI1)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0112)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD3) /* \_SB_.PCI0.PEG_.VQD3 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD3 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DP1)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0115)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD2) /* \_SB_.PCI0.PEG_.VQD2 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD2 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DVI2)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0113)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD5) /* \_SB_.PCI0.PEG_.VQD5 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD5 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Device (DP2)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0116)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            \VUPS (0x00)
                            If (\VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD4) /* \_SB_.PCI0.PEG_.VQD4 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            VSD4 = (Arg0 & 0x01)
                            If ((Arg0 & 0x80000000))
                            {
                                If ((Arg0 & 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (0x01)
                                }
                            }
                        }
                    }

                    Method (DSWT, 1, NotSerialized)
                    {
                        If (VSDL)
                        {
                            Local0 = 0x01
                        }
                        Else
                        {
                            Local0 = 0x00
                        }

                        If (VSDC)
                        {
                            Local0 |= 0x02
                        }

                        If (VSD0)
                        {
                            Local0 |= 0x08
                        }

                        If (Local0)
                        {
                            If (VUPC)
                            {
                                \VSDS (Local0, Arg0)
                            }
                        }
                        Else
                        {
                            Noop
                        }
                    }
                }

                Scope (\_SB.PCI0.PEG.VID)
                {
                    Method (NBCI, 4, NotSerialized)
                    {
                        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        Debug = "------- NBCI DSM --------"
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == 0x00))
                        {
                            Local0 = Buffer (0x04)
                                {
                                     0x00, 0x00, 0x00, 0x00                           // ....
                                }
                            Divide (0x00, 0x08, Local2, Local1)
                            Local2 = (0x01 << Local2)
                            Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                            Divide (0x14, 0x08, Local2, Local1)
                            Local2 = (0x01 << Local2)
                            Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                            Return (Local0)
                        }
                        ElseIf ((_T_0 == 0x14))
                        {
                            Local0 = Package (0x07)
                                {
                                    0x0110, 
                                    0x0200, 
                                    0x00, 
                                    0x00, 
                                    0x05, 
                                    0x01, 
                                    Package (0x04)
                                    {
                                        0xDC, 
                                        0x00, 
                                        0x03E8, 
                                        Package (0x03)
                                        {
                                            0x65, 
                                            Package (0x65)
                                            {
                                                0x00, 
                                                0x0A, 
                                                0x14, 
                                                0x1E, 
                                                0x28, 
                                                0x32, 
                                                0x3C, 
                                                0x46, 
                                                0x50, 
                                                0x5A, 
                                                0x64, 
                                                0x6E, 
                                                0x78, 
                                                0x82, 
                                                0x8C, 
                                                0x96, 
                                                0xA0, 
                                                0xAA, 
                                                0xB4, 
                                                0xBE, 
                                                0xC8, 
                                                0xD2, 
                                                0xDC, 
                                                0xE6, 
                                                0xF0, 
                                                0xFA, 
                                                0x0104, 
                                                0x010E, 
                                                0x0118, 
                                                0x0122, 
                                                0x012C, 
                                                0x0136, 
                                                0x0140, 
                                                0x014A, 
                                                0x0154, 
                                                0x015E, 
                                                0x0168, 
                                                0x0172, 
                                                0x017C, 
                                                0x0186, 
                                                0x0190, 
                                                0x019A, 
                                                0x01A4, 
                                                0x01AE, 
                                                0x01B8, 
                                                0x01C2, 
                                                0x01CC, 
                                                0x01D6, 
                                                0x01E0, 
                                                0x01EA, 
                                                0x01F4, 
                                                0x01FE, 
                                                0x0208, 
                                                0x0212, 
                                                0x021C, 
                                                0x0226, 
                                                0x0230, 
                                                0x023A, 
                                                0x0244, 
                                                0x024E, 
                                                0x0258, 
                                                0x0262, 
                                                0x026C, 
                                                0x0276, 
                                                0x0280, 
                                                0x028A, 
                                                0x0294, 
                                                0x029E, 
                                                0x02A8, 
                                                0x02B2, 
                                                0x02BC, 
                                                0x02C6, 
                                                0x02D0, 
                                                0x02DA, 
                                                0x02E4, 
                                                0x02EE, 
                                                0x02F8, 
                                                0x0302, 
                                                0x030C, 
                                                0x0316, 
                                                0x0320, 
                                                0x032A, 
                                                0x0334, 
                                                0x033E, 
                                                0x0348, 
                                                0x0352, 
                                                0x035C, 
                                                0x0366, 
                                                0x0370, 
                                                0x037A, 
                                                0x0384, 
                                                0x038E, 
                                                0x0398, 
                                                0x03A2, 
                                                0x03AC, 
                                                0x03B6, 
                                                0x03C0, 
                                                0x03CA, 
                                                0x03D4, 
                                                0x03DE, 
                                                0x03E8
                                            }, 

                                            Package (0x65)
                                            {
                                                0x00, 
                                                0x0A, 
                                                0x14, 
                                                0x1E, 
                                                0x28, 
                                                0x32, 
                                                0x3C, 
                                                0x46, 
                                                0x50, 
                                                0x5A, 
                                                0x64, 
                                                0x6E, 
                                                0x78, 
                                                0x82, 
                                                0x8C, 
                                                0x96, 
                                                0xA0, 
                                                0xAA, 
                                                0xB4, 
                                                0xBE, 
                                                0xC8, 
                                                0xD2, 
                                                0xDC, 
                                                0xE6, 
                                                0xF0, 
                                                0xFA, 
                                                0x0104, 
                                                0x010E, 
                                                0x0118, 
                                                0x0122, 
                                                0x012C, 
                                                0x0136, 
                                                0x0140, 
                                                0x014A, 
                                                0x0154, 
                                                0x015E, 
                                                0x0168, 
                                                0x0172, 
                                                0x017C, 
                                                0x0186, 
                                                0x0190, 
                                                0x019A, 
                                                0x01A4, 
                                                0x01AE, 
                                                0x01B8, 
                                                0x01C2, 
                                                0x01CC, 
                                                0x01D6, 
                                                0x01E0, 
                                                0x01EA, 
                                                0x01F4, 
                                                0x01FE, 
                                                0x0208, 
                                                0x0212, 
                                                0x021C, 
                                                0x0226, 
                                                0x0230, 
                                                0x023A, 
                                                0x0244, 
                                                0x024E, 
                                                0x0258, 
                                                0x0262, 
                                                0x026C, 
                                                0x0276, 
                                                0x0280, 
                                                0x028A, 
                                                0x0294, 
                                                0x029E, 
                                                0x02A8, 
                                                0x02B2, 
                                                0x02BC, 
                                                0x02C6, 
                                                0x02D0, 
                                                0x02DA, 
                                                0x02E4, 
                                                0x02EE, 
                                                0x02F8, 
                                                0x0302, 
                                                0x030C, 
                                                0x0316, 
                                                0x0320, 
                                                0x032A, 
                                                0x0334, 
                                                0x033E, 
                                                0x0348, 
                                                0x0352, 
                                                0x035C, 
                                                0x0366, 
                                                0x0370, 
                                                0x037A, 
                                                0x0384, 
                                                0x038E, 
                                                0x0398, 
                                                0x03A2, 
                                                0x03AC, 
                                                0x03B6, 
                                                0x03C0, 
                                                0x03CA, 
                                                0x03D4, 
                                                0x03DE, 
                                                0x03E8
                                            }
                                        }
                                    }
                                }
                            Local1 = 0x00
                            While ((Local1 <= 0x64))
                            {
                                Local2 = DerefOf (DerefOf (\_SB.PCI0.LPC.EC.BRTD [\BRTN]) [Local1])
                                Local2 *= 0x03E8
                                Divide (Local2, 0xFF, Local2, Local3)
                                DerefOf (DerefOf (DerefOf (Local0 [0x06]) [0x03]
                                    ) [0x01]) [Local1] = Local3
                                Local1++
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    Method (NVSB, 1, NotSerialized)
                    {
                        Name (CNT, 0x00)
                        If ((PBCC == 0x01))
                        {
                            If ((PBMR == 0x00))
                            {
                                PBMR = 0x02
                                If ((PBMR == 0x02))
                                {
                                    While (((PBCC && 0xFF) && (CNT < 0x0A)))
                                    {
                                        CNT++
                                        Sleep (0x01)
                                    }

                                    If (((PBCR & 0x02) == 0x00))
                                    {
                                        Local0 = (Arg0 * 0x03E8)
                                        Divide (Local0, 0xFF, Local1, Local2)
                                        Local2 <<= 0x08
                                        PBDI = Local2
                                        PBCR = 0x86100000
                                    }

                                    PBMR = 0x00
                                    Return (0x01)
                                }
                            }
                        }

                        Return (0x00)
                    }
                }

                OperationRegion (PEGC, PCI_Config, 0x00, 0x0100)
                Field (PEGC, DWordAcc, NoLock, Preserve)
                {
                    Offset (0xEC), 
                    GMGP,   1, 
                    HPGP,   1, 
                    PMGP,   1
                }
            }

            Device (IGBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (RID, 0x00)
                OperationRegion (PECS, PCI_Config, 0x00, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x5A), 
                        ,   3, 
                    PDC,    1, 
                        ,   2, 
                    PDS,    1, 
                    Offset (0x5B), 
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   6, 
                    HPCE,   1, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   6, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    PDSF = PDS /* \_SB_.PCI0.EXP1.PDS_ */
                }

                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.LNKD, 
                        0x00
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP1.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP1.LPRT */
                    }
                }

                Name (PDSF, 0x00)
                Device (SLOT)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Name (RID, 0x00)
                OperationRegion (PECS, PCI_Config, 0x00, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   7, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   7, 
                    PMCS,   1
                }

                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.LNKB, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.LNKA, 
                        0x00
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP2.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP2.LPRT */
                    }
                }
            }

            Device (EXP3)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (RID, 0x00)
                OperationRegion (PECS, PCI_Config, 0x00, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x5A), 
                        ,   3, 
                    PDC,    1, 
                        ,   2, 
                    PDS,    1, 
                    Offset (0x5B), 
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   6, 
                    HPCE,   1, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   6, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    PDSF = PDS /* \_SB_.PCI0.EXP3.PDS_ */
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.LNKC, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.LNKD, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.LNKA, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.LNKB, 
                        0x00
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        0x00, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        0x00, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        0x00, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        0x00, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP3.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP3.LPRT */
                    }
                }

                Name (PDSF, 0x00)
                Device (SLOT)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (0x01)
                    }
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
            }

            Device (SAT2)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
            }

            Device (SMBU)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
            }

            Device (XHCI)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                OperationRegion (XHCS, PCI_Config, 0x00, 0x0100)
                Field (XHCS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0xD0), 
                    PR2,    32, 
                    PR2M,   32, 
                    PR3,    32, 
                    PR3M,   32
                }

                Name (XRST, Zero)
                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR1, Package (0x01)  // _PR1: Power Resources for D1
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PRW, Package (0x03)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03, 
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Method (CUID, 1, Serialized)
                {
                    If ((Arg0 == ToUUID ("7c9512a9-1705-4cb4-af7d-506a2423ab71") /* Unknown UUID */))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (POSC, 3, Serialized)
                {
                    CreateDWordField (Arg2, 0x00, CDW1)
                    If ((Arg0 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((\XHCM == 0x00))
                    {
                        CDW1 |= 0x02
                        \_SB.PCI0.LPC.XUSB = 0x00
                        XRST = 0x00
                    }

                    If ((!(CDW1 & 0x01) && ((\XHCM == 0x02) || (
                        \XHCM == 0x03))))
                    {
                        SXHC ()
                    }

                    Return (Arg2)
                }

                Method (SXHC, 0, NotSerialized)
                {
                    \_SB.PCI0.LPC.XUSB = 0x01
                    XRST = 0x01
                    Local0 = 0x00
                    Local0 = (PR3 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                    PR3 = (Local0 & PR3M) /* \_SB_.PCI0.XHCI.PR3M */
                    Local0 = 0x00
                    Local0 = (PR2 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                    PR2 = (Local0 & PR2M) /* \_SB_.PCI0.XHCI.PR2M */
                    \_SB.PCI0.LPC.XUSB = 0x01
                    \USBR = 0x01
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    If (\WIN8)
                    {
                        SXHC ()
                    }
                }

                Device (URTH)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (HSP0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC0, UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP0._UPC.UPCP */
                            If (!(PR2 & 0x01))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP0._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD0
                            CreateBitField (PLDP, 0x40, VIS)
                            If (!(PR2 & 0x01))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.HSP0._PLD.PLDP */
                        }
                    }

                    Device (HSP1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC1, UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP1._UPC.UPCP */
                            If (!(PR2 & 0x02))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD1
                            CreateBitField (PLDP, 0x40, VIS)
                            If (!(PR2 & 0x02))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.HSP1._PLD.PLDP */
                        }
                    }

                    Device (HSP2)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC2, UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP2._UPC.UPCP */
                            If (!(PR2 & 0x04))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD2
                            CreateBitField (PLDP, 0x40, VIS)
                            If (!(PR2 & 0x04))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.HSP2._PLD.PLDP */
                        }
                    }

                    Device (HSP3)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC3, UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP3._UPC.UPCP */
                            If (!(PR2 & 0x08))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.HSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD3
                            CreateBitField (PLDP, 0x40, VIS)
                            If (!(PR2 & 0x08))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.HSP3._PLD.PLDP */
                        }
                    }

                    Device (SSP0)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC0, UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP0._UPC.UPCP */
                            If ((!(PR2 & 0x01) || !(PR3 & 0x01)))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP0._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD0
                            CreateBitField (PLDP, 0x40, VIS)
                            If ((!(PR2 & 0x01) || !(PR3 & 0x01)))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.SSP0._PLD.PLDP */
                        }
                    }

                    Device (SSP1)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC1, UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP1._UPC.UPCP */
                            If ((!(PR2 & 0x02) || !(PR3 & 0x02)))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD1
                            CreateBitField (PLDP, 0x40, VIS)
                            If ((!(PR2 & 0x02) || !(PR3 & 0x02)))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.SSP1._PLD.PLDP */
                        }
                    }

                    Device (SSP2)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC2, UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP2._UPC.UPCP */
                            If ((!(PR2 & 0x04) || !(PR3 & 0x04)))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD2
                            CreateBitField (PLDP, 0x40, VIS)
                            If ((!(PR2 & 0x04) || !(PR3 & 0x04)))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.SSP2._PLD.PLDP */
                        }
                    }

                    Device (SSP3)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0x00, 
                                0x00, 
                                0x00, 
                                0x00
                            })
                            CopyObject (\UPC3, UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP3._UPC.UPCP */
                            If ((!(PR2 & 0x08) || !(PR3 & 0x08)))
                            {
                                UPCP [0x00] = 0x00
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHCI.URTH.SSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Buffer (0x10){})
                            PLDP = \PLD3
                            CreateBitField (PLDP, 0x40, VIS)
                            If ((!(PR2 & 0x08) || !(PR3 & 0x08)))
                            {
                                VIS &= 0x00
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHCI.URTH.SSP3._PLD.PLDP */
                        }
                    }
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                OperationRegion (EHCS, PCI_Config, 0x00, 0x0100)
                Field (EHCS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PWKI,   1, 
                    PWUC,   8, 
                    Offset (0x64)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR1, Package (0x01)  // _PR1: Power Resources for D1
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    PWKI = 0x01
                    PWUC = 0x23
                }

                Name (_PRW, Package (0x03)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03, 
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Device (URTH)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (URMH)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (\UPCI)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (\PLDI)
                        }

                        Device (PRT0)
                        {
                            Name (_ADR, 0x01)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0x00, 
                                    0x00, 
                                    0x00, 
                                    0x00
                                })
                                CopyObject (\UPC0, UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT0._UPC.UPCP */
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x01))
                                {
                                    UPCP [0x00] = 0x00
                                }

                                Return (UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT0._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Buffer (0x10){})
                                PLDP = \PLD0
                                CreateBitField (PLDP, 0x40, VIS)
                                If ((\XHCM == 0x00)){}
                                Else
                                {
                                    If ((\_SB.PCI0.XHCI.PR2 & 0x01))
                                    {
                                        VIS &= 0x00
                                    }

                                    Return (PLDP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT0._PLD.PLDP */
                                }
                            }
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0x00, 
                                    0x00, 
                                    0x00, 
                                    0x00
                                })
                                CopyObject (\UPC1, UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT1._UPC.UPCP */
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x02))
                                {
                                    UPCP [0x00] = 0x00
                                }

                                Return (UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT1._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Buffer (0x10){})
                                PLDP = \PLD1
                                CreateBitField (PLDP, 0x40, VIS)
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x02))
                                {
                                    VIS &= 0x00
                                }

                                Return (PLDP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT1._PLD.PLDP */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0x00, 
                                    0x00, 
                                    0x00, 
                                    0x00
                                })
                                CopyObject (\UPC2, UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT2._UPC.UPCP */
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x04))
                                {
                                    UPCP [0x00] = 0x00
                                }

                                Return (UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT2._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Buffer (0x10){})
                                PLDP = \PLD2
                                CreateBitField (PLDP, 0x40, VIS)
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x04))
                                {
                                    VIS &= 0x00
                                }

                                Return (PLDP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT2._PLD.PLDP */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0x00, 
                                    0x00, 
                                    0x00, 
                                    0x00
                                })
                                CopyObject (\UPC3, UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT3._UPC.UPCP */
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x08))
                                {
                                    UPCP [0x00] = 0x00
                                }

                                Return (UPCP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT3._UPC.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Name (PLDP, Buffer (0x10){})
                                PLDP = \PLD3
                                CreateBitField (PLDP, 0x40, VIS)
                                If ((\XHCM == 0x00)){}
                                ElseIf ((\_SB.PCI0.XHCI.PR2 & 0x08))
                                {
                                    VIS &= 0x00
                                }

                                Return (PLDP) /* \_SB_.PCI0.EHC1.URTH.URMH.PRT3._PLD.PLDP */
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPC4)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLD4)
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPC5)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLD5)
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPC6)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLD6)
                            }
                        }

                        Device (PRT7)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPC7)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLD7)
                            }
                        }
                    }
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                OperationRegion (EHCS, PCI_Config, 0x00, 0x0100)
                Field (EHCS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PWKI,   1, 
                    PWUC,   6, 
                    Offset (0x64)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR1, Package (0x01)  // _PR1: Power Resources for D1
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
                {
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    PWKI = 0x01
                    PWUC = 0x13
                }

                Name (_PRW, Package (0x03)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03, 
                    \_SB.PCI0.LPC.EC.PUBS
                })
                Device (URTH)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (URMH)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (\UPCI)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (\PLDI)
                        }

                        Device (PRT8)
                        {
                            Name (_ADR, 0x01)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPCI)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLDI)
                            }
                        }

                        Device (PRT9)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPC9)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLD9)
                            }
                        }

                        Device (PRTA)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPCI)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLDI)
                            }
                        }

                        Device (PRTB)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPCI)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLDI)
                            }
                        }

                        Device (PRTC)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPCI)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLDI)
                            }
                        }

                        Device (PRTD)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (\UPCI)
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (\PLDI)
                            }

                            Device (WCAM)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    If (\WIN8)
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (0x00)
                                    }
                                }

                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (\UPCI)
                                }

                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (\PLDC)
                                }
                            }
                        }
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, 0x00)
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    Noop
                }
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Name (BDEV, 0xFF)
            Name (BSTS, 0x00)
            Name (BHKE, 0x00)
            Method (_Q2C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If ((BSTS == 0x00))
                {
                    BDEV = BGID (0x00)
                    NBRE (BDEV)
                }
            }

            Method (_Q2D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                BDEV = BGID (0x00)
                NBIN (BDEV)
            }

            Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Local0 = BGID (0x00)
                If ((Local0 == 0x0F))
                {
                    BDIS ()
                    \BHDP (0x01, 0x00)
                    NBEJ (BDEV)
                    BDEV = Local0
                    If ((\BIDE == 0x03))
                    {
                        \_SB.PCI0.SAT1.PRIM.GTME = 0x00
                        \_SB.PCI0.SAT1.SCND.GTME = 0x00
                    }
                }
                ElseIf (HPBU){}
                Else
                {
                    BDEV = Local0
                    NBIN (Local0)
                }
            }

            Name (ODEJ, 0x00)
            Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (\_SB.PCI0.LPC.CSON)
                {
                    ODEJ = 0x01
                    BDEV = BGID (0x00)
                    NBIN (BDEV)
                    ODEJ = 0x00
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x3006)
                }
            }

            Method (NBRE, 1, NotSerialized)
            {
                If ((Arg0 < 0x0C))
                {
                    If ((\BIDE == 0x03))
                    {
                        Notify (\_SB.PCI0.SAT1.SCND.MSTR, 0x03) // Eject Request
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.SAT1.PRT1, 0x03) // Eject Request
                    }
                }
            }

            Method (NBEJ, 1, NotSerialized)
            {
                If ((BSTS == 0x00))
                {
                    If ((Arg0 < 0x0C))
                    {
                        If ((\BIDE == 0x03))
                        {
                            Notify (\_SB.PCI0.SAT1.SCND.MSTR, 0x01) // Device Check
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.SAT1.PRT1, 0x01) // Device Check
                        }
                    }
                }

                BEEP (0x00)
                BSTS = 0x00
            }

            Method (NBIN, 1, NotSerialized)
            {
                If ((Arg0 < 0x0C))
                {
                    BEN (0x01)
                    If ((\BIDE == 0x03))
                    {
                        Notify (\_SB.PCI0.SAT1.SCND.MSTR, 0x01) // Device Check
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.SAT1.PRT1, 0x01) // Device Check
                    }
                }

                BEEP (0x00)
                BSTS = 0x00
            }

            Method (BEJ0, 1, NotSerialized)
            {
                If (Arg0)
                {
                    BDIS ()
                    \BHDP (0x01, 0x00)
                    BSTS = 0x01
                    If (BHKE)
                    {
                        BHKE = 0x00
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x3003)
                    }
                }
                Else
                {
                    BSTS = 0x00
                }
            }

            Method (BEJ3, 1, NotSerialized)
            {
                If (Arg0)
                {
                    BDIS ()
                    BSTS = 0x01
                }
                Else
                {
                    BSTS = 0x00
                }
            }

            Method (BPTS, 1, NotSerialized)
            {
                HDBM = 0x01
                If ((BSTS != 0x00))
                {
                    BDEV = 0x0F
                    BSTS = 0x00
                }

                BHKE = 0x00
                BUWK (0x00)
            }

            Method (BWAK, 1, NotSerialized)
            {
                BUWK (0x00)
                Local0 = BGID (0x00)
                If ((BSTS == 0x00))
                {
                    If ((Local0 != BDEV))
                    {
                        NBEJ (BDEV)
                        BDEV = Local0
                        NBIN (Local0)
                    }
                    ElseIf ((\LFDC || (BDEV != 0x0D)))
                    {
                        If ((Local0 != 0x0F))
                        {
                            If (HPBU)
                            {
                                If ((Arg0 <= 0x02)){}
                                Else
                                {
                                    NBRE (Local0)
                                }
                            }
                        }
                    }
                }

                If ((BDEV < 0x0C))
                {
                    \UBIS (0x00)
                }
                Else
                {
                    \UBIS (0x01)
                }
            }

            Method (BDIS, 0, NotSerialized)
            {
                If (!\_SB.PCI0.LPC.CSON)
                {
                    If (!\_SB.PCI0.LPC.GLIS)
                    {
                        \UBIS (0x01)
                    }

                    \_SB.PCI0.LPC.CSON = 0x01
                    \IDET = 0x0F
                }
            }

            Method (BPON, 1, NotSerialized)
            {
                If (\_SB.PCI0.LPC.CSON)
                {
                    \_SB.PCI0.LPC.CSON = 0x00
                    If (\_SB.PCI0.LPC.GLIS)
                    {
                        \UBIS (0x00)
                    }
                }
            }

            Method (BEN, 1, NotSerialized)
            {
                If (\_SB.PCI0.LPC.CSON)
                {
                    BPON (Arg0)
                    If ((Arg0 && (ODEJ == 0x01)))
                    {
                        \_SB.PCI0.LPC.EC.HANT = 0x09
                    }

                    If (Arg0)
                    {
                        IRDY ()
                    }
                }
            }

            Method (BSTA, 1, NotSerialized)
            {
                If (\_SB.PCI0.LPC.CSON)
                {
                    Return (0x00)
                }

                BINI ()
                If ((Arg0 == 0x01))
                {
                    Return ((BDEV < 0x0C))
                }

                Return (0x00)
            }

            Method (BUWK, 1, NotSerialized)
            {
                If (\H8DR)
                {
                    If (Arg0)
                    {
                        \_SB.PCI0.LPC.EC.HWBU = 0x01
                    }
                    Else
                    {
                        \_SB.PCI0.LPC.EC.HWBU = 0x00
                    }
                }
                ElseIf (Arg0)
                {
                    \MBEC (0x32, 0xFF, 0x80)
                }
                Else
                {
                    \MBEC (0x32, 0x7F, 0x00)
                }
            }

            Method (BINI, 0, NotSerialized)
            {
                If ((BDEV == 0xFF))
                {
                    BDEV = BGID (0x00)
                }
            }

            Method (BGID, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Local0 = 0xFF
                }
                Else
                {
                    If (\H8DR)
                    {
                        Local1 = HPBU /* \_SB_.PCI0.LPC_.EC__.HPBU */
                        Local2 = HBID /* \_SB_.PCI0.LPC_.EC__.HBID */
                    }
                    Else
                    {
                        Local2 = RBEC (0x47)
                        Local1 = (Local2 & 0x01)
                        Local2 &= 0x04
                        Local2 >>= 0x02
                    }

                    If (Local2)
                    {
                        Local0 = 0x0F
                    }
                    ElseIf (HDUB)
                    {
                        Local0 = 0x0F
                    }
                    ElseIf (((\IDET == 0x03) || (\IDET == 0x06)))
                    {
                        Local0 = \IDET
                    }
                    Else
                    {
                        Local0 = 0x07
                    }

                    If ((Local0 == 0x0F)){}
                }

                If ((\HDUB && (Local0 < 0x0C)))
                {
                    Local0 = 0x0F
                }

                Return (Local0)
            }

            Method (IRDY, 0, NotSerialized)
            {
                Local0 = 0x01F4
                Local1 = 0x3C
                Local2 = Zero
                While (Local1)
                {
                    Sleep (Local0)
                    Local3 = \BCHK ()
                    If (!Local3)
                    {
                        Break
                    }

                    If ((Local3 == 0x02))
                    {
                        Local2 = One
                        Break
                    }

                    Local1--
                }

                Return (Local2)
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_Q43, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                \UCMS (0x18)
            }

            Method (SAUM, 1, NotSerialized)
            {
                If ((Arg0 > 0x03))
                {
                    Noop
                }
                ElseIf (\H8DR)
                {
                    HAUM = Arg0
                }
                Else
                {
                    \MBEC (0x03, 0x9F, (Arg0 << 0x05))
                }
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Method (GSMS, 1, NotSerialized)
            {
                Return (\AUDC (0x00, 0x00))
            }

            Method (SSMS, 1, NotSerialized)
            {
                Return (\AUDC (0x01, (Arg0 & 0x01)))
            }

            Method (SHDA, 1, NotSerialized)
            {
                Return (\AUDC (0x02, (Arg0 & 0x01)))
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Name (BRTW, Package (0x12)
            {
                0x64, 
                0x64, 
                0x05, 
                0x0A, 
                0x14, 
                0x19, 
                0x1E, 
                0x23, 
                0x28, 
                0x2D, 
                0x32, 
                0x37, 
                0x3C, 
                0x41, 
                0x46, 
                0x50, 
                0x5A, 
                0x64
            })
            Name (BRTB, Package (0x04)
            {
                Package (0x16)
                {
                    0x16, 
                    0x04, 
                    0x03, 
                    0x05, 
                    0x08, 
                    0x0A, 
                    0x0D, 
                    0x12, 
                    0x19, 
                    0x21, 
                    0x2B, 
                    0x38, 
                    0x4A, 
                    0x61, 
                    0x7E, 
                    0xA0, 
                    0xCC, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x03, 
                    0x03
                }, 

                Package (0x16)
                {
                    0x1B, 
                    0x04, 
                    0x03, 
                    0x05, 
                    0x08, 
                    0x0A, 
                    0x0D, 
                    0x0F, 
                    0x12, 
                    0x19, 
                    0x22, 
                    0x2E, 
                    0x3E, 
                    0x54, 
                    0x6E, 
                    0x93, 
                    0xC1, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x03, 
                    0x03
                }, 

                Package (0x16)
                {
                    0x14, 
                    0x04, 
                    0x04, 
                    0x07, 
                    0x09, 
                    0x0C, 
                    0x10, 
                    0x15, 
                    0x1C, 
                    0x25, 
                    0x32, 
                    0x40, 
                    0x53, 
                    0x6E, 
                    0x94, 
                    0xC6, 
                    0xE1, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }, 

                Package (0x16)
                {
                    0x00, 
                    0x04, 
                    0x04, 
                    0x07, 
                    0x09, 
                    0x0C, 
                    0x10, 
                    0x15, 
                    0x1C, 
                    0x25, 
                    0x32, 
                    0x40, 
                    0x50, 
                    0x64, 
                    0x82, 
                    0xA5, 
                    0xCD, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }
            })
            Name (BRTD, Package (0x04)
            {
                Package (0x65)
                {
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1C, 
                    0x1D, 
                    0x1F, 
                    0x21, 
                    0x22, 
                    0x24, 
                    0x26, 
                    0x28, 
                    0x2A, 
                    0x2C, 
                    0x2E, 
                    0x30, 
                    0x33, 
                    0x35, 
                    0x37, 
                    0x3A, 
                    0x3C, 
                    0x3F, 
                    0x41, 
                    0x44, 
                    0x46, 
                    0x49, 
                    0x4C, 
                    0x4F, 
                    0x51, 
                    0x54, 
                    0x57, 
                    0x5A, 
                    0x5D, 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x6A, 
                    0x6E, 
                    0x71, 
                    0x75, 
                    0x78, 
                    0x7C, 
                    0x80, 
                    0x83, 
                    0x87, 
                    0x8B, 
                    0x8F, 
                    0x93, 
                    0x97, 
                    0x9B, 
                    0x9F, 
                    0xA3, 
                    0xA8, 
                    0xAC, 
                    0xB0, 
                    0xB5, 
                    0xB9, 
                    0xBE, 
                    0xC3, 
                    0xC7, 
                    0xCC, 
                    0xCE, 
                    0xD1, 
                    0xD3, 
                    0xD6, 
                    0xD8, 
                    0xDB, 
                    0xDD, 
                    0xE0, 
                    0xE2, 
                    0xE5, 
                    0xE7, 
                    0xEA, 
                    0xEC, 
                    0xEF, 
                    0xF2, 
                    0xF4, 
                    0xF7, 
                    0xFA, 
                    0xFC, 
                    0xFF
                }, 

                Package (0x65)
                {
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1B, 
                    0x1C, 
                    0x1D, 
                    0x1E, 
                    0x1F, 
                    0x20, 
                    0x21, 
                    0x22, 
                    0x23, 
                    0x25, 
                    0x26, 
                    0x28, 
                    0x2A, 
                    0x2C, 
                    0x2E, 
                    0x2F, 
                    0x31, 
                    0x33, 
                    0x35, 
                    0x37, 
                    0x3A, 
                    0x3C, 
                    0x3E, 
                    0x40, 
                    0x42, 
                    0x45, 
                    0x47, 
                    0x4A, 
                    0x4C, 
                    0x4E, 
                    0x51, 
                    0x54, 
                    0x56, 
                    0x59, 
                    0x5C, 
                    0x5E, 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x6A, 
                    0x6D, 
                    0x70, 
                    0x73, 
                    0x76, 
                    0x79, 
                    0x7D, 
                    0x80, 
                    0x83, 
                    0x86, 
                    0x8A, 
                    0x8D, 
                    0x91, 
                    0x94, 
                    0x98, 
                    0x9C, 
                    0x9F, 
                    0xA3, 
                    0xA7, 
                    0xAB, 
                    0xAF, 
                    0xB4, 
                    0xB8, 
                    0xBC, 
                    0xC1, 
                    0xC5, 
                    0xCA, 
                    0xCE, 
                    0xD3, 
                    0xD8, 
                    0xDC, 
                    0xE1, 
                    0xE6, 
                    0xEB, 
                    0xF0, 
                    0xF5, 
                    0xFA, 
                    0xFF
                }, 

                Package (0x65)
                {
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1C, 
                    0x1D, 
                    0x1F, 
                    0x21, 
                    0x22, 
                    0x24, 
                    0x26, 
                    0x28, 
                    0x2A, 
                    0x2C, 
                    0x2E, 
                    0x30, 
                    0x33, 
                    0x35, 
                    0x37, 
                    0x3A, 
                    0x3C, 
                    0x3F, 
                    0x41, 
                    0x44, 
                    0x46, 
                    0x49, 
                    0x4C, 
                    0x4F, 
                    0x51, 
                    0x54, 
                    0x57, 
                    0x5A, 
                    0x5D, 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x6A, 
                    0x6E, 
                    0x71, 
                    0x75, 
                    0x78, 
                    0x7C, 
                    0x80, 
                    0x83, 
                    0x87, 
                    0x8B, 
                    0x8F, 
                    0x93, 
                    0x97, 
                    0x9B, 
                    0x9F, 
                    0xA3, 
                    0xA8, 
                    0xAC, 
                    0xB0, 
                    0xB5, 
                    0xB9, 
                    0xBE, 
                    0xC3, 
                    0xC7, 
                    0xCC, 
                    0xCE, 
                    0xD1, 
                    0xD3, 
                    0xD6, 
                    0xD8, 
                    0xDB, 
                    0xDD, 
                    0xE0, 
                    0xE2, 
                    0xE5, 
                    0xE7, 
                    0xEA, 
                    0xEC, 
                    0xEF, 
                    0xF2, 
                    0xF4, 
                    0xF7, 
                    0xFA, 
                    0xFC, 
                    0xFF
                }, 

                Package (0x65)
                {
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1C, 
                    0x1D, 
                    0x1F, 
                    0x21, 
                    0x22, 
                    0x24, 
                    0x26, 
                    0x28, 
                    0x2A, 
                    0x2C, 
                    0x2E, 
                    0x30, 
                    0x33, 
                    0x35, 
                    0x37, 
                    0x3A, 
                    0x3C, 
                    0x3F, 
                    0x41, 
                    0x44, 
                    0x46, 
                    0x49, 
                    0x4C, 
                    0x4F, 
                    0x51, 
                    0x54, 
                    0x57, 
                    0x5A, 
                    0x5D, 
                    0x61, 
                    0x64, 
                    0x67, 
                    0x6A, 
                    0x6E, 
                    0x71, 
                    0x75, 
                    0x78, 
                    0x7C, 
                    0x80, 
                    0x83, 
                    0x87, 
                    0x8B, 
                    0x8F, 
                    0x93, 
                    0x97, 
                    0x9B, 
                    0x9F, 
                    0xA3, 
                    0xA8, 
                    0xAC, 
                    0xB0, 
                    0xB5, 
                    0xB9, 
                    0xBE, 
                    0xC3, 
                    0xC7, 
                    0xCC, 
                    0xCE, 
                    0xD1, 
                    0xD3, 
                    0xD6, 
                    0xD8, 
                    0xDB, 
                    0xDD, 
                    0xE0, 
                    0xE2, 
                    0xE5, 
                    0xE7, 
                    0xEA, 
                    0xEC, 
                    0xEF, 
                    0xF2, 
                    0xF4, 
                    0xF7, 
                    0xFA, 
                    0xFC, 
                    0xFF
                }
            })
            Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x8000))
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1010)
                }

                If (\NBCF)
                {
                    If (\VIGD)
                    {
                        Notify (\_SB.PCI0.VID.LCD0, 0x86) // Device-Specific
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.PEG.VID.LCD0, 0x86) // Device-Specific
                    }
                }
                Else
                {
                    Local0 = \BRLV
                    If ((Local0 != 0x0F))
                    {
                        Local0++
                        \BRLV = Local0
                    }

                    If (\VIGD)
                    {
                        \UCMS (0x16)
                        \_SB.PCI0.LPC.EC.BRNS ()
                    }
                    Else
                    {
                        \VBRC (Local0)
                    }

                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6050)
                }
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00010000))
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1011)
                }

                If (\NBCF)
                {
                    If (\VIGD)
                    {
                        Notify (\_SB.PCI0.VID.LCD0, 0x87) // Device-Specific
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.PEG.VID.LCD0, 0x87) // Device-Specific
                    }
                }
                Else
                {
                    Local0 = \BRLV
                    If (Local0)
                    {
                        Local0--
                        \BRLV = Local0
                    }

                    If (\VIGD)
                    {
                        \UCMS (0x16)
                        \_SB.PCI0.LPC.EC.BRNS ()
                    }
                    Else
                    {
                        \VBRC (Local0)
                    }

                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6050)
                }

                Return (Zero)
            }

            Method (BRNS, 0, NotSerialized)
            {
                Local0 = (\BRLV + 0x02)
                Local3 = \BRTN
                If (\_SB.PCI0.VID.DRDY)
                {
                    If ((0x00 == Local0))
                    {
                        Local1 = DerefOf (DerefOf (BRTB [Local3]) [0x14])
                        Local2 = DerefOf (DerefOf (BRTB [Local3]) [0x12])
                    }
                    Else
                    {
                        Local1 = DerefOf (DerefOf (BRTB [Local3]) [0x15])
                        Local2 = DerefOf (DerefOf (BRTB [Local3]) [0x13])
                    }

                    Local2 = (Local1 | (Local2 << 0x09))
                    \_SB.PCI0.VID.AINT (0x03, Local2)
                    Local2 = DerefOf (DerefOf (BRTB [Local3]) [Local0])
                    \_SB.PCI0.VID.AINT (0x01, Local2)
                }
                Else
                {
                    \UCMS (0x12)
                }
            }

            Method (BRCF, 1, NotSerialized)
            {
                If ((Arg0 < 0x00))
                {
                    Return (0x00)
                }

                If ((Arg0 > 0x64))
                {
                    Return (0x0F)
                }

                Local0 = (Arg0 + 0x03)
                Local0 *= 0x0F
                Divide (Local0, 0x64, Local0, Local1)
                Return (Local1)
            }

            Method (BRCD, 1, NotSerialized)
            {
                Local0 = DerefOf (DerefOf (BRTD [\BRTN]) [Arg0])
                Return (Local0)
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00800000))
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1018)
                }

                \UCMS (0x03)
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_Q63, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                If (\_SB.PCI0.LPC.EC.HKEY.MHKK (0x00080000))
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x1014)
                }

                \UCMS (0x0B)
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                FNST ()
            }

            Method (_Q72, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                FNST ()
            }

            Method (_Q73, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                FNST ()
            }

            Method (FNST, 0, NotSerialized)
            {
                If (\H8DR)
                {
                    Local0 = HFNS /* \_SB_.PCI0.LPC_.EC__.HFNS */
                    Local1 = HFNE /* \_SB_.PCI0.LPC_.EC__.HFNE */
                }
                Else
                {
                    Local0 = (\RBEC (0x0E) & 0x03)
                    Local1 = (\RBEC (0x00) & 0x08)
                }

                If (Local1)
                {
                    If ((Local0 == 0x00))
                    {
                        \UCMS (0x11)
                    }

                    If ((Local0 == 0x01))
                    {
                        \UCMS (0x0F)
                    }

                    If ((Local0 == 0x02))
                    {
                        \UCMS (0x10)
                    }

                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6005)
                }
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Method (GHSL, 1, NotSerialized)
            {
                Return (\FNSC (0x00, 0x00))
            }

            Method (SHSL, 1, NotSerialized)
            {
                Return (\FNSC (0x01, (Arg0 & 0x01)))
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Name (WGFL, 0x00)
            Method (WSIF, 0, NotSerialized)
            {
                Return (0x00)
            }

            Method (WLSW, 0, NotSerialized)
            {
                Return (\_SB.PCI0.LPC.EC.GSTS)
            }

            Method (GWAN, 0, NotSerialized)
            {
                Local0 = 0x00
                If ((WGFL & 0x01))
                {
                    Local0 |= 0x01
                }

                If ((WGFL & 0x08))
                {
                    Return (Local0)
                }

                If (WPWS ())
                {
                    Local0 |= 0x02
                }

                Local0 |= 0x04
                Return (Local0)
            }

            Method (SWAN, 1, NotSerialized)
            {
                If ((Arg0 & 0x02))
                {
                    WPWC (0x01)
                }
                Else
                {
                    WPWC (0x00)
                }
            }

            Method (GBDC, 0, NotSerialized)
            {
                Local0 = 0x00
                If ((WGFL & 0x10))
                {
                    Local0 |= 0x01
                }

                If ((WGFL & 0x80))
                {
                    Return (Local0)
                }

                If (BPWS ())
                {
                    Local0 |= 0x02
                }

                Local0 |= 0x04
                Return (Local0)
            }

            Method (SBDC, 1, NotSerialized)
            {
                If ((Arg0 & 0x02))
                {
                    BPWC (0x01)
                }
                Else
                {
                    BPWC (0x00)
                }
            }

            Method (WPWS, 0, NotSerialized)
            {
                If (\H8DR)
                {
                    Local0 = \_SB.PCI0.LPC.EC.DCWW
                }
                Else
                {
                    Local0 = ((\RBEC (0x3A) & 0x40) >> 0x06)
                }

                Return (Local0)
            }

            Method (WPWC, 1, NotSerialized)
            {
                If ((Arg0 && ((WGFL & 0x01) && !(WGFL & 0x08
                    ))))
                {
                    If (\H8DR)
                    {
                        \_SB.PCI0.LPC.EC.DCWW = One
                    }
                    Else
                    {
                        \MBEC (0x3A, 0xFF, 0x40)
                    }

                    WGFL |= 0x02
                }
                Else
                {
                    If (\H8DR)
                    {
                        \_SB.PCI0.LPC.EC.DCWW = Zero
                    }
                    Else
                    {
                        \MBEC (0x3A, 0xBF, 0x00)
                    }

                    WGFL &= ~0x02
                }
            }

            Method (BPWS, 0, NotSerialized)
            {
                If (\H8DR)
                {
                    Local0 = \_SB.PCI0.LPC.EC.DCBD
                }
                Else
                {
                    Local0 = ((\RBEC (0x3A) & 0x10) >> 0x04)
                }

                Return (Local0)
            }

            Method (BPWC, 1, NotSerialized)
            {
                If ((Arg0 && ((WGFL & 0x10) && !(WGFL & 0x80
                    ))))
                {
                    If (\H8DR)
                    {
                        \_SB.PCI0.LPC.EC.DCBD = One
                    }
                    Else
                    {
                        \MBEC (0x3A, 0xFF, 0x10)
                    }

                    WGFL |= 0x20
                }
                Else
                {
                    If (\H8DR)
                    {
                        \_SB.PCI0.LPC.EC.DCBD = Zero
                    }
                    Else
                    {
                        \MBEC (0x3A, 0xEF, 0x00)
                    }

                    WGFL &= ~0x20
                }
            }

            Method (WGIN, 0, NotSerialized)
            {
                WGFL = 0x00
                WGFL = \WGSV (0x01)
                If (\WIN8)
                {
                    If ((WGFL && 0x10))
                    {
                        BPWC (0x01)
                    }
                }

                If (WPWS ())
                {
                    WGFL |= 0x02
                }

                If (BPWS ())
                {
                    WGFL |= 0x20
                }
            }

            Method (WGPS, 1, NotSerialized)
            {
                If ((Arg0 >= 0x04))
                {
                    \BLTH (0x05)
                }
            }

            Method (WGWK, 1, NotSerialized)
            {
                If ((WGFL & 0x20))
                {
                    BPWC (0x01)
                }

                If ((WGFL & 0x02))
                {
                    WPWC (0x01)
                }
            }
        }

        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x7000)
                If (\WIN8)
                {
                    Notify (\_SB.PCI0.LPC.EC.WGSH, 0x80) // Status Change
                }
            }
        }

        Device (WMI1)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_WDG, Buffer (0xB4)
            {
                /* 0000 */  0x0E, 0x23, 0xF5, 0x51, 0x77, 0x96, 0xCD, 0x46,  // .#.Qw..F
                /* 0008 */  0xA1, 0xCF, 0xC0, 0xB2, 0x3E, 0xE3, 0x4D, 0xB7,  // ....>.M.
                /* 0010 */  0x41, 0x30, 0x50, 0x05, 0x64, 0x9A, 0x47, 0x98,  // A0P.d.G.
                /* 0018 */  0xF5, 0x33, 0x33, 0x4E, 0xA7, 0x07, 0x8E, 0x25,  // .33N...%
                /* 0020 */  0x1E, 0xBB, 0xC3, 0xA1, 0x41, 0x31, 0x01, 0x06,  // ....A1..
                /* 0028 */  0xEF, 0x54, 0x4B, 0x6A, 0xED, 0xA5, 0x33, 0x4D,  // .TKj..3M
                /* 0030 */  0x94, 0x55, 0xB0, 0xD9, 0xB4, 0x8D, 0xF4, 0xB3,  // .U......
                /* 0038 */  0x41, 0x32, 0x01, 0x06, 0xB6, 0xEB, 0xF1, 0x74,  // A2.....t
                /* 0040 */  0x7A, 0x92, 0x7D, 0x4C, 0x95, 0xDF, 0x69, 0x8E,  // z.}L..i.
                /* 0048 */  0x21, 0xE8, 0x0E, 0xB5, 0x41, 0x33, 0x01, 0x06,  // !...A3..
                /* 0050 */  0xFF, 0x04, 0xEF, 0x7E, 0x28, 0x43, 0x7C, 0x44,  // ...~(C|D
                /* 0058 */  0xB5, 0xBB, 0xD4, 0x49, 0x92, 0x5D, 0x53, 0x8D,  // ...I.]S.
                /* 0060 */  0x41, 0x34, 0x01, 0x06, 0x9E, 0x15, 0xDB, 0x8A,  // A4......
                /* 0068 */  0x32, 0x1E, 0x5C, 0x45, 0xBC, 0x93, 0x30, 0x8A,  // 2.\E..0.
                /* 0070 */  0x7E, 0xD9, 0x82, 0x46, 0x41, 0x35, 0x01, 0x01,  // ~..FA5..
                /* 0078 */  0xFD, 0xD9, 0x51, 0x26, 0x1C, 0x91, 0x69, 0x4B,  // ..Q&..iK
                /* 0080 */  0xB9, 0x4E, 0xD0, 0xDE, 0xD5, 0x96, 0x3B, 0xD7,  // .N....;.
                /* 0088 */  0x41, 0x36, 0x01, 0x06, 0x1A, 0x65, 0x64, 0x73,  // A6...eds
                /* 0090 */  0x2F, 0x13, 0xE7, 0x4F, 0xAD, 0xAA, 0x40, 0xC6,  // /..O..@.
                /* 0098 */  0xC7, 0xEE, 0x2E, 0x3B, 0x41, 0x37, 0x01, 0x06,  // ...;A7..
                /* 00A0 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 00A8 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 00B0 */  0x42, 0x41, 0x01, 0x00                           // BA..
            })
            Name (RETN, Package (0x05)
            {
                "Success", 
                "Not Supported", 
                "Invalid Parameter", 
                "Access Denied", 
                "System Busy"
            })
            Name (ITEM, Package (0x51)
            {
                Package (0x02)
                {
                    0x0E, 
                    "WakeOnLAN"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "EthernetLANOptionROM"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "USBBIOSSupport"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "AlwaysOnUSB"
                }, 

                Package (0x02)
                {
                    0x01, 
                    "TrackPoint"
                }, 

                Package (0x02)
                {
                    0x01, 
                    "TouchPad"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "FnKeyLock"
                }, 

                Package (0x02)
                {
                    0x04, 
                    "ThinkPadNumLock"
                }, 

                Package (0x02)
                {
                    0x0C, 
                    "PowerOnNumLock"
                }, 

                Package (0x02)
                {
                    0x05, 
                    "BootDisplayDevice"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "SpeedStep"
                }, 

                Package (0x02)
                {
                    0x09, 
                    "AdaptiveThermalManagementAC"
                }, 

                Package (0x02)
                {
                    0x09, 
                    "AdaptiveThermalManagementBattery"
                }, 

                Package (0x02)
                {
                    0x06, 
                    "CDROMSpeed"
                }, 

                Package (0x02)
                {
                    0x01, 
                    "CPUPowerManagement"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "PowerControlBeep"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "LowBatteryAlarm"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "PasswordBeep"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "KeyboardBeep"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "ExtendedMemoryTest"
                }, 

                Package (0x02)
                {
                    0x07, 
                    "SATAControllerMode"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "CoreMultiProcessing"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "VirtualizationTechnology"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "LockBIOSSetting"
                }, 

                Package (0x02)
                {
                    0x0B, 
                    "MinimumPasswordLength"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BIOSPasswordAtUnattendedBoot"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "FingerprintPredesktopAuthentication"
                }, 

                Package (0x02)
                {
                    0x08, 
                    "FingerprintReaderPriority"
                }, 

                Package (0x02)
                {
                    0x03, 
                    "FingerprintSecurityMode"
                }, 

                Package (0x02)
                {
                    0x02, 
                    "SecurityChip"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BIOSUpdateByEndUsers"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "DataExecutionPrevention"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "EthernetLANAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "WirelessLANAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "WirelessWANAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BluetoothAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "WirelessUSBAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "ModemAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "USBPortAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "IEEE1394Access"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "ExpressCardAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "PCIExpressSlotAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "UltrabayAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "MemoryCardSlotAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "SmartCardSlotAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "IntegratedCameraAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "MicrophoneAccess"
                }, 

                Package (0x02)
                {
                    0x0A, 
                    "BootMode"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "StartupOptionKeys"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BootDeviceListF12Option"
                }, 

                Package (0x02)
                {
                    0x64, 
                    "BootOrder"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "WiMAXAccess"
                }, 

                Package (0x02)
                {
                    0x0D, 
                    "GraphicsDevice"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "TXTFeature"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "VTdFeature"
                }, 

                Package (0x02)
                {
                    0x0F, 
                    "AMTControl"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "FingerprintPasswordAuthentication"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "FingerprintReaderAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "OsDetectionForSwitchableGraphics"
                }, 

                Package (0x02)
                {
                    0x0F, 
                    "ComputraceModuleActivation"
                }, 

                Package (0x02)
                {
                    0x01, 
                    "PCIExpressPowerManagement"
                }, 

                Package (0x02)
                {
                    0x0F, 
                    "ATpModuleActivation"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "eSATAPortAccess"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "HardwarePasswordManager"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "HyperThreadingTechnology"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "FnCtrlKeySwap"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BIOSPasswordAtReboot"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "OnByAcAttach"
                }, 

                Package (0x02)
                {
                    0x64, 
                    "NetworkBoot"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "BootOrderLock"
                }, 

                Package (0x02)
                {
                    0x10, 
                    "USB30Mode"
                }, 

                Package (0x02)
                {
                    0x11, 
                    "ExpressCardSpeed"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "RapidStartTechnology"
                }, 

                Package (0x02)
                {
                    0x12, 
                    "KeyboardIllumination"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "IPv4NetworkStack"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "IPv6NetworkStack"
                }, 

                Package (0x02)
                {
                    0x13, 
                    "UefiPxeBootPriority"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "PhysicalPresenceForTpmProvision"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "PhysicalPresenceForTpmClear"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "SecureRollBackPrevention"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "SecureBoot"
                }
            })
            Name (VSEL, Package (0x14)
            {
                Package (0x02)
                {
                    "Disable", 
                    "Enable"
                }, 

                Package (0x02)
                {
                    "Disable", 
                    "Automatic"
                }, 

                Package (0x03)
                {
                    "Active", 
                    "Inactive", 
                    "Disable"
                }, 

                Package (0x02)
                {
                    "Normal", 
                    "High"
                }, 

                Package (0x02)
                {
                    "Independent", 
                    "Synchronized"
                }, 

                Package (0x05)
                {
                    "LCD", 
                    "VGA", 
                    "Digital", 
                    "Digital1onDock", 
                    "Digital2onDock"
                }, 

                Package (0x03)
                {
                    "High", 
                    "Normal", 
                    "Silent"
                }, 

                Package (0x02)
                {
                    "Compatibility", 
                    "AHCI"
                }, 

                Package (0x02)
                {
                    "External", 
                    "InternalOnly"
                }, 

                Package (0x02)
                {
                    "MaximizePerformance", 
                    "Balanced"
                }, 

                Package (0x02)
                {
                    "Quick", 
                    "Diagnostics"
                }, 

                Package (0x0A)
                {
                    "Disable", 
                    "4", 
                    "5", 
                    "6", 
                    "7", 
                    "8", 
                    "9", 
                    "10", 
                    "11", 
                    "12"
                }, 

                Package (0x03)
                {
                    "Auto", 
                    "On", 
                    "Off"
                }, 

                Package (0x03)
                {
                    "IntegratedGfx", 
                    "DiscreteGfx", 
                    "SwitchableGfx"
                }, 

                Package (0x04)
                {
                    "Disable", 
                    "ACOnly", 
                    "ACandBattery", 
                    "Enable"
                }, 

                Package (0x03)
                {
                    "Disable", 
                    "Enable", 
                    "Disable"
                }, 

                Package (0x03)
                {
                    "Disable", 
                    "Enable", 
                    "Automatic"
                }, 

                Package (0x02)
                {
                    "Generation1", 
                    "Automatic"
                }, 

                Package (0x03)
                {
                    "ThinkLightOnly", 
                    "BacklightOnly", 
                    "Both"
                }, 

                Package (0x02)
                {
                    "IPv6First", 
                    "IPv4First"
                }
            })
            Name (VLST, Package (0x0F)
            {
                "HDD0", 
                "HDD1", 
                "HDD2", 
                "HDD3", 
                "HDD4", 
                "PCILAN", 
                "ATAPICD0", 
                "ATAPICD1", 
                "ATAPICD2", 
                "USBFDD", 
                "USBCD", 
                "USBHDD", 
                "OtherHDD", 
                "OtherCD", 
                "NODEV"
            })
            Name (PENC, Package (0x02)
            {
                "ascii", 
                "scancode"
            })
            Name (PKBD, Package (0x03)
            {
                "us", 
                "fr", 
                "gr"
            })
            Name (PTYP, Package (0x08)
            {
                "pap", 
                "pop", 
                "uhdp1", 
                "mhdp1", 
                "uhdp2", 
                "mhdp2", 
                "uhdp3", 
                "mhdp3"
            })
            Mutex (MWMI, 0x07)
            Name (PCFG, Buffer (0x18){})
            Name (IBUF, Buffer (0x0100){})
            Name (ILEN, 0x00)
            Name (PSTR, Buffer (0x81){})
            Method (WQA0, 1, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                If ((\WMIS (0x00, Arg0) != 0x00))
                {
                    Release (MWMI)
                    Return ("")
                }

                Local0 = DerefOf (ITEM [\WITM])
                Local1 = DerefOf (Local0 [0x00])
                Local2 = DerefOf (Local0 [0x01])
                If ((Local1 < 0x64))
                {
                    Concatenate (Local2, ",", Local6)
                    Local3 = DerefOf (VSEL [Local1])
                    Concatenate (Local6, DerefOf (Local3 [\WSEL]), Local7)
                }
                Else
                {
                    Local3 = SizeOf (VLST)
                    If ((\WLS0 <= Local3))
                    {
                        Concatenate (Local2, ",", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS0]), Local2)
                    }

                    If ((\WLS1 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS1]), Local2)
                    }

                    If ((\WLS2 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS2]), Local2)
                    }

                    If ((\WLS3 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS3]), Local2)
                    }

                    If ((\WLS4 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS4]), Local2)
                    }

                    If ((\WLS5 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS5]), Local2)
                    }

                    If ((\WLS6 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS6]), Local2)
                    }

                    If ((\WLS7 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS7]), Local2)
                    }

                    If ((\WLS8 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS8]), Local2)
                    }

                    If ((\WLS9 <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLS9]), Local2)
                    }

                    If ((\WLSA <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLSA]), Local2)
                    }

                    If ((\WLSB <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLSB]), Local2)
                    }

                    If ((\WLSC <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLSC]), Local2)
                    }

                    If ((\WLSD <= Local3))
                    {
                        Concatenate (Local2, ":", Local7)
                        Concatenate (Local7, DerefOf (VLST [\WLSD]), Local2)
                    }

                    Local7 = Local2
                }

                Release (MWMI)
                Return (Local7)
            }

            Method (WMA1, 3, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                If ((SizeOf (Arg2) == 0x00))
                {
                    Local0 = 0x02
                }
                Else
                {
                    Local0 = CARG (Arg2)
                    If ((Local0 == 0x00))
                    {
                        Local0 = WSET (ITEM, VSEL)
                        If ((Local0 == 0x00))
                        {
                            Local0 = \WMIS (0x01, 0x00)
                        }
                    }
                }

                Release (MWMI)
                Return (DerefOf (RETN [Local0]))
            }

            Method (WMA2, 3, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                Local0 = CARG (Arg2)
                If ((Local0 == 0x00))
                {
                    If ((ILEN != 0x00))
                    {
                        Local0 = CPAS (IBUF, 0x00)
                    }

                    If ((Local0 == 0x00))
                    {
                        Local0 = \WMIS (0x02, 0x00)
                    }
                }

                Release (MWMI)
                Return (DerefOf (RETN [Local0]))
            }

            Method (WMA3, 3, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                Local0 = CARG (Arg2)
                If ((Local0 == 0x00))
                {
                    If ((ILEN != 0x00))
                    {
                        Local0 = CPAS (IBUF, 0x00)
                    }

                    If ((Local0 == 0x00))
                    {
                        Local0 = \WMIS (0x03, 0x00)
                    }
                }

                Release (MWMI)
                Return (DerefOf (RETN [Local0]))
            }

            Method (WMA4, 3, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                Local0 = CARG (Arg2)
                If ((Local0 == 0x00))
                {
                    If ((ILEN != 0x00))
                    {
                        Local0 = CPAS (IBUF, 0x00)
                    }

                    If ((Local0 == 0x00))
                    {
                        Local0 = \WMIS (0x04, 0x00)
                    }
                }

                Release (MWMI)
                Return (DerefOf (RETN [Local0]))
            }

            Method (WQA5, 1, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                Local0 = \WMIS (0x05, 0x00)
                PCFG [0x00] = \WSPM
                PCFG [0x04] = \WSPS
                PCFG [0x08] = \WSMN
                PCFG [0x0C] = \WSMX
                PCFG [0x10] = \WSEN
                PCFG [0x14] = \WSKB
                Release (MWMI)
                Return (PCFG) /* \_SB_.WMI1.PCFG */
            }

            Method (WMA6, 3, NotSerialized)
            {
                Acquire (MWMI, 0xFFFF)
                If ((SizeOf (Arg2) == 0x00))
                {
                    Local0 = 0x02
                }
                Else
                {
                    Local0 = CARG (Arg2)
                    If ((Local0 == 0x00))
                    {
                        If ((ILEN != 0x00))
                        {
                            Local0 = SPAS (IBUF)
                        }

                        If ((Local0 == 0x00))
                        {
                            Local0 = \WMIS (0x06, 0x00)
                        }
                    }
                }

                Release (MWMI)
                Return (DerefOf (RETN [Local0]))
            }

            Method (WMA7, 3, NotSerialized)
            {
                If ((SizeOf (Arg2) == 0x00))
                {
                    Return ("")
                }

                Local0 = CARG (Arg2)
                If ((Local0 == 0x00))
                {
                    Local1 = GITM (IBUF, ITEM)
                    If ((Local1 == Ones))
                    {
                        Return ("")
                    }

                    Local0 = DerefOf (ITEM [Local1])
                    Local1 = DerefOf (Local0 [0x00])
                    If ((Local1 < 0x64))
                    {
                        Local3 = DerefOf (VSEL [Local1])
                        Local2 = DerefOf (Local3 [0x00])
                        Local4 = SizeOf (Local3)
                        Local5 = 0x01
                        While ((Local5 < Local4))
                        {
                            Local6 = DerefOf (Local3 [Local5])
                            If ((SizeOf (Local6) != 0x00))
                            {
                                Concatenate (Local2, ",", Local7)
                                Concatenate (Local7, Local6, Local2)
                            }

                            Local5++
                        }
                    }
                    Else
                    {
                        Local2 = DerefOf (VLST [0x00])
                        Local4 = SizeOf (VLST)
                        Local5 = 0x01
                        While ((Local5 < Local4))
                        {
                            Local6 = DerefOf (VLST [Local5])
                            Concatenate (Local2, ",", Local7)
                            Concatenate (Local7, Local6, Local2)
                            Local5++
                        }
                    }
                }

                Return (Local2)
            }

            Method (CARG, 1, NotSerialized)
            {
                Local0 = SizeOf (Arg0)
                If ((Local0 == 0x00))
                {
                    IBUF = 0x00
                    ILEN = 0x00
                    Return (0x00)
                }

                If ((ObjectType (Arg0) != 0x02))
                {
                    Return (0x02)
                }

                If ((Local0 >= 0xFF))
                {
                    Return (0x02)
                }

                IBUF = Arg0
                Local0--
                Local1 = DerefOf (IBUF [Local0])
                If (((Local1 == 0x3B) || (Local1 == 0x2A)))
                {
                    IBUF [Local0] = 0x00
                    ILEN = Local0
                }
                Else
                {
                    ILEN = SizeOf (Arg0)
                }

                Return (0x00)
            }

            Method (SCMP, 3, NotSerialized)
            {
                Local0 = SizeOf (Arg0)
                If ((Local0 == 0x00))
                {
                    Return (0x00)
                }

                Local0++
                Name (STR1, Buffer (Local0){})
                STR1 = Arg0
                Local0--
                Local1 = 0x00
                Local2 = Arg2
                While ((Local1 < Local0))
                {
                    Local3 = DerefOf (STR1 [Local1])
                    Local4 = DerefOf (Arg1 [Local2])
                    If ((Local3 != Local4))
                    {
                        Return (0x00)
                    }

                    Local1++
                    Local2++
                }

                Local4 = DerefOf (Arg1 [Local2])
                If ((Local4 == 0x00))
                {
                    Return (0x01)
                }

                If (((Local4 == 0x2C) || (Local4 == 0x3A)))
                {
                    Return (0x01)
                }

                Return (0x00)
            }

            Method (GITM, 2, NotSerialized)
            {
                Local0 = 0x00
                Local1 = SizeOf (Arg1)
                While ((Local0 < Local1))
                {
                    Local3 = DerefOf (DerefOf (Arg1 [Local0]) [0x01])
                    If (SCMP (Local3, Arg0, 0x00))
                    {
                        Return (Local0)
                    }

                    Local0++
                }

                Return (Ones)
            }

            Method (GSEL, 3, NotSerialized)
            {
                Local0 = 0x00
                Local1 = SizeOf (Arg0)
                While ((Local0 < Local1))
                {
                    Local2 = DerefOf (Arg0 [Local0])
                    If (SCMP (Local2, Arg1, Arg2))
                    {
                        Return (Local0)
                    }

                    Local0++
                }

                Return (Ones)
            }

            Method (SLEN, 2, NotSerialized)
            {
                Local0 = DerefOf (Arg0 [Arg1])
                Return (SizeOf (Local0))
            }

            Method (CLRP, 0, NotSerialized)
            {
                \WPAS = 0x00
                \WPNW = 0x00
            }

            Method (GPAS, 2, NotSerialized)
            {
                Local0 = Arg1
                Local1 = 0x00
                While ((Local1 <= 0x80))
                {
                    Local2 = DerefOf (Arg0 [Local0])
                    If (((Local2 == 0x2C) || (Local2 == 0x00)))
                    {
                        PSTR [Local1] = 0x00
                        Return (Local1)
                    }

                    PSTR [Local1] = Local2
                    Local0++
                    Local1++
                }

                PSTR [Local1] = 0x00
                Return (Ones)
            }

            Method (CPAS, 2, NotSerialized)
            {
                CLRP ()
                Local0 = Arg1
                Local1 = GPAS (Arg0, Local0)
                If ((Local1 == Ones))
                {
                    Return (0x02)
                }

                If ((Local1 == 0x00))
                {
                    Return (0x02)
                }

                \WPAS = PSTR /* \_SB_.WMI1.PSTR */
                Local0 += Local1
                Local0++
                Local6 = GSEL (PENC, Arg0, Local0)
                If ((Local6 == Ones))
                {
                    Return (0x02)
                }

                \WENC = Local6
                If ((Local6 == 0x00))
                {
                    Local0 += SLEN (PENC, 0x00)
                    If ((DerefOf (Arg0 [Local0]) != 0x2C))
                    {
                        Return (0x02)
                    }

                    Local0++
                    Local6 = GSEL (PKBD, Arg0, Local0)
                    If ((Local6 == Ones))
                    {
                        Return (0x02)
                    }

                    \WKBD = Local6
                }

                Return (0x00)
            }

            Method (SPAS, 1, NotSerialized)
            {
                CLRP ()
                Local6 = GSEL (PTYP, Arg0, 0x00)
                If ((Local6 == Ones))
                {
                    Return (0x02)
                }

                \WPTY = Local6
                Local0 = SLEN (PTYP, Local6)
                If ((DerefOf (Arg0 [Local0]) != 0x2C))
                {
                    Return (0x02)
                }

                Local0++
                Local1 = GPAS (Arg0, Local0)
                If (((Local1 == Ones) || (Local1 == 0x00)))
                {
                    Return (0x02)
                }

                \WPAS = PSTR /* \_SB_.WMI1.PSTR */
                Local0 += Local1
                If ((DerefOf (Arg0 [Local0]) != 0x2C))
                {
                    Return (0x02)
                }

                Local0++
                Local1 = GPAS (Arg0, Local0)
                If ((Local1 == Ones))
                {
                    Return (0x02)
                }

                If ((Local1 == 0x00))
                {
                    PSTR = 0x00
                }

                \WPNW = PSTR /* \_SB_.WMI1.PSTR */
                Local0 += Local1
                Local0++
                Local6 = GSEL (PENC, Arg0, Local0)
                If ((Local6 == Ones))
                {
                    Return (0x02)
                }

                \WENC = Local6
                If ((Local6 == 0x00))
                {
                    Local0 += SLEN (PENC, 0x00)
                    If ((DerefOf (Arg0 [Local0]) != 0x2C))
                    {
                        Return (0x02)
                    }

                    Local0++
                    Local6 = GSEL (PKBD, Arg0, Local0)
                    If ((Local6 == Ones))
                    {
                        Return (0x02)
                    }

                    \WKBD = Local6
                }

                Return (0x00)
            }

            Method (WSET, 2, NotSerialized)
            {
                Local0 = ILEN /* \_SB_.WMI1.ILEN */
                Local0++
                Local1 = GITM (IBUF, Arg0)
                If ((Local1 == Ones))
                {
                    Return (0x02)
                }

                \WITM = Local1
                Local3 = DerefOf (Arg0 [Local1])
                Local4 = DerefOf (Local3 [0x01])
                Local2 = SizeOf (Local4)
                Local2++
                Local4 = DerefOf (Local3 [0x00])
                If ((Local4 < 0x64))
                {
                    Local5 = DerefOf (Arg1 [Local4])
                    Local6 = GSEL (Local5, IBUF, Local2)
                    If ((Local6 == Ones))
                    {
                        Return (0x02)
                    }

                    \WSEL = Local6
                    Local2 += SLEN (Local5, Local6)
                    Local4 = DerefOf (IBUF [Local2])
                }
                Else
                {
                    \WLS0 = 0x3F
                    \WLS1 = 0x3F
                    \WLS2 = 0x3F
                    \WLS3 = 0x3F
                    \WLS4 = 0x3F
                    \WLS5 = 0x3F
                    \WLS6 = 0x3F
                    \WLS7 = 0x3F
                    \WLS8 = 0x3F
                    \WLS9 = 0x3F
                    \WLSA = 0x3F
                    \WLSB = 0x3F
                    \WLSC = 0x3F
                    \WLSD = 0x3F
                    Local6 = GSEL (VLST, IBUF, Local2)
                    If ((Local6 == Ones))
                    {
                        Return (0x02)
                    }

                    \WLS0 = Local6
                    Local2 += SLEN (VLST, Local6)
                    Local4 = DerefOf (IBUF [Local2])
                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS1 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS2 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS3 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS4 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS5 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS6 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS7 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS8 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLS9 = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLSA = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLSB = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLSC = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }

                    If (((Local2 < Local0) && (Local4 == 0x3A)))
                    {
                        Local2++
                        Local6 = GSEL (VLST, IBUF, Local2)
                        If ((Local6 == Ones))
                        {
                            Return (0x02)
                        }

                        \WLSD = Local6
                        Local2 += SLEN (VLST, Local6)
                        Local4 = DerefOf (IBUF [Local2])
                    }
                }

                If (((Local4 == 0x2C) && (Local2 < Local0)))
                {
                    Local2++
                    Local0 = CPAS (IBUF, Local2)
                    If ((Local0 != 0x00))
                    {
                        Return (Local0)
                    }
                }

                Return (0x00)
            }

            Name (WQBA, Buffer (0x089D)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0x8D, 0x08, 0x00, 0x00, 0xF2, 0x36, 0x00, 0x00,  // .....6..
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0xC9, 0x9A, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x13, 0x10, 0x0A, 0x0D, 0x21, 0x02, 0x0B,  // .....!..
                /* 0028 */  0x83, 0x50, 0x4C, 0x18, 0x14, 0xA0, 0x45, 0x41,  // .PL...EA
                /* 0030 */  0xC8, 0x05, 0x14, 0x95, 0x02, 0x21, 0xC3, 0x02,  // .....!..
                /* 0038 */  0x14, 0x0B, 0x70, 0x2E, 0x40, 0xBA, 0x00, 0xE5,  // ..p.@...
                /* 0040 */  0x28, 0x72, 0x0C, 0x22, 0x02, 0xF7, 0xEF, 0x0F,  // (r."....
                /* 0048 */  0x31, 0x0E, 0x88, 0x14, 0x40, 0x48, 0x26, 0x84,  // 1...@H&.
                /* 0050 */  0x44, 0x00, 0x53, 0x21, 0x70, 0x84, 0xA0, 0x5F,  // D.S!p.._
                /* 0058 */  0x01, 0x08, 0x1D, 0xA2, 0xC9, 0xA0, 0x00, 0xA7,  // ........
                /* 0060 */  0x08, 0x82, 0xB4, 0x65, 0x01, 0xBA, 0x05, 0xF8,  // ...e....
                /* 0068 */  0x16, 0xA0, 0x1D, 0x42, 0x68, 0x15, 0x0A, 0x30,  // ...Bh..0
                /* 0070 */  0x29, 0xC0, 0x27, 0x98, 0x2C, 0x0A, 0x90, 0x0D,  // ).'.,...
                /* 0078 */  0x26, 0xDB, 0x70, 0x64, 0x18, 0x4C, 0xE4, 0x18,  // &.pd.L..
                /* 0080 */  0x50, 0x62, 0xC6, 0x80, 0xD2, 0x39, 0x05, 0xD9,  // Pb...9..
                /* 0088 */  0x04, 0x16, 0x74, 0xA1, 0x28, 0x9A, 0x46, 0x94,  // ..t.(.F.
                /* 0090 */  0x04, 0x07, 0x75, 0x0C, 0x11, 0x82, 0x97, 0x2B,  // ..u....+
                /* 0098 */  0x40, 0xF2, 0x04, 0xA4, 0x79, 0x5E, 0xB2, 0x3E,  // @...y^.>
                /* 00A0 */  0x08, 0x0D, 0x81, 0x8D, 0x80, 0x47, 0x91, 0x00,  // .....G..
                /* 00A8 */  0xC2, 0x62, 0x2C, 0x53, 0xE2, 0x61, 0x50, 0x1E,  // .b,S.aP.
                /* 00B0 */  0x40, 0x24, 0x67, 0xA8, 0x28, 0x60, 0x7B, 0x9D,  // @$g.(`{.
                /* 00B8 */  0x88, 0x86, 0x75, 0x9C, 0x4C, 0x12, 0x1C, 0x6A,  // ..u.L..j
                /* 00C0 */  0x94, 0x96, 0x28, 0xC0, 0xFC, 0xC8, 0x34, 0x91,  // ..(...4.
                /* 00C8 */  0x63, 0x6B, 0x7A, 0xC4, 0x82, 0x64, 0xD2, 0x86,  // ckz..d..
                /* 00D0 */  0x82, 0x1A, 0xBA, 0xA7, 0x75, 0x52, 0x9E, 0x68,  // ....uR.h
                /* 00D8 */  0xC4, 0x83, 0x32, 0x4C, 0x02, 0x8F, 0x82, 0xA1,  // ..2L....
                /* 00E0 */  0x71, 0x82, 0xB2, 0x20, 0xE4, 0x60, 0xA0, 0x28,  // q.. .`.(
                /* 00E8 */  0xC0, 0x93, 0xF0, 0x1C, 0x8B, 0x17, 0x20, 0x7C,  // ...... |
                /* 00F0 */  0xC6, 0xE4, 0x28, 0x10, 0x23, 0x81, 0x8F, 0x04,  // ..(.#...
                /* 00F8 */  0x1E, 0xCD, 0x31, 0x63, 0x81, 0xC2, 0x05, 0x3C,  // ..1c...<
                /* 0100 */  0x9F, 0x63, 0x88, 0x1C, 0xF7, 0x50, 0x63, 0x1C,  // .c...Pc.
                /* 0108 */  0x45, 0xE4, 0x04, 0xEF, 0x00, 0x51, 0x8C, 0x56,  // E....Q.V
                /* 0110 */  0xD0, 0xBC, 0x85, 0x18, 0x2C, 0x9A, 0xC1, 0x7A,  // ....,..z
                /* 0118 */  0x06, 0x27, 0x83, 0x4E, 0xF0, 0xFF, 0x3F, 0x02,  // .'.N..?.
                /* 0120 */  0x2E, 0x03, 0x42, 0x1E, 0x05, 0x58, 0x1D, 0x94,  // ..B..X..
                /* 0128 */  0xA6, 0x61, 0x82, 0xEE, 0x05, 0xBC, 0x1A, 0x1A,  // .a......
                /* 0130 */  0x13, 0xA0, 0x11, 0x43, 0xCA, 0x04, 0x38, 0xBB,  // ...C..8.
                /* 0138 */  0x2F, 0x68, 0x46, 0x6D, 0x09, 0x30, 0x27, 0x40,  // /hFm.0'@
                /* 0140 */  0x9B, 0x00, 0x6F, 0x08, 0x42, 0x39, 0xCF, 0x28,  // ..o.B9.(
                /* 0148 */  0xC7, 0x72, 0x8A, 0x51, 0x1E, 0x06, 0x62, 0xBE,  // .r.Q..b.
                /* 0150 */  0x0C, 0x04, 0x8D, 0x12, 0x23, 0xE6, 0xB9, 0xC4,  // ....#...
                /* 0158 */  0x35, 0x6C, 0x84, 0x18, 0x21, 0x4F, 0x21, 0x50,  // 5l..!O!P
                /* 0160 */  0xDC, 0xF6, 0x07, 0x41, 0x06, 0x8D, 0x1B, 0xBD,  // ...A....
                /* 0168 */  0x4F, 0x0B, 0x67, 0x75, 0x02, 0x47, 0xFF, 0xA4,  // O.gu.G..
                /* 0170 */  0x60, 0x02, 0x4F, 0xF9, 0xC0, 0x9E, 0x0D, 0x4E,  // `.O....N
                /* 0178 */  0xE0, 0x58, 0xA3, 0xC6, 0x38, 0x95, 0x04, 0x8E,  // .X..8...
                /* 0180 */  0xFD, 0x80, 0x90, 0x06, 0x10, 0x45, 0x82, 0x47,  // .....E.G
                /* 0188 */  0x9D, 0x16, 0x7C, 0x2E, 0xF0, 0xD0, 0x0E, 0xDA,  // ..|.....
                /* 0190 */  0x73, 0x3C, 0x81, 0x20, 0x87, 0x70, 0x04, 0x4F,  // s<. .p.O
                /* 0198 */  0x0C, 0x0F, 0x04, 0x1E, 0x03, 0xBB, 0x29, 0xF8,  // ......).
                /* 01A0 */  0x08, 0xE0, 0x13, 0x02, 0xDE, 0x35, 0xA0, 0xAE,  // .....5..
                /* 01A8 */  0x06, 0x0F, 0x06, 0x6C, 0xD0, 0xE1, 0x30, 0xE3,  // ...l..0.
                /* 01B0 */  0xF5, 0xF0, 0xC3, 0x9D, 0xC0, 0x49, 0x3E, 0x60,  // .....I>`
                /* 01B8 */  0xF0, 0xC3, 0x86, 0x07, 0x87, 0x9B, 0xE7, 0xC9,  // ........
                /* 01C0 */  0x1C, 0x59, 0xA9, 0x02, 0xCC, 0x1E, 0x0E, 0x74,  // .Y.....t
                /* 01C8 */  0x90, 0xF0, 0x69, 0x83, 0x9D, 0x01, 0x30, 0xF2,  // ..i...0.
                /* 01D0 */  0x07, 0x81, 0x1A, 0x99, 0xA1, 0x3D, 0xEE, 0x97,  // .....=..
                /* 01D8 */  0x0E, 0x43, 0x3E, 0x27, 0x1C, 0x16, 0x13, 0x7B,  // .C>'...{
                /* 01E0 */  0xEA, 0xA0, 0xE3, 0x01, 0xFF, 0x65, 0xE4, 0x39,  // .....e.9
                /* 01E8 */  0xC3, 0xD3, 0xF7, 0x7C, 0x4D, 0x30, 0xEC, 0xC0,  // ...|M0..
                /* 01F0 */  0xD1, 0x03, 0x31, 0xF4, 0xC3, 0xC6, 0x61, 0x9C,  // ..1...a.
                /* 01F8 */  0x86, 0xEF, 0x1F, 0x3E, 0x2F, 0xC0, 0x38, 0x05,  // ...>/.8.
                /* 0200 */  0x78, 0xE4, 0xFE, 0xFF, 0x1F, 0x52, 0x7C, 0x9A,  // x....R|.
                /* 0208 */  0xE0, 0x47, 0x0B, 0x9F, 0x26, 0xD8, 0xF5, 0xE0,  // .G..&...
                /* 0210 */  0x34, 0x9E, 0x03, 0x3C, 0x9C, 0xB3, 0xF2, 0x61,  // 4..<...a
                /* 0218 */  0x02, 0x6C, 0xF7, 0x13, 0x36, 0xA2, 0x77, 0x0B,  // .l..6.w.
                /* 0220 */  0x8F, 0x06, 0x7B, 0x0A, 0x00, 0xDF, 0xF9, 0x05,  // ..{.....
                /* 0228 */  0x9C, 0x77, 0x0D, 0x36, 0x58, 0x18, 0xE7, 0x17,  // .w.6X...
                /* 0230 */  0xE0, 0x71, 0x42, 0xF0, 0x10, 0xF8, 0x41, 0xC2,  // .qB...A.
                /* 0238 */  0x43, 0xE0, 0x03, 0x78, 0xFE, 0x38, 0x43, 0x2B,  // C..x.8C+
                /* 0240 */  0x9D, 0x17, 0x72, 0x60, 0xF0, 0xCE, 0x39, 0x30,  // ..r`..90
                /* 0248 */  0x46, 0xC1, 0xF3, 0x3C, 0x36, 0x4C, 0xA0, 0x20,  // F..<6L. 
                /* 0250 */  0xAF, 0x01, 0x85, 0x7A, 0x16, 0x50, 0x18, 0x9F,  // ...z.P..
                /* 0258 */  0x6A, 0x80, 0xD7, 0xFF, 0xFF, 0x54, 0x03, 0x5C,  // j....T.\
                /* 0260 */  0x0E, 0x07, 0xB8, 0x93, 0x03, 0xDC, 0x7B, 0x01,  // ......{.
                /* 0268 */  0xBB, 0x38, 0x3C, 0xD7, 0xC0, 0x15, 0x7D, 0xAE,  // .8<...}.
                /* 0270 */  0x81, 0x7A, 0x6F, 0x29, 0x6E, 0x8C, 0xBA, 0xC6,  // .zo)n...
                /* 0278 */  0x04, 0x79, 0x14, 0x78, 0xA4, 0x89, 0xF2, 0x3C,  // .y.x...<
                /* 0280 */  0xF3, 0x2E, 0x13, 0xE1, 0xD9, 0xC6, 0xD7, 0x1A,  // ........
                /* 0288 */  0x4F, 0x21, 0x8E, 0xAF, 0x35, 0x46, 0x7C, 0x99,  // O!..5F|.
                /* 0290 */  0x78, 0xB7, 0x31, 0xEE, 0xC1, 0x3D, 0xD6, 0x3C,  // x.1..=.<
                /* 0298 */  0xE4, 0x18, 0xE4, 0x68, 0x22, 0xBC, 0x18, 0x04,  // ...h"...
                /* 02A0 */  0x7C, 0xBC, 0xF1, 0xB1, 0x06, 0xBC, 0x62, 0x5E,  // |.....b^
                /* 02A8 */  0x28, 0xB2, 0x70, 0xAC, 0x01, 0x34, 0xFE, 0xFF,  // (.p..4..
                /* 02B0 */  0x8F, 0x35, 0xC0, 0x0D, 0xEB, 0x01, 0x05, 0x7C,  // .5.....|
                /* 02B8 */  0x47, 0x06, 0x76, 0x43, 0x81, 0x77, 0x42, 0x01,  // G.vC.wB.
                /* 02C0 */  0xFC, 0x24, 0x7E, 0x01, 0xE8, 0xC8, 0xE1, 0xB4,  // .$~.....
                /* 02C8 */  0x20, 0xB2, 0xF1, 0x06, 0xF0, 0x29, 0x80, 0xAA,  //  ....)..
                /* 02D0 */  0x01, 0xD2, 0x34, 0x61, 0x13, 0x4C, 0x4F, 0x2E,  // ..4a.LO.
                /* 02D8 */  0x78, 0x1F, 0x09, 0x9C, 0x9B, 0x44, 0xC9, 0x87,  // x....D..
                /* 02E0 */  0x45, 0xE1, 0x9C, 0xF5, 0x20, 0x42, 0x41, 0x0C,  // E... BA.
                /* 02E8 */  0xE8, 0x20, 0xC7, 0x09, 0xF4, 0x19, 0xC5, 0x07,  // . ......
                /* 02F0 */  0x91, 0x13, 0x7D, 0x22, 0xF4, 0xA0, 0x3C, 0x8C,  // ..}"..<.
                /* 02F8 */  0x77, 0x14, 0x76, 0x02, 0xF1, 0x61, 0xC2, 0x63,  // w.v..a.c
                /* 0300 */  0xF7, 0x31, 0x81, 0xFF, 0x63, 0x3C, 0x1B, 0xA3,  // .1..c<..
                /* 0308 */  0x5B, 0x0D, 0x86, 0xFE, 0xFF, 0xE7, 0x14, 0x0E,  // [.......
                /* 0310 */  0xE6, 0x83, 0x08, 0x27, 0xA8, 0xEB, 0x26, 0x01,  // ...'..&.
                /* 0318 */  0x32, 0x7D, 0x47, 0x05, 0x50, 0x00, 0xF9, 0x5E,  // 2}G.P..^
                /* 0320 */  0xE0, 0x73, 0xC0, 0xB3, 0x01, 0x1B, 0xC3, 0xA3,  // .s......
                /* 0328 */  0x80, 0xD1, 0x8C, 0xCE, 0xC3, 0x4F, 0x16, 0x15,  // .....O..
                /* 0330 */  0x77, 0xB2, 0x14, 0xC4, 0x93, 0x75, 0x94, 0xC9,  // w....u..
                /* 0338 */  0xA2, 0x67, 0xE2, 0x7B, 0x85, 0x67, 0xF4, 0xA6,  // .g.{.g..
                /* 0340 */  0xE5, 0x39, 0x7A, 0xC2, 0xBE, 0x87, 0xC0, 0x3A,  // .9z....:
                /* 0348 */  0x0C, 0x84, 0x7C, 0x30, 0xF0, 0x34, 0x0C, 0xE7,  // ..|0.4..
                /* 0350 */  0xC9, 0x72, 0x38, 0x4F, 0x96, 0x8F, 0xC5, 0xD7,  // .r8O....
                /* 0358 */  0x10, 0xF0, 0x09, 0x9C, 0x2D, 0xC8, 0xE1, 0x31,  // ....-..1
                /* 0360 */  0xB1, 0x46, 0x45, 0xAF, 0x42, 0x1E, 0x1E, 0xBF,  // .FE.B...
                /* 0368 */  0x1C, 0x78, 0x3E, 0xCF, 0x08, 0x47, 0xF9, 0x24,  // .x>..G.$
                /* 0370 */  0x81, 0xC3, 0x78, 0x26, 0xF1, 0x10, 0x7D, 0x2B,  // ..x&..}+
                /* 0378 */  0x82, 0x35, 0x91, 0x93, 0xF6, 0x6D, 0xE1, 0x64,  // .5...m.d
                /* 0380 */  0x83, 0xBE, 0x9E, 0x61, 0x6E, 0x45, 0xB0, 0xFF,  // ...anE..
                /* 0388 */  0xFF, 0xB7, 0x22, 0x38, 0x17, 0x34, 0x98, 0x99,  // .."8.4..
                /* 0390 */  0xEE, 0x55, 0xA8, 0x58, 0xF7, 0x2A, 0x40, 0xEC,  // .U.X.*@.
                /* 0398 */  0xB0, 0x5E, 0x7B, 0x7C, 0xB0, 0x82, 0x7B, 0xAF,  // .^{|..{.
                /* 03A0 */  0x82, 0x7B, 0xA9, 0x7A, 0x56, 0x38, 0xC6, 0xF0,  // .{.zV8..
                /* 03A8 */  0x0F, 0x53, 0x31, 0x4E, 0xE9, 0xB5, 0xD3, 0x40,  // .S1N...@
                /* 03B0 */  0x61, 0xA2, 0xC4, 0x7B, 0xAF, 0xF2, 0x18, 0xDF,  // a..{....
                /* 03B8 */  0xAB, 0xD8, 0x15, 0x2A, 0x4C, 0xAC, 0x97, 0x2B,  // ...*L..+
                /* 03C0 */  0xA3, 0xBE, 0x4E, 0x84, 0x0B, 0x14, 0x24, 0xD2,  // ..N...$.
                /* 03C8 */  0xAB, 0x55, 0x94, 0xC8, 0xF1, 0x0D, 0xF9, 0x5E,  // .U.....^
                /* 03D0 */  0x05, 0x5E, 0x39, 0xF7, 0x2A, 0x90, 0xFD, 0xFF,  // .^9.*...
                /* 03D8 */  0xEF, 0x55, 0x80, 0x79, 0xB4, 0xF7, 0x2A, 0x30,  // .U.y..*0
                /* 03E0 */  0x5E, 0x1B, 0xD8, 0x0D, 0x09, 0x16, 0xD0, 0x8B,  // ^.......
                /* 03E8 */  0x15, 0x60, 0x28, 0xF3, 0xC5, 0x8A, 0xE6, 0xBD,  // .`(.....
                /* 03F0 */  0x58, 0x21, 0xFE, 0xFF, 0xE7, 0x12, 0xA6, 0xE7,  // X!......
                /* 03F8 */  0x62, 0x45, 0xE6, 0x09, 0xFF, 0x66, 0x05, 0x70,  // bE...f.p
                /* 0400 */  0xFA, 0xFF, 0x7F, 0xB3, 0x02, 0x8C, 0xDD, 0x8B,  // ........
                /* 0408 */  0x30, 0x47, 0x2B, 0x78, 0x29, 0x6F, 0x56, 0x34,  // 0G+x)oV4
                /* 0410 */  0xCE, 0x32, 0x14, 0x70, 0x41, 0x14, 0xC6, 0x37,  // .2.pA..7
                /* 0418 */  0x2B, 0xC0, 0xD1, 0x75, 0x05, 0x37, 0x64, 0xB8,  // +..u.7d.
                /* 0420 */  0x60, 0x51, 0x82, 0xF9, 0x10, 0xE2, 0xE9, 0x1C,  // `Q......
                /* 0428 */  0xF1, 0x43, 0xC2, 0x4B, 0xC0, 0x63, 0x8E, 0x07,  // .C.K.c..
                /* 0430 */  0xFC, 0x40, 0xE0, 0xCB, 0x15, 0x98, 0xFE, 0xFF,  // .@......
                /* 0438 */  0x04, 0x3E, 0xF9, 0x9E, 0xE5, 0xDB, 0xD4, 0x7B,  // .>.....{
                /* 0440 */  0x2F, 0x3F, 0x60, 0xBD, 0x57, 0xF9, 0xF0, 0x1B,  // /?`.W...
                /* 0448 */  0xEB, 0x9D, 0xE1, 0xE5, 0xCA, 0x23, 0x89, 0x72,  // .....#.r
                /* 0450 */  0x12, 0xA1, 0x7C, 0xB7, 0x7A, 0xAF, 0x32, 0x4A,  // ..|.z.2J
                /* 0458 */  0xC4, 0x17, 0x62, 0x9F, 0x82, 0x0D, 0x6D, 0x94,  // ..b...m.
                /* 0460 */  0xA7, 0x8A, 0xE8, 0xC6, 0x7B, 0xB9, 0x02, 0xAF,  // ....{...
                /* 0468 */  0xA4, 0xCB, 0x15, 0x40, 0x93, 0xE1, 0xBF, 0x5C,  // ...@...\
                /* 0470 */  0x81, 0xEF, 0xE6, 0x80, 0xBD, 0x26, 0xC1, 0xF9,  // .....&..
                /* 0478 */  0xFF, 0x5F, 0x93, 0xF8, 0xF5, 0x0A, 0xF0, 0x93,  // ._......
                /* 0480 */  0xFD, 0x7A, 0x45, 0x73, 0x5F, 0xAF, 0x50, 0xA2,  // .zEs_.P.
                /* 0488 */  0x20, 0xA4, 0x08, 0x48, 0x33, 0x05, 0xCF, 0xFD,  //  ..H3...
                /* 0490 */  0x0A, 0xE0, 0xC4, 0xFF, 0xFF, 0x7E, 0x05, 0x58,  // .....~.X
                /* 0498 */  0x0E, 0x77, 0xBF, 0x02, 0x7A, 0xB7, 0x23, 0xF0,  // .w..z.#.
                /* 04A0 */  0xA2, 0xBC, 0x1D, 0x61, 0xAF, 0x58, 0xF8, 0x8C,  // ...a.X..
                /* 04A8 */  0x57, 0x2C, 0x1A, 0x66, 0x25, 0x8A, 0xB7, 0x26,  // W,.f%..&
                /* 04B0 */  0x0A, 0xE3, 0x2B, 0x16, 0x30, 0xF9, 0xFF, 0x5F,  // ..+.0.._
                /* 04B8 */  0xB1, 0x80, 0xD9, 0x41, 0x14, 0x37, 0x6A, 0xB8,  // ...A.7j.
                /* 04C0 */  0x17, 0x27, 0xDF, 0x7A, 0x3C, 0xDF, 0x88, 0xBE,  // .'.z<...
                /* 04C8 */  0xC3, 0x60, 0x4E, 0x58, 0x30, 0x6E, 0x58, 0xF0,  // .`NX0nX.
                /* 04D0 */  0x87, 0xF4, 0x30, 0xEC, 0x93, 0xC4, 0x3B, 0x96,  // ..0...;.
                /* 04D8 */  0x8F, 0x56, 0x06, 0x79, 0x03, 0x7E, 0xB2, 0x7A,  // .V.y.~.z
                /* 04E0 */  0xB0, 0x8A, 0x62, 0x84, 0x80, 0xC7, 0xF3, 0x2E,  // ..b.....
                /* 04E8 */  0xEC, 0xA3, 0xD5, 0x9B, 0x96, 0x51, 0x62, 0xC7,  // .....Qb.
                /* 04F0 */  0xF2, 0x85, 0xEA, 0x59, 0xCB, 0xD7, 0x2C, 0x43,  // ...Y..,C
                /* 04F8 */  0xC4, 0x7D, 0x20, 0xF6, 0x0D, 0x0B, 0xB0, 0xFD,  // .} .....
                /* 0500 */  0xFF, 0xBF, 0x61, 0x01, 0x8E, 0x2E, 0x0E, 0xFC,  // ..a.....
                /* 0508 */  0xE0, 0x80, 0xBD, 0x61, 0x01, 0x3E, 0x67, 0x0A,  // ...a.>g.
                /* 0510 */  0x9E, 0x1B, 0x16, 0xB0, 0xF9, 0xFF, 0xDF, 0xB0,  // ........
                /* 0518 */  0x00, 0xFE, 0xFF, 0xFF, 0x6F, 0x58, 0xC0, 0xE1,  // ....oX..
                /* 0520 */  0x76, 0x85, 0xBD, 0x65, 0x61, 0x6F, 0x2F, 0x64,  // v..eao/d
                /* 0528 */  0x15, 0x34, 0xD4, 0x4A, 0x14, 0xFC, 0x7B, 0x65,  // .4.J..{e
                /* 0530 */  0x18, 0x7A, 0xC3, 0x02, 0x1C, 0x8D, 0xDB, 0xA3,  // .z......
                /* 0538 */  0x06, 0xC7, 0xD9, 0xE0, 0x49, 0x02, 0x73, 0xAE,  // ....I.s.
                /* 0540 */  0xC6, 0xCD, 0xE6, 0xE0, 0x02, 0x47, 0xE8, 0x1D,  // .....G..
                /* 0548 */  0x54, 0x73, 0x67, 0x97, 0x14, 0x18, 0xB7, 0x2C,  // Tsg....,
                /* 0550 */  0xB8, 0x97, 0xAA, 0x87, 0x86, 0x28, 0x07, 0xF1,  // .....(..
                /* 0558 */  0x2A, 0xFC, 0x60, 0xF5, 0x28, 0x75, 0x64, 0x8F,  // *.`.(ud.
                /* 0560 */  0x57, 0x4F, 0xC3, 0x3E, 0x66, 0xF9, 0x96, 0x65,  // WO.>f..e
                /* 0568 */  0xA8, 0x08, 0x6F, 0x59, 0xEC, 0x0C, 0x11, 0x2F,  // ..oY.../
                /* 0570 */  0x56, 0x94, 0x10, 0xEF, 0x15, 0xA1, 0x7D, 0xE7,  // V.....}.
                /* 0578 */  0x32, 0xF8, 0xA3, 0xB1, 0x51, 0x83, 0xBE, 0x1C,  // 2...Q...
                /* 0580 */  0xBF, 0x65, 0xC1, 0xFB, 0xFF, 0xDF, 0xB2, 0xE0,  // .e......
                /* 0588 */  0x8B, 0xFC, 0xAB, 0xE8, 0x44, 0xE0, 0x5B, 0x16,  // ....D.[.
                /* 0590 */  0xC0, 0x8F, 0x60, 0x10, 0x72, 0x32, 0x70, 0xF4,  // ..`.r2p.
                /* 0598 */  0x79, 0x01, 0x3F, 0x80, 0x87, 0x11, 0x0F, 0x89,  // y.?.....
                /* 05A0 */  0x05, 0x18, 0x38, 0xBD, 0x2F, 0xF9, 0x4C, 0xC1,  // ..8./.L.
                /* 05A8 */  0x0F, 0x18, 0x3E, 0x53, 0xB0, 0xEB, 0x41, 0xF4,  // ..>S..A.
                /* 05B0 */  0xC7, 0x00, 0x9F, 0x4B, 0x30, 0x83, 0x03, 0xFF,  // ...K0...
                /* 05B8 */  0xB5, 0xE2, 0xD0, 0x3D, 0x8A, 0xD7, 0x07, 0x13,  // ...=....
                /* 05C0 */  0x78, 0x70, 0xFC, 0xFF, 0x3F, 0x38, 0xB8, 0x77,  // xp..?8.w
                /* 05C8 */  0x86, 0x23, 0xF2, 0x1D, 0xC6, 0x83, 0x03, 0xDB,  // .#......
                /* 05D0 */  0x41, 0x00, 0x38, 0x0C, 0x0E, 0x1F, 0x6A, 0x70,  // A.8...jp
                /* 05D8 */  0xE8, 0xF1, 0x18, 0x38, 0xA4, 0xCF, 0x63, 0xEC,  // ...8..c.
                /* 05E0 */  0xC2, 0xF0, 0x90, 0xE3, 0xA1, 0x81, 0x0D, 0xD0,  // ........
                /* 05E8 */  0x43, 0x03, 0x96, 0x93, 0x78, 0x0A, 0x39, 0x34,  // C...x.94
                /* 05F0 */  0x30, 0x4B, 0x18, 0x1A, 0x50, 0x8A, 0x37, 0x34,  // 0K..P.74
                /* 05F8 */  0xFA, 0xFF, 0x1F, 0x1A, 0x1F, 0x92, 0x0F, 0x0B,  // ........
                /* 0600 */  0x31, 0x9F, 0x72, 0x22, 0xBC, 0x2F, 0xF8, 0x04,  // 1.r"./..
                /* 0608 */  0xC5, 0xD0, 0x5F, 0x53, 0x7C, 0xBB, 0xF0, 0x4D,  // .._S|..M
                /* 0610 */  0x10, 0x37, 0x3E, 0x70, 0x5D, 0x3A, 0x3D, 0x3E,  // .7>p]:=>
                /* 0618 */  0xE0, 0x73, 0xE4, 0xF2, 0xF8, 0x70, 0x47, 0x27,  // .s...pG'
                /* 0620 */  0x8F, 0x0F, 0x86, 0xCB, 0xAB, 0x0C, 0x39, 0x9A,  // ......9.
                /* 0628 */  0xF8, 0x68, 0xC5, 0x86, 0x07, 0xB6, 0x9B, 0x9E,  // .h......
                /* 0630 */  0x87, 0x07, 0x7C, 0xAE, 0x9B, 0x60, 0xBC, 0x42,  // ..|..`.B
                /* 0638 */  0xF2, 0x6B, 0x09, 0x8C, 0x13, 0x14, 0xFE, 0xBA,  // .k......
                /* 0640 */  0x09, 0xDE, 0xFF, 0xFF, 0x75, 0x13, 0x78, 0x8E,  // ....u.x.
                /* 0648 */  0x82, 0x6B, 0xBD, 0x64, 0xD3, 0x20, 0xAF, 0x1C,  // .k.d. ..
                /* 0650 */  0xC5, 0x7A, 0x11, 0x50, 0x18, 0x9F, 0xD9, 0x00,  // .z.P....
                /* 0658 */  0x47, 0x63, 0x7D, 0x66, 0x03, 0xCB, 0xBD, 0x80,  // Gc}f....
                /* 0660 */  0xDD, 0xD8, 0xE0, 0x9E, 0xD6, 0x60, 0xDF, 0x1D,  // .....`..
                /* 0668 */  0x1E, 0xCE, 0x1E, 0xD3, 0x1E, 0xD5, 0x1E, 0xD0,  // ........
                /* 0670 */  0x7C, 0xC4, 0x8E, 0xF1, 0x96, 0x16, 0x24, 0x4E,  // |.....$N
                /* 0678 */  0x84, 0xD7, 0x81, 0xA7, 0x35, 0x5F, 0x32, 0xE2,  // ....5_2.
                /* 0680 */  0x05, 0x7A, 0x5A, 0x33, 0x46, 0x9C, 0x97, 0x36,  // .zZ3F..6
                /* 0688 */  0x23, 0xBE, 0x52, 0x84, 0x78, 0x58, 0xF3, 0xC9,  // #.R.xX..
                /* 0690 */  0xCD, 0x78, 0x0F, 0x13, 0xE1, 0xC2, 0xBC, 0xB0,  // .x......
                /* 0698 */  0x3D, 0xAD, 0x81, 0xE3, 0xFF, 0x7F, 0x5A, 0x83,  // =.....Z.
                /* 06A0 */  0x23, 0xE7, 0x8A, 0x0D, 0xD0, 0xE4, 0xA2, 0x8F,  // #.......
                /* 06A8 */  0x3B, 0xA4, 0x80, 0xE5, 0xDA, 0xC0, 0x6E, 0x29,  // ;.....n)
                /* 06B0 */  0xF0, 0x2E, 0xD8, 0xC0, 0xF9, 0xFF, 0x7F, 0x44,  // .......D
                /* 06B8 */  0x01, 0x5F, 0x96, 0x0B, 0x36, 0xCD, 0x71, 0xC1,  // ._..6.q.
                /* 06C0 */  0x46, 0x71, 0x58, 0x0D, 0x90, 0xE6, 0x09, 0xFF,  // FqX.....
                /* 06C8 */  0x7A, 0x0D, 0xFE, 0x49, 0xF8, 0x7A, 0x0D, 0xD8,  // z..I.z..
                /* 06D0 */  0xBE, 0xC5, 0xE2, 0xAE, 0xD7, 0xC0, 0xEA, 0xFF,  // ........
                /* 06D8 */  0x7F, 0xBD, 0x06, 0x96, 0x82, 0x47, 0x4A, 0xEF,  // .....GJ.
                /* 06E0 */  0xD4, 0xE0, 0xBA, 0x69, 0xE3, 0x41, 0xDF, 0xB4,  // ...i.A..
                /* 06E8 */  0x61, 0x0A, 0xBE, 0x45, 0xD1, 0x28, 0xE4, 0x8A,  // a..E.(..
                /* 06F0 */  0xB6, 0x10, 0x0A, 0xE3, 0x5B, 0x14, 0xE0, 0x08,  // ....[...
                /* 06F8 */  0xFB, 0x2D, 0x0A, 0x2C, 0x17, 0xA7, 0xB7, 0x28,  // .-.,...(
                /* 0700 */  0xFC, 0x0C, 0x3C, 0x68, 0xDF, 0x75, 0x18, 0xA6,  // ..<h.u..
                /* 0708 */  0xEF, 0xD0, 0xF0, 0x4F, 0x4D, 0xCF, 0x4D, 0x0F,  // ...OM.M.
                /* 0710 */  0x4E, 0x0F, 0xCD, 0x3E, 0x48, 0xF9, 0x70, 0xF0,  // N..>H.p.
                /* 0718 */  0xFC, 0xF4, 0xFF, 0x8F, 0xF1, 0x5E, 0xE7, 0x9B,  // .....^..
                /* 0720 */  0xD4, 0x6B, 0x94, 0x2F, 0x30, 0xC7, 0x10, 0x31,  // .k./0..1
                /* 0728 */  0xCA, 0xCB, 0xB4, 0x21, 0xE2, 0xF9, 0xD4, 0xE4,  // ...!....
                /* 0730 */  0xB3, 0x42, 0xDC, 0x10, 0x0F, 0xD1, 0x46, 0x88,  // .B....F.
                /* 0738 */  0xFA, 0x3C, 0xED, 0x09, 0xBD, 0x46, 0x81, 0x57,  // .<...F.W
                /* 0740 */  0xD0, 0x35, 0x0A, 0xA0, 0xC9, 0xFD, 0x08, 0x77,  // .5.....w
                /* 0748 */  0x8D, 0x02, 0xCB, 0xBD, 0x81, 0x9D, 0x87, 0xF8,  // ........
                /* 0750 */  0x95, 0xC8, 0xD7, 0x06, 0x18, 0xF7, 0x28, 0x38,  // ......(8
                /* 0758 */  0xFF, 0xFF, 0x7B, 0x14, 0x60, 0x23, 0xCC, 0x3D,  // ..{.`#.=
                /* 0760 */  0x8A, 0x06, 0xB9, 0x47, 0xA1, 0x4E, 0x26, 0xBE,  // ...G.N&.
                /* 0768 */  0xD4, 0x79, 0xA2, 0xE0, 0x08, 0x7F, 0x91, 0x42,  // .y.....B
                /* 0770 */  0xC5, 0x26, 0x51, 0xE8, 0xC3, 0x10, 0x2A, 0xE6,  // .&Q...*.
                /* 0778 */  0x61, 0x84, 0x82, 0x18, 0xD0, 0x19, 0x4E, 0x14,  // a.....N.
                /* 0780 */  0x68, 0x15, 0x27, 0x0A, 0x72, 0x8B, 0xF1, 0xA4,  // h.'.r...
                /* 0788 */  0x1E, 0xA3, 0x00, 0x5F, 0xCB, 0xF4, 0x50, 0x79,  // ..._..Py
                /* 0790 */  0xE4, 0xA1, 0x52, 0x10, 0x0F, 0xD5, 0x71, 0x86,  // ..R...q.
                /* 0798 */  0x8A, 0x9E, 0xA4, 0xE7, 0x8F, 0xF9, 0xFF, 0x1F,  // ........
                /* 07A0 */  0x1C, 0xB0, 0x07, 0x29, 0x80, 0x17, 0x0A, 0x6D,  // ...)...m
                /* 07A8 */  0xFA, 0xD4, 0x68, 0xD4, 0xAA, 0x41, 0x99, 0x1A,  // ..h..A..
                /* 07B0 */  0x65, 0x1A, 0xD4, 0xEA, 0x53, 0xA9, 0x31, 0x63,  // e...S.1c
                /* 07B8 */  0xE7, 0x50, 0x4B, 0x3B, 0x4B, 0x50, 0x31, 0x8B,  // .PK;KP1.
                /* 07C0 */  0xD1, 0x68, 0x1C, 0x05, 0x84, 0xCA, 0xFE, 0x9B,  // .h......
                /* 07C8 */  0x0B, 0xC4, 0x21, 0x9F, 0x3A, 0x02, 0x74, 0xB0,  // ..!.:.t.
                /* 07D0 */  0x17, 0x95, 0x80, 0x2C, 0x6B, 0x6D, 0x02, 0x71,  // ...,km.q
                /* 07D8 */  0x7C, 0x13, 0x10, 0x8D, 0x80, 0x48, 0xCB, 0x63,  // |....H.c
                /* 07E0 */  0x42, 0x40, 0xCE, 0x0D, 0x22, 0x20, 0xAB, 0x58,  // B@.." .X
                /* 07E8 */  0x93, 0x80, 0xAC, 0xF9, 0x01, 0x23, 0x70, 0xEB,  // .....#p.
                /* 07F0 */  0xD4, 0x01, 0xC4, 0x52, 0x82, 0xD0, 0x44, 0x0B,  // ...R..D.
                /* 07F8 */  0x17, 0xA8, 0xE3, 0x81, 0x68, 0x30, 0x84, 0x46,  // ....h0.F
                /* 0800 */  0x40, 0x0E, 0x46, 0x21, 0x20, 0xCB, 0xF8, 0x74,  // @.F! ..t
                /* 0808 */  0x0B, 0xDC, 0x02, 0xAC, 0x00, 0x31, 0xF9, 0x20,  // .....1. 
                /* 0810 */  0x54, 0xB0, 0x17, 0x50, 0xA6, 0x1E, 0x44, 0x40,  // T..P..D@
                /* 0818 */  0x56, 0xBA, 0x56, 0x01, 0x59, 0x37, 0x88, 0x80,  // V.V.Y7..
                /* 0820 */  0xFE, 0xFF, 0x2F, 0x83, 0x32, 0x03, 0xCE, 0x32,  // ../.2..2
                /* 0828 */  0xBA, 0x01, 0x62, 0x0A, 0x1F, 0x0A, 0x02, 0xB1,  // ..b.....
                /* 0830 */  0x26, 0x3D, 0xA0, 0x4C, 0x20, 0x88, 0xAE, 0x1C,  // &=.L ...
                /* 0838 */  0xC4, 0x0F, 0x10, 0x93, 0x06, 0x22, 0x20, 0xC7,  // ....." .
                /* 0840 */  0x39, 0x98, 0x08, 0xDC, 0x71, 0x14, 0x01, 0x52,  // 9...q..R
                /* 0848 */  0x47, 0xC3, 0xA5, 0x20, 0x54, 0xFC, 0xF3, 0x44,  // G.. T..D
                /* 0850 */  0x20, 0x16, 0x64, 0x09, 0x8C, 0x82, 0xD0, 0x08,  //  .d.....
                /* 0858 */  0x9A, 0x40, 0x98, 0x3C, 0x4F, 0x20, 0x2C, 0xD4,  // .@.<O ,.
                /* 0860 */  0x9F, 0x5C, 0xA7, 0x15, 0xA2, 0x6A, 0x88, 0xD4,  // .\...j..
                /* 0868 */  0x15, 0x08, 0x0B, 0xFC, 0x30, 0xD0, 0x60, 0x9C,  // ....0.`.
                /* 0870 */  0x1E, 0x44, 0x40, 0x4E, 0xFA, 0xA7, 0x0A, 0x44,  // .D@N...D
                /* 0878 */  0x72, 0x83, 0x08, 0xC8, 0xF9, 0x9F, 0x22, 0x02,  // r.....".
                /* 0880 */  0x77, 0xEA, 0xD7, 0x84, 0x86, 0x4F, 0xBE, 0x58,  // w....O.X
                /* 0888 */  0x41, 0x88, 0xB8, 0x87, 0x55, 0x50, 0xA2, 0x14,  // A...UP..
                /* 0890 */  0x44, 0x40, 0x56, 0xF6, 0xB4, 0x12, 0x90, 0x75,  // D@V....u
                /* 0898 */  0x82, 0x08, 0xC8, 0xFF, 0x7F                     // .....
            })
        }

        Device (WMI2)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_WDG, Buffer (0x64)
            {
                /* 0000 */  0xF1, 0x24, 0xB4, 0xFC, 0x5A, 0x07, 0x0E, 0x4E,  // .$..Z..N
                /* 0008 */  0xBF, 0xC4, 0x62, 0xF3, 0xE7, 0x17, 0x71, 0xFA,  // ..b...q.
                /* 0010 */  0x41, 0x37, 0x01, 0x01, 0xE3, 0x5E, 0xBE, 0xE2,  // A7...^..
                /* 0018 */  0xDA, 0x42, 0xDB, 0x49, 0x83, 0x78, 0x1F, 0x52,  // .B.I.x.R
                /* 0020 */  0x47, 0x38, 0x82, 0x02, 0x41, 0x38, 0x01, 0x02,  // G8..A8..
                /* 0028 */  0x9A, 0x01, 0x30, 0x74, 0xE9, 0xDC, 0x48, 0x45,  // ..0t..HE
                /* 0030 */  0xBA, 0xB0, 0x9F, 0xDE, 0x09, 0x35, 0xCA, 0xFF,  // .....5..
                /* 0038 */  0x41, 0x39, 0x0A, 0x05, 0x03, 0x70, 0xF4, 0x7F,  // A9...p..
                /* 0040 */  0x6C, 0x3B, 0x5E, 0x4E, 0xA2, 0x27, 0xE9, 0x79,  // l;^N.'.y
                /* 0048 */  0x82, 0x4A, 0x85, 0xD1, 0x41, 0x41, 0x01, 0x06,  // .J..AA..
                /* 0050 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 0058 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 0060 */  0x42, 0x42, 0x01, 0x00                           // BB..
            })
            Name (PREL, Buffer (0x08)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
            })
            Method (WQA7, 1, NotSerialized)
            {
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                \WMIS (0x07, 0x00)
                PREL [0x00] = \WLS0
                PREL [0x01] = \WLS1
                PREL [0x02] = \WLS2
                PREL [0x03] = \WLS3
                PREL [0x04] = \WLS4
                PREL [0x05] = \WLS5
                PREL [0x06] = \WLS6
                PREL [0x07] = \WLS7
                Release (\_SB.WMI1.MWMI)
                Return (PREL) /* \_SB_.WMI2.PREL */
            }

            Method (WMA8, 3, NotSerialized)
            {
                CreateByteField (Arg2, 0x00, PRE0)
                CreateByteField (Arg2, 0x01, PRE1)
                CreateByteField (Arg2, 0x02, PRE2)
                CreateByteField (Arg2, 0x03, PRE3)
                CreateByteField (Arg2, 0x04, PRE4)
                CreateByteField (Arg2, 0x05, PRE5)
                CreateByteField (Arg2, 0x06, PRE6)
                CreateByteField (Arg2, 0x07, PRE7)
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                \WLS0 = PRE0 /* \_SB_.WMI2.WMA8.PRE0 */
                \WLS1 = PRE1 /* \_SB_.WMI2.WMA8.PRE1 */
                \WLS2 = PRE2 /* \_SB_.WMI2.WMA8.PRE2 */
                \WLS3 = PRE3 /* \_SB_.WMI2.WMA8.PRE3 */
                \WLS4 = PRE4 /* \_SB_.WMI2.WMA8.PRE4 */
                \WLS5 = PRE5 /* \_SB_.WMI2.WMA8.PRE5 */
                \WLS6 = PRE6 /* \_SB_.WMI2.WMA8.PRE6 */
                \WLS7 = PRE7 /* \_SB_.WMI2.WMA8.PRE7 */
                \WMIS (0x08, 0x00)
                Release (\_SB.WMI1.MWMI)
            }

            Name (ITEM, Package (0x05)
            {
                Package (0x02)
                {
                    0x00, 
                    "InhibitEnteringThinkPadSetup"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "MTMSerialConcatenation"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "SwapProductName"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "ComputraceMsgDisable"
                }, 

                Package (0x02)
                {
                    0x00, 
                    "AtpMsgDisable"
                }
            })
            Name (VSEL, Package (0x02)
            {
                Package (0x02)
                {
                    "Disable", 
                    "Enable"
                }, 

                Package (0x02)
                {
                    "Off", 
                    "On"
                }
            })
            Method (WQA9, 1, NotSerialized)
            {
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                If ((\WMIS (0x09, Arg0) != 0x00))
                {
                    Release (\_SB.WMI1.MWMI)
                    Return ("")
                }

                Local0 = DerefOf (ITEM [\WITM])
                Local1 = DerefOf (Local0 [0x00])
                Local2 = DerefOf (Local0 [0x01])
                Concatenate (Local2, ",", Local6)
                Local3 = DerefOf (VSEL [Local1])
                Concatenate (Local6, DerefOf (Local3 [\WSEL]), Local7)
                Release (\_SB.WMI1.MWMI)
                Return (Local7)
            }

            Method (WMAA, 3, NotSerialized)
            {
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                If ((SizeOf (Arg2) == 0x00))
                {
                    Local0 = 0x02
                }
                Else
                {
                    Local0 = \_SB.WMI1.CARG (Arg2)
                    If ((Local0 == 0x00))
                    {
                        Local0 = \_SB.WMI1.WSET (ITEM, VSEL)
                        If ((Local0 == 0x00))
                        {
                            Local0 = \WMIS (0x0A, 0x00)
                        }
                    }
                }

                Release (\_SB.WMI1.MWMI)
                Return (DerefOf (\_SB.WMI1.RETN [Local0]))
            }

            Name (WQBB, Buffer (0x0538)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0x28, 0x05, 0x00, 0x00, 0xAE, 0x18, 0x00, 0x00,  // (.......
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0x98, 0xDE, 0x8B, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x0D, 0x10, 0x8A, 0x0D, 0x21, 0x02, 0x0B,  // .....!..
                /* 0028 */  0x83, 0x50, 0x50, 0x18, 0x14, 0xA0, 0x45, 0x41,  // .PP...EA
                /* 0030 */  0xC8, 0x05, 0x14, 0x95, 0x02, 0x21, 0xC3, 0x02,  // .....!..
                /* 0038 */  0x14, 0x0B, 0x70, 0x2E, 0x40, 0xBA, 0x00, 0xE5,  // ..p.@...
                /* 0040 */  0x28, 0x72, 0x0C, 0x22, 0x02, 0xF7, 0xEF, 0x0F,  // (r."....
                /* 0048 */  0x31, 0x10, 0x88, 0x14, 0x40, 0x48, 0x28, 0x84,  // 1...@H(.
                /* 0050 */  0x44, 0x00, 0x53, 0x21, 0x70, 0x84, 0xA0, 0x5F,  // D.S!p.._
                /* 0058 */  0x01, 0x08, 0x1D, 0x0A, 0x90, 0x29, 0xC0, 0xA0,  // .....)..
                /* 0060 */  0x00, 0xA7, 0x08, 0x22, 0x88, 0xD2, 0xB2, 0x00,  // ..."....
                /* 0068 */  0xDD, 0x02, 0x7C, 0x0B, 0xD0, 0x0E, 0x21, 0xB4,  // ..|...!.
                /* 0070 */  0xC8, 0x95, 0x0A, 0xB0, 0x08, 0x25, 0x9F, 0x80,  // .....%..
                /* 0078 */  0x92, 0x88, 0x22, 0xD9, 0x78, 0xB2, 0x8D, 0x48,  // ..".x..H
                /* 0080 */  0xE6, 0x61, 0x91, 0x83, 0x40, 0x89, 0x19, 0x04,  // .a..@...
                /* 0088 */  0x4A, 0x27, 0xAE, 0x6C, 0xE2, 0x6A, 0x10, 0x07,  // J'.l.j..
                /* 0090 */  0x10, 0xE5, 0x3C, 0xA2, 0x24, 0x38, 0xAA, 0x83,  // ..<.$8..
                /* 0098 */  0x88, 0x10, 0xBB, 0x5C, 0x01, 0x92, 0x07, 0x20,  // ...\... 
                /* 00A0 */  0xCD, 0x13, 0x93, 0xF5, 0x39, 0x68, 0x64, 0x6C,  // ....9hdl
                /* 00A8 */  0x04, 0x3C, 0x98, 0x04, 0x10, 0x16, 0x65, 0x9D,  // .<....e.
                /* 00B0 */  0x8A, 0x02, 0x83, 0xF2, 0x00, 0x22, 0x39, 0x63,  // ....."9c
                /* 00B8 */  0x45, 0x01, 0xDB, 0xEB, 0x44, 0x64, 0x72, 0xA0,  // E...Ddr.
                /* 00C0 */  0x54, 0x12, 0x1C, 0x6A, 0x98, 0x9E, 0x5A, 0xF3,  // T..j..Z.
                /* 00C8 */  0x13, 0xD3, 0x44, 0x4E, 0xAD, 0xE9, 0x21, 0x0B,  // ..DN..!.
                /* 00D0 */  0x92, 0x49, 0x1B, 0x0A, 0x6A, 0xEC, 0x9E, 0xD6,  // .I..j...
                /* 00D8 */  0x49, 0x79, 0xA6, 0x11, 0x0F, 0xCA, 0x30, 0x09,  // Iy....0.
                /* 00E0 */  0x3C, 0x0A, 0x86, 0xC6, 0x09, 0xCA, 0x82, 0x90,  // <.......
                /* 00E8 */  0x83, 0x81, 0xA2, 0x00, 0x4F, 0xC2, 0x73, 0x2C,  // ....O.s,
                /* 00F0 */  0x5E, 0x80, 0xF0, 0x11, 0x93, 0xB3, 0x40, 0x8C,  // ^.....@.
                /* 00F8 */  0x04, 0x3E, 0x13, 0x78, 0xE4, 0xC7, 0x8C, 0x1D,  // .>.x....
                /* 0100 */  0x51, 0xB8, 0x80, 0xE7, 0x73, 0x0C, 0x91, 0xE3,  // Q...s...
                /* 0108 */  0x1E, 0x6A, 0x8C, 0xA3, 0x88, 0x7C, 0x38, 0x0C,  // .j...|8.
                /* 0110 */  0xED, 0x74, 0xE3, 0x1C, 0xD8, 0xE9, 0x14, 0x04,  // .t......
                /* 0118 */  0x2E, 0x90, 0x60, 0x3D, 0xCF, 0x59, 0x20, 0xFF,  // ..`=.Y .
                /* 0120 */  0xFF, 0x18, 0x07, 0xC1, 0xF0, 0x8E, 0x01, 0x23,  // .......#
                /* 0128 */  0x03, 0x42, 0x1E, 0x05, 0x58, 0x1D, 0x96, 0x26,  // .B..X..&
                /* 0130 */  0x91, 0xC0, 0xEE, 0x05, 0x68, 0xBC, 0x04, 0x48,  // ....h..H
                /* 0138 */  0xE1, 0x20, 0xA5, 0x0C, 0x42, 0x30, 0x8D, 0x09,  // . ..B0..
                /* 0140 */  0xB0, 0x75, 0x68, 0x90, 0x37, 0x01, 0xD6, 0xAE,  // .uh.7...
                /* 0148 */  0x02, 0x42, 0x89, 0x74, 0x02, 0x71, 0x42, 0x44,  // .B.t.qBD
                /* 0150 */  0x89, 0x18, 0xD4, 0x40, 0x51, 0x6A, 0x43, 0x15,  // ...@QjC.
                /* 0158 */  0x4C, 0x67, 0xC3, 0x13, 0x66, 0xDC, 0x10, 0x31,  // Lg..f..1
                /* 0160 */  0x0C, 0x14, 0xB7, 0xFD, 0x41, 0x90, 0x61, 0xE3,  // ....A.a.
                /* 0168 */  0xC6, 0xEF, 0x41, 0x9D, 0xD6, 0xD9, 0x1D, 0xD3,  // ..A.....
                /* 0170 */  0xAB, 0x82, 0x09, 0x3C, 0xE9, 0x37, 0x84, 0xA7,  // ...<.7..
                /* 0178 */  0x83, 0xA3, 0x38, 0xDA, 0xA8, 0x31, 0x9A, 0x23,  // ..8..1.#
                /* 0180 */  0x65, 0xAB, 0xD6, 0xB9, 0xC2, 0x91, 0xE0, 0x51,  // e......Q
                /* 0188 */  0xE7, 0x05, 0x9F, 0x0C, 0x3C, 0xB4, 0xC3, 0xF6,  // ....<...
                /* 0190 */  0x60, 0xCF, 0xD2, 0x43, 0x38, 0x82, 0x67, 0x86,  // `..C8.g.
                /* 0198 */  0x47, 0x02, 0x8F, 0x81, 0xDD, 0x15, 0x7C, 0x08,  // G.....|.
                /* 01A0 */  0xF0, 0x19, 0x01, 0xEF, 0x1A, 0x50, 0x97, 0x83,  // .....P..
                /* 01A8 */  0x47, 0x03, 0x36, 0xE9, 0x70, 0x98, 0xF1, 0x7A,  // G.6.p..z
                /* 01B0 */  0xEE, 0x9E, 0xBA, 0xCF, 0x18, 0xFC, 0xBC, 0xE1,  // ........
                /* 01B8 */  0xC1, 0xE1, 0x46, 0x7A, 0x32, 0x47, 0x56, 0xAA,  // ..Fz2GV.
                /* 01C0 */  0x00, 0xB3, 0xD7, 0x00, 0x1D, 0x25, 0x7C, 0xE0,  // .....%|.
                /* 01C8 */  0x60, 0x77, 0x81, 0xA7, 0x00, 0x13, 0x58, 0xFE,  // `w....X.
                /* 01D0 */  0x20, 0x50, 0x23, 0x33, 0xB4, 0xC7, 0xFB, 0xDE,  //  P#3....
                /* 01D8 */  0x61, 0xC8, 0x27, 0x85, 0xC3, 0x62, 0x62, 0x0F,  // a.'..bb.
                /* 01E0 */  0x1E, 0x74, 0x3C, 0xE0, 0xBF, 0x8F, 0x3C, 0x69,  // .t<...<i
                /* 01E8 */  0x78, 0xFA, 0x9E, 0xAF, 0x09, 0x06, 0x86, 0x90,  // x.......
                /* 01F0 */  0x95, 0xF1, 0xA0, 0x06, 0x62, 0xE8, 0x57, 0x85,  // ....b.W.
                /* 01F8 */  0xC3, 0x38, 0x0D, 0x9F, 0x40, 0x7C, 0x0E, 0x08,  // .8..@|..
                /* 0200 */  0x12, 0xE3, 0x98, 0x3C, 0x38, 0xFF, 0xFF, 0x09,  // ...<8...
                /* 0208 */  0x1C, 0x6B, 0xE4, 0xF4, 0x9C, 0xE2, 0xF3, 0x04,  // .k......
                /* 0210 */  0x3F, 0x5C, 0xF8, 0x3C, 0xC1, 0x4E, 0x0C, 0xA7,  // ?\.<.N..
                /* 0218 */  0xF1, 0x1C, 0xE0, 0xE1, 0x9C, 0x95, 0x8F, 0x13,  // ........
                /* 0220 */  0xC0, 0x02, 0xE2, 0x75, 0x82, 0x0F, 0x14, 0x3E,  // ...u...>
                /* 0228 */  0xEC, 0xA1, 0x79, 0x14, 0x2F, 0x11, 0x6F, 0x0F,  // ..y./.o.
                /* 0230 */  0x26, 0x88, 0xF6, 0x10, 0x03, 0xC6, 0x19, 0xE1,  // &.......
                /* 0238 */  0xCE, 0x1B, 0x70, 0x4E, 0x31, 0xC0, 0x03, 0xEA,  // ..pN1...
                /* 0240 */  0x10, 0x30, 0x87, 0x09, 0x0F, 0x81, 0x0F, 0xE0,  // .0......
                /* 0248 */  0x19, 0xE4, 0x1C, 0x7D, 0xCC, 0x39, 0x33, 0xDC,  // ...}.93.
                /* 0250 */  0x71, 0x07, 0x6C, 0xC3, 0xE0, 0x91, 0x2D, 0x80,  // q.l...-.
                /* 0258 */  0xB0, 0x38, 0x4F, 0x02, 0x05, 0x7C, 0x1B, 0x50,  // .8O..|.P
                /* 0260 */  0x18, 0x1F, 0x6E, 0xC0, 0xFB, 0xFF, 0x3F, 0xDC,  // ..n...?.
                /* 0268 */  0x00, 0xD7, 0xF3, 0x01, 0xEE, 0xF8, 0x00, 0xF7,  // ........
                /* 0270 */  0x62, 0xC1, 0x0E, 0x0F, 0x8F, 0x37, 0xC0, 0x60,  // b....7.`
                /* 0278 */  0x48, 0x8F, 0x34, 0x6F, 0x35, 0x31, 0x5E, 0x6D,  // H.4o51^m
                /* 0280 */  0x42, 0x44, 0x78, 0xA8, 0x79, 0xB7, 0x31, 0x52,  // BDx.y.1R
                /* 0288 */  0xBC, 0xC7, 0x1B, 0x76, 0x8D, 0x39, 0x8B, 0x07,  // ...v.9..
                /* 0290 */  0x90, 0x28, 0xC5, 0xA1, 0xE9, 0x62, 0x13, 0x23,  // .(...b.#
                /* 0298 */  0xCA, 0x9B, 0x8D, 0x61, 0xDF, 0x74, 0x0C, 0x14,  // ...a.t..
                /* 02A0 */  0x2A, 0x52, 0x84, 0x30, 0x2F, 0x16, 0x21, 0x1E,  // *R.0/.!.
                /* 02A8 */  0x6F, 0xC0, 0x2C, 0xE9, 0xA5, 0xA2, 0xCF, 0x81,  // o.,.....
                /* 02B0 */  0x8F, 0x37, 0x80, 0x97, 0xFF, 0xFF, 0xF1, 0x06,  // .7......
                /* 02B8 */  0xF0, 0x30, 0x0C, 0x1F, 0x53, 0xC0, 0x76, 0x73,  // .0..S.vs
                /* 02C0 */  0x60, 0xF7, 0x14, 0xF8, 0xE7, 0x14, 0xC0, 0x91,  // `.......
                /* 02C8 */  0x90, 0x47, 0x80, 0x0E, 0x1E, 0x16, 0x01, 0x22,  // .G....."
                /* 02D0 */  0x1B, 0xCF, 0x00, 0x9F, 0x89, 0xA8, 0x40, 0x2A,  // ......@*
                /* 02D8 */  0xCD, 0x14, 0x2C, 0xE3, 0x14, 0xAC, 0x4E, 0x88,  // ..,...N.
                /* 02E0 */  0x5C, 0x06, 0x85, 0x44, 0x40, 0x68, 0x64, 0x86,  // \..D@hd.
                /* 02E8 */  0xF3, 0x21, 0xD1, 0x60, 0x06, 0xF1, 0xF9, 0xC0,  // .!.`....
                /* 02F0 */  0x67, 0x0A, 0x9F, 0x9C, 0xF8, 0xFF, 0xFF, 0xE4,  // g.......
                /* 02F8 */  0x04, 0x9E, 0x83, 0xC9, 0x43, 0x05, 0x2C, 0x44,  // ....C.,D
                /* 0300 */  0x9F, 0x16, 0x38, 0x9C, 0xCF, 0x2C, 0x1C, 0xCE,  // ..8..,..
                /* 0308 */  0x47, 0x12, 0x7E, 0x80, 0xE4, 0x47, 0x25, 0x70,  // G.~..G%p
                /* 0310 */  0x09, 0x3C, 0x34, 0x80, 0x02, 0xC8, 0xF7, 0x03,  // .<4.....
                /* 0318 */  0x9F, 0x03, 0x9E, 0x11, 0xD8, 0x1C, 0x1E, 0x09,  // ........
                /* 0320 */  0x7C, 0x20, 0x60, 0xF0, 0x3C, 0xDA, 0xA8, 0xE8,  // | `.<...
                /* 0328 */  0xD1, 0xC6, 0xC3, 0xE3, 0x47, 0x06, 0xCF, 0xE7,  // ....G...
                /* 0330 */  0x81, 0xE0, 0x28, 0x1F, 0x09, 0x70, 0x18, 0xEF,  // ..(..p..
                /* 0338 */  0x17, 0x1E, 0xA2, 0x4F, 0x39, 0xB0, 0x26, 0x72,  // ...O9.&r
                /* 0340 */  0xD4, 0x16, 0x7D, 0x22, 0x10, 0xE8, 0x33, 0x17,  // ..}"..3.
                /* 0348 */  0xE6, 0x94, 0x03, 0x9C, 0x82, 0x8F, 0x1E, 0x15,  // ........
                /* 0350 */  0xF5, 0x40, 0x0A, 0xDA, 0x93, 0x82, 0xCF, 0x0A,  // .@......
                /* 0358 */  0x3E, 0x7C, 0xC1, 0xFF, 0xFF, 0x1F, 0xBE, 0xE0,  // >|......
                /* 0360 */  0xCC, 0xEB, 0x65, 0xCD, 0x07, 0x8E, 0x38, 0x67,  // ..e...8g
                /* 0368 */  0x71, 0xBA, 0xEF, 0x16, 0xF8, 0x13, 0x29, 0x30,  // q.....)0
                /* 0370 */  0x0B, 0x72, 0x22, 0x45, 0xC1, 0xF8, 0x44, 0x0A,  // .r"E..D.
                /* 0378 */  0xD8, 0xBC, 0x05, 0x60, 0xAF, 0x0B, 0x4F, 0x22,  // ...`..O"
                /* 0380 */  0x30, 0xCE, 0x11, 0xCF, 0x58, 0x30, 0x0F, 0x55,  // 0...X0.U
                /* 0388 */  0xA7, 0xF8, 0x52, 0xF5, 0xC6, 0x10, 0xE1, 0xC9,  // ..R.....
                /* 0390 */  0xEA, 0x35, 0xEA, 0x01, 0xCB, 0x60, 0x2F, 0x02,  // .5...`/.
                /* 0398 */  0x86, 0x79, 0xC5, 0xF2, 0xE9, 0x2A, 0xC4, 0x03,  // .y...*..
                /* 03A0 */  0x96, 0xCF, 0x5A, 0xD1, 0x42, 0x84, 0x8C, 0x12,  // ..Z.B...
                /* 03A8 */  0xEC, 0x15, 0xEB, 0x55, 0xC6, 0x47, 0x2A, 0x83,  // ...U.G*.
                /* 03B0 */  0x07, 0x0C, 0x1B, 0x2D, 0x52, 0x84, 0x47, 0x2C,  // ...-R.G,
                /* 03B8 */  0xFC, 0xFF, 0xFF, 0x88, 0x05, 0x1E, 0x09, 0x07,  // ........
                /* 03C0 */  0x52, 0x80, 0x2A, 0x03, 0xC7, 0x1D, 0x48, 0x81,  // R.*...H.
                /* 03C8 */  0xFD, 0x69, 0x02, 0x7F, 0xBD, 0xF0, 0x78, 0xB0,  // .i....x.
                /* 03D0 */  0xFF, 0xFF, 0x73, 0x00, 0xF8, 0x0E, 0x31, 0xC0,  // ..s...1.
                /* 03D8 */  0x60, 0xC0, 0x30, 0x0E, 0x31, 0xC0, 0x43, 0xF0,  // `.0.1.C.
                /* 03E0 */  0xC9, 0x0C, 0xF4, 0xC7, 0x1D, 0xF8, 0xE3, 0xE0,  // ........
                /* 03E8 */  0x19, 0x9F, 0x1C, 0x26, 0x50, 0x98, 0x13, 0x29,  // ...&P..)
                /* 03F0 */  0x0A, 0xC6, 0x27, 0x52, 0xC0, 0xD9, 0xFF, 0xFF,  // ..'R....
                /* 03F8 */  0x70, 0x05, 0x86, 0xE3, 0x0D, 0xF8, 0x6F, 0x33,  // p.....o3
                /* 0400 */  0x3E, 0x84, 0xFA, 0x7C, 0xE3, 0x0B, 0xA9, 0x21,  // >..|...!
                /* 0408 */  0x5E, 0x6C, 0xDE, 0xD4, 0x5E, 0x09, 0x5E, 0xDF,  // ^l..^.^.
                /* 0410 */  0xD9, 0xB5, 0xE6, 0xF5, 0xDD, 0xA7, 0x82, 0x27,  // .......'
                /* 0418 */  0xD1, 0x08, 0x21, 0xA3, 0xBC, 0xE4, 0x18, 0x24,  // ..!....$
                /* 0420 */  0xC4, 0xEB, 0xA8, 0x01, 0x83, 0x05, 0x89, 0x78,  // .......x
                /* 0428 */  0x0A, 0x4F, 0x3B, 0x8F, 0x37, 0xE0, 0x15, 0x75,  // .O;.7..u
                /* 0430 */  0x20, 0x05, 0xE8, 0xF1, 0xFF, 0x3F, 0x90, 0x02,  //  ....?..
                /* 0438 */  0x83, 0x7B, 0x0A, 0xEC, 0x73, 0x0A, 0xE0, 0x29,  // .{..s..)
                /* 0440 */  0xF9, 0x89, 0x94, 0xA6, 0x3E, 0x91, 0xA2, 0x15,  // ....>...
                /* 0448 */  0x01, 0x69, 0xAA, 0x60, 0x21, 0x98, 0xFE, 0x44,  // .i.`!..D
                /* 0450 */  0x4A, 0x0F, 0x06, 0xCE, 0x4D, 0xA2, 0xE4, 0x43,  // J...M..C
                /* 0458 */  0xA3, 0x70, 0xCE, 0x7A, 0x20, 0xA1, 0x20, 0x06,  // .p.z . .
                /* 0460 */  0x74, 0x90, 0x43, 0x05, 0xFA, 0xAC, 0xE2, 0x03,  // t.C.....
                /* 0468 */  0xC9, 0x81, 0x3C, 0x22, 0x7A, 0x58, 0x3E, 0x54,  // ..<"zX>T
                /* 0470 */  0xFA, 0xAE, 0xE2, 0x73, 0x88, 0x8F, 0x14, 0x1E,  // ...s....
                /* 0478 */  0xBF, 0x0F, 0x0B, 0xFC, 0x3F, 0xE3, 0xE3, 0x28,  // ....?..(
                /* 0480 */  0x03, 0xAF, 0xE6, 0xBC, 0x82, 0x02, 0xF3, 0x69,  // .......i
                /* 0488 */  0x14, 0xA3, 0xEB, 0x3E, 0x01, 0x92, 0xFF, 0xFF,  // ...>....
                /* 0490 */  0xFC, 0xB8, 0xBE, 0xC3, 0x28, 0xC8, 0xD1, 0x79,  // ....(..y
                /* 0498 */  0xF8, 0xC9, 0xA2, 0xE2, 0x4E, 0x96, 0x82, 0x78,  // ....N..x
                /* 04A0 */  0xB2, 0x8E, 0x32, 0x59, 0xF4, 0x4C, 0x7C, 0xBB,  // ..2Y.L|.
                /* 04A8 */  0xF0, 0x8C, 0xDE, 0xBB, 0x7C, 0x83, 0x65, 0x37,  // ....|.e7
                /* 04B0 */  0x59, 0x78, 0x97, 0x81, 0x90, 0x8F, 0x06, 0xBE,  // Yx......
                /* 04B8 */  0xC9, 0xC2, 0x1D, 0x8B, 0x2F, 0x23, 0xE0, 0xBB,  // ..../#..
                /* 04C0 */  0xC9, 0x02, 0x5E, 0x47, 0xE3, 0xB3, 0x05, 0x3B,  // ..^G...;
                /* 04C8 */  0x85, 0xF8, 0xBA, 0x06, 0x4B, 0xA1, 0x4D, 0x9F,  // ....K.M.
                /* 04D0 */  0x1A, 0x8D, 0x5A, 0xFD, 0xFF, 0x1B, 0x94, 0xA9,  // ..Z.....
                /* 04D8 */  0x51, 0xA6, 0x41, 0xAD, 0x3E, 0x95, 0x1A, 0x33,  // Q.A.>..3
                /* 04E0 */  0x76, 0xA1, 0xB0, 0xB8, 0x0B, 0x06, 0x95, 0xB4,  // v.......
                /* 04E8 */  0x2C, 0x8D, 0xCB, 0x81, 0x40, 0x68, 0x80, 0x5B,  // ,...@h.[
                /* 04F0 */  0xA9, 0x40, 0x1C, 0xFA, 0x0B, 0xA4, 0x53, 0x02,  // .@....S.
                /* 04F8 */  0xF9, 0x6A, 0x09, 0xC8, 0x62, 0x57, 0x25, 0x10,  // .j..bW%.
                /* 0500 */  0xCB, 0x54, 0x01, 0xD1, 0xC8, 0xDD, 0xC2, 0x20,  // .T..... 
                /* 0508 */  0x02, 0x72, 0xBC, 0x4F, 0x8D, 0x40, 0x1D, 0x49,  // .r.O.@.I
                /* 0510 */  0x07, 0x10, 0x13, 0xE4, 0x63, 0xAC, 0xF4, 0x25,  // ....c..%
                /* 0518 */  0x20, 0x10, 0xCB, 0xA6, 0x15, 0xA0, 0xE5, 0x3A,  //  ......:
                /* 0520 */  0x01, 0x62, 0x61, 0x41, 0x68, 0xC0, 0x5F, 0xB5,  // .baAh._.
                /* 0528 */  0x86, 0xE0, 0xB4, 0x20, 0x02, 0x72, 0x32, 0x2D,  // ... .r2-
                /* 0530 */  0x40, 0x2C, 0x27, 0x88, 0x80, 0xFC, 0xFF, 0x07   // @,'.....
            })
        }

        Device (WMI3)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_WDG, /**** Is ResourceTemplate, but EndTag not at buffer end ****/ Buffer (0x3C)
            {
                /* 0000 */  0x79, 0x36, 0x4D, 0x8F, 0x9E, 0x74, 0x79, 0x44,  // y6M..tyD
                /* 0008 */  0x9B, 0x16, 0xC6, 0x26, 0x01, 0xFD, 0x25, 0xF0,  // ...&..%.
                /* 0010 */  0x41, 0x42, 0x01, 0x02, 0x69, 0xE8, 0xD2, 0x85,  // AB..i...
                /* 0018 */  0x5A, 0x36, 0xCE, 0x4A, 0xA4, 0xD3, 0xCD, 0x69,  // Z6.J...i
                /* 0020 */  0x2B, 0x16, 0x98, 0xA0, 0x41, 0x43, 0x01, 0x02,  // +...AC..
                /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
                /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
                /* 0038 */  0x42, 0x43, 0x01, 0x00                           // BC..
            })
            Method (WMAB, 3, NotSerialized)
            {
                CreateByteField (Arg2, 0x00, ASS0)
                CreateWordField (Arg2, 0x01, ASS1)
                CreateByteField (Arg2, 0x03, ASS2)
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                \WASB = ASS0 /* \_SB_.WMI3.WMAB.ASS0 */
                \WASI = ASS1 /* \_SB_.WMI3.WMAB.ASS1 */
                \WASD = ASS2 /* \_SB_.WMI3.WMAB.ASS2 */
                \WMIS (0x0B, 0x00)
                Local0 = \WASS
                Release (\_SB.WMI1.MWMI)
                Return (Local0)
            }

            Method (WMAC, 3, NotSerialized)
            {
                CreateByteField (Arg2, 0x00, ASS0)
                CreateWordField (Arg2, 0x01, ASS1)
                Acquire (\_SB.WMI1.MWMI, 0xFFFF)
                \WASB = ASS0 /* \_SB_.WMI3.WMAC.ASS0 */
                \WASI = ASS1 /* \_SB_.WMI3.WMAC.ASS1 */
                \WMIS (0x0C, Arg1)
                Local0 = \WASS
                Release (\_SB.WMI1.MWMI)
                Return (Local0)
            }

            Name (WQBC, Buffer (0x040A)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0xFA, 0x03, 0x00, 0x00, 0x32, 0x12, 0x00, 0x00,  // ....2...
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0x98, 0xC3, 0x88, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x07, 0x10, 0x8A, 0x0D, 0x21, 0x02, 0x0B,  // .....!..
                /* 0028 */  0x83, 0x50, 0x50, 0x18, 0x14, 0xA0, 0x45, 0x41,  // .PP...EA
                /* 0030 */  0xC8, 0x05, 0x14, 0x95, 0x02, 0x21, 0xC3, 0x02,  // .....!..
                /* 0038 */  0x14, 0x0B, 0x70, 0x2E, 0x40, 0xBA, 0x00, 0xE5,  // ..p.@...
                /* 0040 */  0x28, 0x72, 0x0C, 0x22, 0x02, 0xF7, 0xEF, 0x0F,  // (r."....
                /* 0048 */  0x31, 0x10, 0x88, 0x14, 0x40, 0x48, 0x28, 0x84,  // 1...@H(.
                /* 0050 */  0x44, 0x00, 0x53, 0x21, 0x70, 0x84, 0xA0, 0x5F,  // D.S!p.._
                /* 0058 */  0x01, 0x08, 0x1D, 0x0A, 0x90, 0x29, 0xC0, 0xA0,  // .....)..
                /* 0060 */  0x00, 0xA7, 0x08, 0x22, 0x88, 0xD2, 0xB2, 0x00,  // ..."....
                /* 0068 */  0xDD, 0x02, 0x7C, 0x0B, 0xD0, 0x0E, 0x21, 0xB4,  // ..|...!.
                /* 0070 */  0x58, 0x07, 0x11, 0x21, 0xD2, 0x31, 0x34, 0x29,  // X..!.14)
                /* 0078 */  0x40, 0xA2, 0x00, 0x8B, 0x02, 0x64, 0xC3, 0xC8,  // @....d..
                /* 0080 */  0x36, 0x22, 0x99, 0x87, 0x45, 0x0E, 0x02, 0x25,  // 6"..E..%
                /* 0088 */  0x66, 0x10, 0x28, 0x9D, 0xE0, 0xB2, 0x89, 0xAB,  // f.(.....
                /* 0090 */  0x41, 0x9C, 0x4C, 0x94, 0xF3, 0x88, 0x92, 0xE0,  // A.L.....
                /* 0098 */  0xA8, 0x0E, 0x22, 0x42, 0xEC, 0x72, 0x05, 0x48,  // .."B.r.H
                /* 00A0 */  0x1E, 0x80, 0x34, 0x4F, 0x4C, 0xD6, 0xE7, 0xA0,  // ..4OL...
                /* 00A8 */  0x91, 0xB1, 0x11, 0xF0, 0x94, 0x1A, 0x40, 0x58,  // ......@X
                /* 00B0 */  0xA0, 0x75, 0x2A, 0xE0, 0x7A, 0x0D, 0x43, 0x3D,  // .u*.z.C=
                /* 00B8 */  0x80, 0x48, 0xCE, 0x58, 0x51, 0xC0, 0xF6, 0x3A,  // .H.XQ..:
                /* 00C0 */  0x11, 0x8D, 0xEA, 0x40, 0x99, 0x24, 0x38, 0xD4,  // ...@.$8.
                /* 00C8 */  0x30, 0x3D, 0xB5, 0xE6, 0x27, 0xA6, 0x89, 0x9C,  // 0=..'...
                /* 00D0 */  0x5A, 0xD3, 0x43, 0x16, 0x24, 0x93, 0x36, 0x14,  // Z.C.$.6.
                /* 00D8 */  0xD4, 0xD8, 0x3D, 0xAD, 0x93, 0xF2, 0x4C, 0x23,  // ..=...L#
                /* 00E0 */  0x1E, 0x94, 0x61, 0x12, 0x78, 0x14, 0x0C, 0x8D,  // ..a.x...
                /* 00E8 */  0x13, 0x94, 0x75, 0x22, 0xA0, 0x03, 0xE5, 0x80,  // ..u"....
                /* 00F0 */  0x27, 0xE1, 0x39, 0x16, 0x2F, 0x40, 0xF8, 0x88,  // '.9./@..
                /* 00F8 */  0xC9, 0xB4, 0x4D, 0xE0, 0x33, 0x81, 0x87, 0x79,  // ..M.3..y
                /* 0100 */  0xCC, 0xD8, 0x11, 0x85, 0x0B, 0x78, 0x3E, 0xC7,  // .....x>.
                /* 0108 */  0x10, 0x39, 0xEE, 0xA1, 0xC6, 0x38, 0x8A, 0xC8,  // .9...8..
                /* 0110 */  0x47, 0x60, 0x24, 0x03, 0xC5, 0x2B, 0x08, 0x89,  // G`$..+..
                /* 0118 */  0x80, 0xF8, 0x76, 0x70, 0x70, 0x91, 0xFC, 0xFF,  // ..vpp...
                /* 0120 */  0x47, 0x89, 0x11, 0x2A, 0xC6, 0xDB, 0x00, 0x6E,  // G..*...n
                /* 0128 */  0x5E, 0x09, 0x8A, 0x1E, 0x07, 0x4A, 0x06, 0x84,  // ^....J..
                /* 0130 */  0x3C, 0x0A, 0xB0, 0x7A, 0x28, 0x20, 0x04, 0x16,  // <..z( ..
                /* 0138 */  0x27, 0x40, 0xE3, 0x38, 0x05, 0xD3, 0x99, 0x00,  // '@.8....
                /* 0140 */  0x6D, 0x02, 0xBC, 0x09, 0x30, 0x27, 0xC0, 0x16,  // m...0'..
                /* 0148 */  0x86, 0x80, 0x82, 0x9C, 0x59, 0x94, 0x20, 0x11,  // ....Y. .
                /* 0150 */  0x42, 0x31, 0x88, 0x0A, 0x05, 0x18, 0x43, 0x14,  // B1....C.
                /* 0158 */  0xCA, 0x3B, 0x41, 0x8C, 0xCA, 0x20, 0x74, 0x82,  // .;A.. t.
                /* 0160 */  0x08, 0x14, 0x3D, 0x78, 0x98, 0xD6, 0x40, 0x74,  // ..=x..@t
                /* 0168 */  0x89, 0xF0, 0xC8, 0xB1, 0x47, 0x00, 0x9F, 0x19,  // ....G...
                /* 0170 */  0xCE, 0xE9, 0x04, 0x1F, 0x01, 0xDE, 0x16, 0x4C,  // .......L
                /* 0178 */  0xE0, 0x79, 0xBF, 0x24, 0x1C, 0x6A, 0xD8, 0x03,  // .y.$.j..
                /* 0180 */  0x8E, 0x1A, 0xE3, 0x28, 0x12, 0x58, 0xD0, 0x33,  // ...(.X.3
                /* 0188 */  0x42, 0x16, 0x40, 0x14, 0x09, 0x1E, 0x75, 0x64,  // B.@...ud
                /* 0190 */  0xF0, 0xE1, 0xC0, 0x23, 0x3B, 0x72, 0xCF, 0xF0,  // ...#;r..
                /* 0198 */  0x04, 0x82, 0x1C, 0xC2, 0x11, 0x3C, 0x36, 0x3C,  // .....<6<
                /* 01A0 */  0x15, 0x78, 0x0C, 0xEC, 0xBA, 0xE0, 0x73, 0x80,  // .x....s.
                /* 01A8 */  0x8F, 0x09, 0x78, 0xD7, 0x80, 0x9A, 0xF3, 0xD3,  // ..x.....
                /* 01B0 */  0x01, 0x9B, 0x72, 0x38, 0xCC, 0x70, 0x3D, 0xFD,  // ..r8.p=.
                /* 01B8 */  0x70, 0x27, 0x70, 0xD2, 0x06, 0x64, 0xB3, 0xF3,  // p'p..d..
                /* 01C0 */  0xE0, 0x70, 0xE3, 0x3C, 0x99, 0x23, 0x2B, 0x55,  // .p.<.#+U
                /* 01C8 */  0x80, 0xD9, 0x13, 0x82, 0x4E, 0x13, 0x3E, 0x73,  // ....N.>s
                /* 01D0 */  0xB0, 0xBB, 0xC0, 0xF9, 0xF4, 0x0C, 0x49, 0xE4,  // ......I.
                /* 01D8 */  0x0F, 0x02, 0x35, 0x32, 0x43, 0xFB, 0x2C, 0xF0,  // ..52C.,.
                /* 01E0 */  0xEA, 0x61, 0xC8, 0x87, 0x85, 0xC3, 0x62, 0x62,  // .a....bb
                /* 01E8 */  0xCF, 0x1E, 0x74, 0x3C, 0xE0, 0x3F, 0x25, 0x3C,  // ..t<.?%<
                /* 01F0 */  0x6C, 0x78, 0xFA, 0x9E, 0xAF, 0x09, 0xA2, 0x3D,  // lx.....=
                /* 01F8 */  0x8F, 0x80, 0xE1, 0xFF, 0x7F, 0x1E, 0x81, 0x39,  // .......9
                /* 0200 */  0x9C, 0x07, 0x84, 0x27, 0x07, 0x76, 0x80, 0xC0,  // ...'.v..
                /* 0208 */  0x1C, 0x48, 0x80, 0xC9, 0xF9, 0x02, 0x77, 0x28,  // .H....w(
                /* 0210 */  0xF0, 0x10, 0xF8, 0x00, 0x1E, 0x25, 0xCE, 0xD1,  // .....%..
                /* 0218 */  0x4A, 0x67, 0x86, 0x3C, 0xB9, 0x80, 0x2D, 0xFB,  // Jg.<..-.
                /* 0220 */  0x1B, 0x40, 0x07, 0x0F, 0xE7, 0x06, 0x91, 0x8D,  // .@......
                /* 0228 */  0x57, 0x80, 0x09, 0x74, 0x38, 0xB1, 0x1E, 0x20,  // W..t8.. 
                /* 0230 */  0x4D, 0x14, 0x0C, 0x04, 0xD3, 0xD3, 0x6B, 0x00,  // M.....k.
                /* 0238 */  0x3E, 0x15, 0x38, 0x37, 0x89, 0x92, 0x0F, 0x8C,  // >.87....
                /* 0240 */  0xC2, 0x39, 0xEB, 0x79, 0x84, 0x82, 0x18, 0xD0,  // .9.y....
                /* 0248 */  0x41, 0x20, 0xE4, 0xE4, 0xA0, 0x80, 0x3A, 0xAA,  // A ....:.
                /* 0250 */  0xF8, 0x3C, 0x72, 0xAA, 0x0F, 0x3D, 0x9E, 0x94,  // .<r..=..
                /* 0258 */  0x47, 0xE1, 0xAB, 0x8A, 0x0F, 0x21, 0x3E, 0x4F,  // G....!>O
                /* 0260 */  0x78, 0xF4, 0x3E, 0x29, 0xF0, 0xEF, 0x8C, 0xAF,  // x.>)....
                /* 0268 */  0x0E, 0x46, 0xB7, 0x9A, 0xE3, 0x0A, 0x0A, 0xCC,  // .F......
                /* 0270 */  0x67, 0x11, 0x4E, 0x50, 0xD7, 0x6D, 0x01, 0xFA,  // g.NP.m..
                /* 0278 */  0x29, 0xE0, 0x08, 0x3C, 0x94, 0x77, 0x92, 0xC7,  // )..<.w..
                /* 0280 */  0x90, 0x04, 0xF5, 0x9D, 0x16, 0x40, 0x01, 0xE4,  // .....@..
                /* 0288 */  0x9B, 0x81, 0x4F, 0x02, 0x21, 0xFE, 0xFF, 0x4F,  // ..O.!..O
                /* 0290 */  0x07, 0x1E, 0xC3, 0xC3, 0x80, 0xD1, 0x8C, 0xCE,  // ........
                /* 0298 */  0xC3, 0x4F, 0x16, 0x15, 0x77, 0xB2, 0x14, 0xC4,  // .O..w...
                /* 02A0 */  0x93, 0x75, 0x94, 0xC9, 0xA2, 0x67, 0xE2, 0xAB,  // .u...g..
                /* 02A8 */  0x85, 0x27, 0x74, 0x4A, 0x41, 0xCE, 0xD1, 0x13,  // .'tJA...
                /* 02B0 */  0xF6, 0x55, 0x04, 0xD6, 0xF9, 0x20, 0xE4, 0x8B,  // .U... ..
                /* 02B8 */  0x81, 0xA7, 0x61, 0x38, 0x4F, 0x96, 0xC3, 0x79,  // ..a8O..y
                /* 02C0 */  0xB2, 0x7C, 0x2C, 0xBE, 0x6A, 0xC0, 0x1F, 0x2D,  // .|,.j..-
                /* 02C8 */  0x96, 0xA0, 0xC0, 0xD9, 0x82, 0x1C, 0x1E, 0x13,  // ........
                /* 02D0 */  0x6F, 0x54, 0xF4, 0x46, 0xE4, 0xE1, 0xF1, 0xCB,  // oT.F....
                /* 02D8 */  0x81, 0xE7, 0xF3, 0x8C, 0x70, 0x94, 0x6F, 0x12,  // ....p.o.
                /* 02E0 */  0x38, 0x8C, 0xC7, 0x12, 0x0F, 0xD1, 0x97, 0x23,  // 8......#
                /* 02E8 */  0x58, 0x13, 0x39, 0x69, 0xDF, 0x16, 0x4E, 0x36,  // X.9i..N6
                /* 02F0 */  0xE8, 0x4B, 0x10, 0xBB, 0x1C, 0x01, 0xBF, 0x88,  // .K......
                /* 02F8 */  0x26, 0x86, 0xC1, 0x22, 0x2D, 0x45, 0x11, 0x17,  // &.."-E..
                /* 0300 */  0x45, 0x61, 0x7C, 0xC5, 0x82, 0xFD, 0xFF, 0xBF,  // Ea|.....
                /* 0308 */  0x62, 0x01, 0x16, 0x04, 0x0F, 0x1B, 0x34, 0x87,  // b.....4.
                /* 0310 */  0x83, 0x97, 0x1E, 0x36, 0x6B, 0x38, 0x07, 0x99,  // ...6k8..
                /* 0318 */  0xD3, 0xF1, 0x48, 0x4E, 0x1B, 0xC6, 0x1D, 0x0B,  // ..HN....
                /* 0320 */  0xFE, 0x9D, 0xEA, 0xA9, 0xCA, 0xD3, 0x8A, 0xF2,  // ........
                /* 0328 */  0x64, 0xF5, 0x7A, 0xE5, 0x63, 0x96, 0xA1, 0xCE,  // d.z.c...
                /* 0330 */  0xE0, 0x1D, 0xCB, 0xB7, 0x3C, 0x4F, 0x21, 0x4A,  // ....<O!J
                /* 0338 */  0x9C, 0x97, 0x2D, 0x76, 0xC7, 0x32, 0x48, 0x50,  // ..-v.2HP
                /* 0340 */  0x23, 0x3F, 0x68, 0x31, 0x94, 0xE0, 0xF1, 0xDE,  // #?h1....
                /* 0348 */  0xB1, 0x00, 0x6F, 0xFF, 0xFF, 0x3B, 0x16, 0x60,  // ..o..;.`
                /* 0350 */  0xFC, 0x04, 0xC1, 0x09, 0x7C, 0xC7, 0x02, 0x1C,  // ....|...
                /* 0358 */  0xC5, 0x7E, 0x37, 0xE8, 0x4A, 0x45, 0xEE, 0x58,  // .~7.JE.X
                /* 0360 */  0x28, 0x0E, 0xAB, 0xB9, 0x63, 0x41, 0x9C, 0x28,  // (...cA.(
                /* 0368 */  0xE6, 0x8A, 0x05, 0x86, 0xFF, 0xFF, 0x15, 0x0B,  // ........
                /* 0370 */  0xE0, 0x75, 0xC0, 0x2B, 0x16, 0x68, 0xFE, 0xFF,  // .u.+.h..
                /* 0378 */  0x57, 0x2C, 0xF0, 0x5E, 0x8E, 0x80, 0xDF, 0x09,  // W,.^....
                /* 0380 */  0xD1, 0x77, 0x0D, 0x7E, 0x9A, 0xB6, 0xA2, 0xBB,  // .w.~....
                /* 0388 */  0x06, 0x94, 0x19, 0xBE, 0x07, 0xF9, 0xB0, 0x13,  // ........
                /* 0390 */  0x2C, 0xD2, 0xA3, 0x8D, 0x6F, 0x49, 0xE1, 0x7C,  // ,...oI.|
                /* 0398 */  0xDB, 0x00, 0xD8, 0xF2, 0xFF, 0xBF, 0x6D, 0x00,  // ......m.
                /* 03A0 */  0x4C, 0x19, 0xBF, 0x6F, 0x1B, 0xC0, 0x4F, 0xA1,  // L..o..O.
                /* 03A8 */  0x4D, 0x9F, 0x1A, 0x8D, 0x5A, 0x35, 0x28, 0x53,  // M...Z5(S
                /* 03B0 */  0xA3, 0x4C, 0x83, 0x5A, 0x7D, 0x2A, 0x35, 0x66,  // .L.Z}*5f
                /* 03B8 */  0x4C, 0xC9, 0xC1, 0xCE, 0x77, 0x0C, 0x2A, 0x6C,  // L...w.*l
                /* 03C0 */  0x65, 0x1A, 0x9A, 0x63, 0x81, 0xD0, 0x10, 0xC7,  // e..c....
                /* 03C8 */  0x26, 0x19, 0x01, 0x51, 0x22, 0x10, 0x01, 0x59,  // &..Q"..Y
                /* 03D0 */  0xFD, 0x6F, 0x42, 0x40, 0xCE, 0x02, 0x22, 0x20,  // .oB@.." 
                /* 03D8 */  0x2B, 0x58, 0x9A, 0xC0, 0x9D, 0xFF, 0xD8, 0x28,  // +X.....(
                /* 03E0 */  0x40, 0xA2, 0x02, 0x84, 0x29, 0x7D, 0x93, 0x09,  // @...)}..
                /* 03E8 */  0xD4, 0xB2, 0x41, 0x04, 0xF4, 0xFF, 0x3F, 0x42,  // ..A...?B
                /* 03F0 */  0xD9, 0x00, 0x62, 0x82, 0x41, 0x04, 0x64, 0x91,  // ..b.A.d.
                /* 03F8 */  0x3E, 0x80, 0x98, 0x62, 0x10, 0x01, 0x59, 0xDD,  // >..b..Y.
                /* 0400 */  0xA3, 0x40, 0x40, 0xD6, 0x0A, 0x22, 0x20, 0xFF,  // .@@.." .
                /* 0408 */  0xFF, 0x01                                       // ..
            })
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Mutex (BFWM, 0x07)
            Method (MHCF, 1, NotSerialized)
            {
                Local0 = \BFWC (Arg0)
                Return (Local0)
            }

            Method (MHPF, 1, NotSerialized)
            {
                Name (RETB, Buffer (0x25){})
                Acquire (BFWM, 0xFFFF)
                If ((SizeOf (Arg0) <= 0x25))
                {
                    \BFWB = Arg0
                    If (\BFWP ())
                    {
                        \_SB.PCI0.LPC.EC.CHKS ()
                        \BFWL ()
                    }

                    RETB = \BFWB
                }

                Release (BFWM)
                Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHPF.RETB */
            }

            Method (MHIF, 1, NotSerialized)
            {
                Name (RETB, Buffer (0x0A){})
                Acquire (BFWM, 0xFFFF)
                \BFWG (Arg0)
                RETB = \BFWB
                Release (BFWM)
                Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHIF.RETB */
            }

            Method (MHDM, 1, NotSerialized)
            {
                \BDMC (Arg0)
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Method (PSSG, 1, NotSerialized)
            {
                Return (\PSIF (0x00, 0x00))
            }

            Method (PSSS, 1, NotSerialized)
            {
                Return (\PSIF (0x01, Arg0))
            }

            Method (PSBS, 1, NotSerialized)
            {
                Return (\PSIF (0x02, Arg0))
            }

            Method (BICG, 1, NotSerialized)
            {
                Return (\PSIF (0x03, Arg0))
            }

            Method (BICS, 1, NotSerialized)
            {
                Return (\PSIF (0x04, Arg0))
            }

            Method (BCTG, 1, NotSerialized)
            {
                Return (\PSIF (0x05, Arg0))
            }

            Method (BCCS, 1, NotSerialized)
            {
                Return (\PSIF (0x06, Arg0))
            }

            Method (BCSG, 1, NotSerialized)
            {
                Return (\PSIF (0x07, Arg0))
            }

            Method (BCSS, 1, NotSerialized)
            {
                Return (\PSIF (0x08, Arg0))
            }

            Method (BDSG, 1, NotSerialized)
            {
                Return (\PSIF (0x09, Arg0))
            }

            Method (BDSS, 1, NotSerialized)
            {
                Return (\PSIF (0x0A, Arg0))
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Method (GILN, 0, NotSerialized)
            {
                Return ((0x02 | \ILNF))
            }

            Method (SILN, 1, NotSerialized)
            {
                If ((0x01 == Arg0))
                {
                    \ILNF = 0x01
                    BBLS = 0x00
                    Return (0x00)
                }
                ElseIf ((0x02 == Arg0))
                {
                    \ILNF = 0x00
                    BBLS = 0x01
                    Return (0x00)
                }
                Else
                {
                    Return (0x01)
                }
            }

            Method (GLSI, 0, NotSerialized)
            {
                If (\H8DR)
                {
                    Return ((0x02 + \_SB.PCI0.LPC.EC.HPLD))
                }
                ElseIf ((\RBEC (0x46) & 0x04))
                {
                    Return (0x03)
                }
                Else
                {
                    Return (0x02)
                }
            }
        }

        Scope (\_SB.PCI0.LPC.EC.HKEY)
        {
            Method (GDLN, 0, NotSerialized)
            {
                Return ((0x02 | \PLUX))
            }

            Method (SDLN, 1, NotSerialized)
            {
                If ((0x01 == Arg0))
                {
                    \PLUX = 0x01
                    Return (0x00)
                }
                ElseIf ((0x02 == Arg0))
                {
                    \PLUX = 0x00
                    Return (0x00)
                }
                Else
                {
                    Return (0x01)
                }
            }
        }

        Name (\VHCC, 0x00)
        Scope (\_SB.PCI0.PEG.VID)
        {
            Method (ISOP, 0, NotSerialized)
            {
                Return ((VDSP && (VIGD && VDSC)))
            }
        }

        Scope (\_SB.PCI0)
        {
            Name (OTM, "OTMACPI 2009-Nov-12 18:18:51")
        }

        Scope (\_SB.PCI0.PEG.VID)
        {
            Method (GOBT, 1, NotSerialized)
            {
                Name (OPVK, Buffer (0xE6)
                {
                    /* 0000 */  0xE4, 0xB8, 0x4F, 0x51, 0x50, 0x72, 0x8A, 0xC2,  // ..OQPr..
                    /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,  // KV......
                    /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,  // 14859745
                    /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,  // 6985Genu
                    /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  // ine NVID
                    /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  // IA Certi
                    /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,  // fied Opt
                    /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,  // imus Rea
                    /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,  // dy Mothe
                    /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,  // rboard f
                    /* 0050 */  0x6F, 0x72, 0x20, 0x36, 0x38, 0x38, 0x33, 0x32,  // or 68832
                    /* 0058 */  0x35, 0x6E, 0x6F, 0x7A, 0x6F, 0x6D, 0x69, 0x32,  // 5nozomi2
                    /* 0060 */  0x31, 0x44, 0x35, 0x20, 0x20, 0x20, 0x20, 0x20,  // 1D5     
                    /* 0068 */  0x2D, 0x20, 0x40, 0x4A, 0x20, 0x24, 0x55, 0x27,  // - @J $U'
                    /* 0070 */  0x5C, 0x22, 0x54, 0x20, 0x29, 0x5F, 0x47, 0x42,  // \"T )_GB
                    /* 0078 */  0x20, 0x50, 0x2F, 0x41, 0x4F, 0x5C, 0x37, 0x22,  //  P/AO\7"
                    /* 0080 */  0x3D, 0x46, 0x37, 0x39, 0x4B, 0x37, 0x2B, 0x5F,  // =F79K7+_
                    /* 0088 */  0x3F, 0x4B, 0x48, 0x5C, 0x5F, 0x46, 0x58, 0x48,  // ?KH\_FXH
                    /* 0090 */  0x5F, 0x44, 0x57, 0x32, 0x26, 0x4A, 0x46, 0x50,  // _DW2&JFP
                    /* 0098 */  0x52, 0x25, 0x24, 0x2F, 0x46, 0x24, 0x20, 0x2D,  // R%$/F$ -
                    /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,  //  Copyrig
                    /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,  // ht 2010 
                    /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,  // NVIDIA C
                    /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,  // orporati
                    /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,  // on All R
                    /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,  // ights Re
                    /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,  // served-1
                    /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,  // 48597456
                    /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29               // 985(R)
                })
                CreateWordField (Arg0, 0x02, USRG)
                If ((USRG == 0x564B))
                {
                    Return (OPVK) /* \_SB_.PCI0.PEG_.VID_.GOBT.OPVK */
                }

                Return (Zero)
            }
        }

        Scope (\_SB.PCI0.PEG.VID)
        {
            Name (OMPR, 0x02)
            Name (HDAS, 0x00)
            Method (NVOP, 4, NotSerialized)
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                Debug = "------- NV OPTIMUS DSM --------"
                If ((Arg1 != 0x0100))
                {
                    Return (0x80000001)
                }

                _T_0 = ToInteger (Arg2)
                If ((_T_0 == 0x00))
                {
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    Divide (0x00, 0x08, Local2, Local1)
                    Local2 = (0x01 << Local2)
                    Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                    Divide (0x1A, 0x08, Local2, Local1)
                    Local2 = (0x01 << Local2)
                    Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                    Divide (0x1B, 0x08, Local2, Local1)
                    Local2 = (0x01 << Local2)
                    Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                    Divide (0x10, 0x08, Local2, Local1)
                    Local2 = (0x01 << Local2)
                    Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x1A))
                {
                    CreateField (Arg3, 0x18, 0x02, OPCE)
                    CreateField (Arg3, 0x00, 0x01, FLCH)
                    If (ToInteger (FLCH))
                    {
                        OMPR = OPCE /* \_SB_.PCI0.PEG_.VID_.NVOP.OPCE */
                    }

                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    CreateField (Local0, 0x00, 0x01, OPEN)
                    CreateField (Local0, 0x03, 0x02, CGCS)
                    CreateField (Local0, 0x06, 0x01, SHPC)
                    CreateField (Local0, 0x18, 0x03, DGPC)
                    CreateField (Local0, 0x1B, 0x02, HDAC)
                    OPEN = One
                    SHPC = One
                    DGPC = One
                    If (\_SB.PCI0.PEG.VID._STA ())
                    {
                        CGCS = 0x03
                    }

                    HDAC = 0x02
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x1B))
                {
                    CreateField (Arg3, 0x00, 0x01, HDAU)
                    CreateField (Arg3, 0x01, 0x01, HDAR)
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    CreateField (Local0, 0x02, 0x02, RQGS)
                    CreateField (Local0, 0x04, 0x01, PWST)
                    PWST = One
                    If ((\_SB.PCI0.LPC.EC.DOCD && \_SB.PCI0.LPC.EC.AC._PSR ()))
                    {
                        RQGS = One
                    }
                    Else
                    {
                        RQGS = Zero
                    }

                    If (ToInteger (HDAR))
                    {
                        HDAS = ToInteger (HDAU)
                    }

                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x10))
                {
                    Return (\_SB.PCI0.PEG.VID.GOBT (Arg3))
                }

                Return (0x80000002)
            }
        }

        Scope (\)
        {
            Method (CMPB, 2, NotSerialized)
            {
                Local1 = SizeOf (Arg0)
                If ((Local1 != SizeOf (Arg1)))
                {
                    Return (0x00)
                }

                Local0 = 0x00
                While ((Local0 < Local1))
                {
                    If ((DerefOf (Arg0 [Local0]) != DerefOf (Arg1 [Local0]
                        )))
                    {
                        Return (0x00)
                    }

                    Local0++
                }

                Return (0x01)
            }
        }

        Scope (\_SB.PCI0.PEG.VID)
        {
            Name (CPPC, 0x00)
            Method (NVPS, 4, NotSerialized)
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                Debug = "------- NV GPS DSM --------"
                _T_0 = ToInteger (Arg2)
                If ((_T_0 == 0x00))
                {
                    Local0 = Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }
                    Local3 = Buffer (0x07)
                        {
                             0x00, 0x20, 0x21, 0x22, 0x23, 0x2A, 0xFF         // . !"#*.
                        }
                    Local4 = Zero
                    Local5 = DerefOf (Local3 [Local4])
                    While ((Local5 != 0xFF))
                    {
                        Divide (Local5, 0x08, Local2, Local1)
                        Local2 = (0x01 << Local2)
                        Local0 [Local1] = (DerefOf (Local0 [Local1]) | Local2)
                        Local4++
                        Local5 = DerefOf (Local3 [Local4])
                    }

                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x20))
                {
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    CreateField (Local0, 0x18, 0x01, CUIT)
                    CreateField (Local0, 0x1E, 0x01, PSER)
                    CUIT = One
                    PSER = One
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x21))
                {
                    Return (\_PR.CPU0._PSS) /* External reference */
                }
                ElseIf ((_T_0 == 0x22))
                {
                    CreateField (Arg3, 0x00, 0x08, PPCV)
                    CPPC = PPCV /* \_SB_.PCI0.PEG_.VID_.NVPS.PPCV */
                    \PNTF (0x80)
                    Return (Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00                           // ....
                    })
                }
                ElseIf ((_T_0 == 0x23))
                {
                    Local0 = Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    Local0 [0x00] = CPPC /* \_SB_.PCI0.PEG_.VID_.CPPC */
                    Return (Local0)
                }
                ElseIf ((_T_0 == 0x2A))
                {
                    Local0 = Buffer (0x24)
                        {
                            /* 0000 */  0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0020 */  0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    Local0 [0x00] = DerefOf (Arg3 [0x00])
                    CreateField (Arg3, 0x00, 0x04, QTYP)
                    _T_1 = ToInteger (QTYP)
                    If ((_T_1 == 0x00))
                    {
                        Local1 = \_SB.PCI0.LPC.EC.TMP0
                        Local0 [0x0C] = (Local1 & 0xFF)
                        Return (Local0)
                    }
                    ElseIf ((_T_1 == 0x01))
                    {
                        Local0 [0x0D] = 0x08
                        Local0 [0x01] = 0x03
                        Return (Local0)
                    }
                    ElseIf ((_T_1 == 0x02))
                    {
                        Local0 [0x01] = Zero
                        Return (Local0)
                    }
                }

                Return (Buffer (0x04)
                {
                     0x02, 0x00, 0x00, 0x80                           // ....
                })
            }
        }
    }

    Scope (\_SB.PCI0.EHC2.URTH.URMH.PRTC)
    {
        Name (_EJD, "\\_SB.GDCK")  // _EJD: Ejection Dependent Device
    }

    Scope (\_SB.PCI0.EHC1.URTH.URMH.PRT5)
    {
        Name (_EJD, "\\_SB.PCI0.EXP3.SLOT")  // _EJD: Ejection Dependent Device
    }

    Scope (\_SB.PCI0.EXP3.SLOT)
    {
        Name (_EJD, "\\_SB.PCI0.EHC1.URTH.URMH.PRT5")  // _EJD: Ejection Dependent Device
    }

    Name (\_S0, Package (0x04)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        0x00, 
        0x00
    })
    Method (\_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Local0 = 0x01
        If ((Arg0 == \SPS))
        {
            Local0 = 0x00
        }

        If (((Arg0 == 0x00) || (Arg0 >= 0x06)))
        {
            Local0 = 0x00
        }

        If (Local0)
        {
            \SPS = Arg0
            \_SB.PCI0.LPC.EC.HKEY.MHKE (0x00)
            If (\_SB.PCI0.LPC.EC.KBLT)
            {
                \UCMS (0x0D)
            }

            If ((Arg0 == 0x01))
            {
                \FNID = \_SB.PCI0.LPC.EC.HFNI
                \_SB.PCI0.LPC.EC.HFNI = 0x00
                \_SB.PCI0.LPC.EC.HFSP = 0x00
            }

            If ((Arg0 == 0x03))
            {
                \VVPD (0x03)
                \TRAP ()
                \ACST = \_SB.PCI0.LPC.EC.AC._PSR ()
                \APIN = 0x00
            }

            If ((Arg0 == 0x04))
            {
                If (VDSP)
                {
                    SHA1 = Zero
                }

                If (XPFG)
                {
                    If (VDSC)
                    {
                        SVHC = 0x01
                    }
                }

                \_SB.SLPB._PSW (0x00)
                \TRAP ()
                \_SB.PCI0.LPC.TPM.CMOR ()
                \AWON (0x04)
                \APIN = 0x00
            }

            If ((Arg0 == 0x05))
            {
                \TRAP ()
                \_SB.PCI0.LPC.TPM.CMOR ()
                \AWON (0x05)
            }

            \_SB.PCI0.LPC.EC.BPTS (Arg0)
            If ((Arg0 >= 0x04))
            {
                \_SB.PCI0.LPC.EC.HWLB = 0x00
            }
            Else
            {
                \_SB.PCI0.LPC.EC.HWLB = 0x01
            }

            If ((Arg0 != 0x05))
            {
                \_SB.PCI0.LPC.EC.HCMU = 0x01
                \_SB.PCI0.EXP1.PDSF = \_SB.PCI0.EXP1.PDS
                \_SB.PCI0.EXP3.PDSF = \_SB.PCI0.EXP3.PDS
            }

            \_SB.PCI0.LPC.EC.HKEY.WGPS (Arg0)
        }
    }

    Name (WAKI, Package (0x02)
    {
        0x00, 
        0x00
    })
    Method (\_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (((Arg0 == 0x00) || (Arg0 >= 0x05)))
        {
            Return (WAKI) /* \WAKI */
        }

        \SPS = 0x00
        \_SB.PCI0.LPC.EC.HCMU = 0x00
        \_SB.PCI0.LPC.EC.EVNT (0x01)
        \_SB.PCI0.LPC.EC.HKEY.MHKE (0x01)
        \_SB.PCI0.LPC.EC.FNST ()
        \UCMS (0x0D)
        \LIDB = 0x00
        If ((Arg0 == 0x01))
        {
            \FNID = \_SB.PCI0.LPC.EC.HFNI
        }

        If ((Arg0 == 0x03))
        {
            \NVSS (0x00)
            \PWRS = \_SB.PCI0.LPC.EC.AC._PSR ()
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            If ((\ACST != \_SB.PCI0.LPC.EC.AC._PSR ()))
            {
                \_SB.PCI0.LPC.EC.ATMC ()
            }

            If (\SCRM)
            {
                \_SB.PCI0.LPC.EC.HFSP = 0x07
                If (\MTAU)
                {
                    Local2 = 0x03E8
                    While ((\_SB.PCI0.LPC.EC.PIBS && Local2))
                    {
                        Sleep (0x01)
                        Local2--
                    }

                    If (Local2)
                    {
                        \_SB.PCI0.LPC.EC.PLSL = 0x01
                        \_SB.PCI0.LPC.EC.PLTU = \MTAU
                        \_SB.PCI0.LPC.EC.PLLS = \PL1L
                        \_SB.PCI0.LPC.EC.PLMS = \PL1M
                    }
                }
            }

            If ((\ISWK == 0x01))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6070)
                }
            }

            If (\VIGD)
            {
                \_SB.PCI0.VID.GLIS (\_SB.LID._LID ())
                If (\WVIS)
                {
                    \VBTD ()
                }
            }
            ElseIf (\WVIS)
            {
                \_SB.PCI0.VID.GLIS (\_SB.LID._LID ())
                \VBTD ()
            }

            \VCMS (0x01, \_SB.LID._LID ())
            \AWON (0x00)
            If (\CMPR)
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
                \CMPR = 0x00
            }

            If ((\USBR || \_SB.PCI0.XHCI.XRST))
            {
                If (((\XHCM == 0x02) || (\XHCM == 0x03)))
                {
                    Local0 = 0x00
                    Local0 = (\_SB.PCI0.XHCI.PR3 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                    \_SB.PCI0.XHCI.PR3 = (Local0 & \_SB.PCI0.XHCI.PR3M)
                    Local0 = 0x00
                    Local0 = (\_SB.PCI0.XHCI.PR2 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                    \_SB.PCI0.XHCI.PR2 = (Local0 & \_SB.PCI0.XHCI.PR2M)
                }
            }
        }

        If ((Arg0 == 0x04))
        {
            \NVSS (0x00)
            \_SB.PCI0.LPC.EC.HSPA = 0x00
            \PWRS = \_SB.PCI0.LPC.EC.AC._PSR ()
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            \_SB.PCI0.LPC.EC.ATMC ()
            If (\SCRM)
            {
                \_SB.PCI0.LPC.EC.HFSP = 0x07
                If (\MTAU)
                {
                    Local2 = 0x03E8
                    While ((\_SB.PCI0.LPC.EC.PIBS && Local2))
                    {
                        Sleep (0x01)
                        Local2--
                    }

                    If (Local2)
                    {
                        \_SB.PCI0.LPC.EC.PLSL = 0x01
                        \_SB.PCI0.LPC.EC.PLTU = \MTAU
                        \_SB.PCI0.LPC.EC.PLLS = \PL1L
                        \_SB.PCI0.LPC.EC.PLMS = \PL1M
                    }
                }
            }

            If (XPFG)
            {
                If (VDSC)
                {
                    SVHC = 0x00
                }
            }

            If (!\NBCF)
            {
                If (\VIGD)
                {
                    \_SB.PCI0.LPC.EC.BRNS ()
                }
                Else
                {
                    \VBRC (\BRLV)
                }
            }

            If ((\ISWK == 0x02))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6080)
                }
            }

            If (\_SB.PCI0.XHCI.XRST)
            {
                If (((\XHCM == 0x02) || (\XHCM == 0x03)))
                {
                    Local0 = 0x00
                    Local0 = (\_SB.PCI0.XHCI.PR3 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                    \_SB.PCI0.XHCI.PR3 = (Local0 & \_SB.PCI0.XHCI.PR3M)
                    Local0 = 0x00
                    Local0 = (\_SB.PCI0.XHCI.PR2 & 0xFFFFFFF0)
                    Local0 |= \XHPM
                }
            }
        }

        If ((\_SB.PCI0.EXP1.PDS ^ \_SB.PCI0.EXP1.PDSF))
        {
            \_SB.PCI0.EXP1.PDSF = \_SB.PCI0.EXP1.PDS
            Notify (\_SB.PCI0.EXP1, 0x00) // Bus Check
        }

        If ((\_SB.PCI0.EXP3.PDS ^ \_SB.PCI0.EXP3.PDSF))
        {
            \_SB.PCI0.EXP3.PDSF = \_SB.PCI0.EXP3.PDS
            Notify (\_SB.PCI0.EXP3, 0x00) // Bus Check
        }

        \_SB.PCI0.LPC.EC.BATW (Arg0)
        \_SB.PCI0.LPC.EC.BWAK (Arg0)
        \_SB.PCI0.LPC.EC.HKEY.WGWK (Arg0)
        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
        \VSLD (\_SB.LID._LID ())
        If (\VIGD)
        {
            \_SB.PCI0.VID.GLIS (\_SB.LID._LID ())
        }
        ElseIf (\WVIS)
        {
            \_SB.PCI0.VID.GLIS (\_SB.LID._LID ())
        }

        If ((Arg0 < 0x04))
        {
            If ((\RRBF & 0x02))
            {
                Local0 = (Arg0 << 0x08)
                Local0 = (0x2013 | Local0)
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (Local0)
            }
        }

        If ((Arg0 == 0x04))
        {
            Local0 = 0x00
            Local1 = \CSUM (0x00)
            If ((Local1 != \CHKC))
            {
                Local0 = 0x01
                \CHKC = Local1
            }

            Local1 = \CSUM (0x01)
            If ((Local1 != \CHKE))
            {
                Local0 = 0x01
                \CHKE = Local1
            }

            If (Local0)
            {
                Notify (\_SB, 0x00) // Bus Check
            }
        }

        \RRBF = Zero
        Return (WAKI) /* \WAKI */
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            If ((Arg0 == 0x00))
            {
                \_SB.PCI0.LPC.EC.LED (0x00, 0x00)
                \_SB.PCI0.LPC.EC.LED (0x07, 0x00)
            }

            If ((Arg0 == 0x01))
            {
                If ((\SPS || \WNTF))
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x05)
                }

                \_SB.PCI0.LPC.EC.LED (0x00, 0x80)
                \_SB.PCI0.LPC.EC.LED (0x07, 0x00)
            }

            If ((Arg0 == 0x02))
            {
                \_SB.PCI0.LPC.EC.LED (0x00, 0xC0)
                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
            }

            If ((Arg0 == 0x03))
            {
                If ((\SPS > 0x03))
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x07)
                }
                ElseIf ((\SPS == 0x03))
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x03)
                }
                Else
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x04)
                }

                If ((\SPS == 0x03)){}
                Else
                {
                    \_SB.PCI0.LPC.EC.LED (0x00, 0x80)
                }

                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
                \_SB.PCI0.LPC.EC.LED (0x00, 0xC0)
            }

            If ((Arg0 == 0x04))
            {
                \_SB.PCI0.LPC.EC.BEEP (0x03)
                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
                \_SB.PCI0.LPC.EC.LED (0x00, 0xC0)
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Local0 = \_SB.PCI0.LPC.EC.HWAK
            \RRBF = Local0
            Sleep (0x0A)
            If ((Local0 & 0x02)){}
            If ((Local0 & 0x04))
            {
                Notify (\_SB.LID, 0x02) // Device Wake
            }

            If ((Local0 & 0x08))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x10))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x40)){}
            If ((Local0 & 0x80))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If (\_SB.PCI0.EXP1.PS)
            {
                \_SB.PCI0.EXP1.PS = 0x01
                \_SB.PCI0.EXP1.PMCS = 0x01
                Notify (\_SB.PCI0.EXP1, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EXP2.PS)
            {
                \_SB.PCI0.EXP2.PS = 0x01
                \_SB.PCI0.EXP2.PMCS = 0x01
                Notify (\_SB.PCI0.EXP2, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EXP3.PS)
            {
                \_SB.PCI0.EXP3.PS = 0x01
                \_SB.PCI0.EXP3.PMCS = 0x01
                Notify (\_SB.PCI0.EXP3, 0x02) // Device Wake
            }
        }

        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If (\_SB.PCI0.EXP1.HPCS)
            {
                Sleep (0x64)
                \_SB.PCI0.EXP1.HPCS = 0x01
                If (\_SB.PCI0.EXP1.PDC)
                {
                    \_SB.PCI0.EXP1.PDC = 0x01
                    \_SB.PCI0.EXP1.PDSF = \_SB.PCI0.EXP1.PDS
                    Notify (\_SB.PCI0.EXP1, 0x00) // Bus Check
                }
            }

            If (\_SB.PCI0.EXP3.HPCS)
            {
                Sleep (0x64)
                \_SB.PCI0.EXP3.HPCS = 0x01
                If (\_SB.PCI0.EXP3.PDC)
                {
                    \_SB.PCI0.EXP3.PDC = 0x01
                    \_SB.PCI0.EXP3.PDSF = \_SB.PCI0.EXP3.PDS
                    Notify (\_SB.PCI0.EXP3, 0x00) // Bus Check
                }
            }
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            \_SB.PCI0.LPC.SWGE = 0x00
            If ((\CWUE && (\SWGP & 0x02)))
            {
                \SWGP &= ~0x02
                If (\OSC4)
                {
                    \PNTF (0x81)
                }
            }
        }

        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If (\_SB.PCI0.VID.GSSE)
            {
                \_SB.PCI0.VID.GSCI ()
            }
            Else
            {
                \_SB.PCI0.LPC.SCIS = 0x01
            }
        }

        Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            If (\_SB.PCI0.PEG.VID.ISOP ())
            {
                If (!\_SB.PCI0.LPC.XHPD)
                {
                    Notify (\_SB.PCI0.PEG.VID, 0x81) // Information Change
                }
            }

            \_SB.PCI0.LPC.XHPD ^= 0x01
        }
    }

    Scope (\_SB.PCI0.LPC.EC.HKEY)
    {
        Method (MHQT, 1, NotSerialized)
        {
            If ((\WNTF && \TATC))
            {
                If ((Arg0 == 0x00))
                {
                    Local0 = \TATC
                    Return (Local0)
                }
                ElseIf ((Arg0 == 0x01))
                {
                    Local0 = \TDFA
                    Local0 += (\TDTA << 0x04)
                    Local0 += (\TDFD << 0x08)
                    Local0 += (\TDTD << 0x0C)
                    Local0 += (\TNFT << 0x10)
                    Local0 += (\TNTT << 0x14)
                    Return (Local0)
                }
                ElseIf ((Arg0 == 0x02))
                {
                    Local0 = \TCFA
                    Local0 += (\TCTA << 0x04)
                    Local0 += (\TCFD << 0x08)
                    Local0 += (\TCTD << 0x0C)
                    Return (Local0)
                }
                ElseIf ((Arg0 == 0x03)){}
                ElseIf ((Arg0 == 0x04))
                {
                    Local0 = \TATW
                    Return (Local0)
                }
                Else
                {
                    Noop
                }
            }

            Return (0x00)
        }

        Method (MHAT, 1, NotSerialized)
        {
            If ((\WNTF && \TATC))
            {
                Local0 = (Arg0 & 0xFF)
                If (!ATMV (Local0))
                {
                    Return (0x00)
                }

                Local0 = ((Arg0 >> 0x08) & 0xFF)
                If (!ATMV (Local0))
                {
                    Return (0x00)
                }

                \TCFA = (Arg0 & 0x0F)
                \TCTA = ((Arg0 >> 0x04) & 0x0F)
                \TCFD = ((Arg0 >> 0x08) & 0x0F)
                \TCTD = ((Arg0 >> 0x0C) & 0x0F)
                ATMC ()
                If ((\PPMF & 0x80))
                {
                    Local1 = \FTPS
                    If ((Arg0 & 0x00010000))
                    {
                        \FTPS = 0x01
                    }
                    Else
                    {
                        \FTPS = 0x00
                    }

                    If ((\FTPS ^ Local1))
                    {
                        If (\OSPX)
                        {
                            \PNTF (0x80)
                        }
                    }
                }

                Local2 = \SCRM
                If ((Arg0 & 0x00040000))
                {
                    \SCRM = 0x01
                    \_SB.PCI0.LPC.EC.HFSP = 0x07
                }
                Else
                {
                    \SCRM = 0x00
                    \_SB.PCI0.LPC.EC.HFSP = 0x80
                }

                Local3 = \ETAU
                If ((Arg0 & 0x00020000))
                {
                    \ETAU = 0x01
                }
                Else
                {
                    \ETAU = 0x00
                }

                If (\MTAU)
                {
                    If (((\SCRM ^ Local2) || (\ETAU ^ Local3)))
                    {
                        Local4 = 0x03E8
                        While (\_SB.PCI0.LPC.EC.PIBS)
                        {
                            Sleep (0x01)
                            Local4--
                            If (!Local4)
                            {
                                Return (0x00)
                            }
                        }

                        \_SB.PCI0.LPC.EC.PLSL = 0x01
                        If ((Arg0 & 0x00060000))
                        {
                            \_SB.PCI0.LPC.EC.PLTU = \MTAU
                        }
                        Else
                        {
                            \_SB.PCI0.LPC.EC.PLTU = 0x1C
                        }

                        \_SB.PCI0.LPC.EC.PLLS = \PL1L
                        \_SB.PCI0.LPC.EC.PLMS = \PL1M
                    }
                }

                Return (0x01)
            }

            Return (0x00)
        }

        Method (MHGT, 1, NotSerialized)
        {
            If ((\WNTF && \TATC))
            {
                Local0 = 0x01000000
                If ((\PPMF & 0x80))
                {
                    Local0 |= 0x08000000
                }

                If (\SCRM)
                {
                    Local0 |= 0x10000000
                }

                If (\ETAU)
                {
                    Local0 |= 0x04000000
                }

                If (\FTPS)
                {
                    Local0 |= 0x02000000
                }

                Local0 += (\TSFT << 0x10)
                Local0 += (\TSTT << 0x14)
                Local1 = (Arg0 & 0xFF)
                If (!ATMV (Local1))
                {
                    Local0 |= 0xFFFF
                    Return (Local0)
                }

                Local1 = (Arg0 & 0x0F)
                If ((Local1 == 0x00))
                {
                    Local0 += \TIF0
                }
                ElseIf ((Local1 == 0x01))
                {
                    Local0 += \TIF1
                }
                ElseIf ((Local1 == 0x02))
                {
                    Local0 += \TIF2
                }
                Else
                {
                    Local0 += 0xFF
                }

                Local1 = ((Arg0 >> 0x04) & 0x0F)
                If ((Local1 == 0x00))
                {
                    Local0 += (\TIT0 << 0x08)
                }
                ElseIf ((Local1 == 0x01))
                {
                    Local0 += (\TIT1 << 0x08)
                }
                ElseIf ((Local1 == 0x02))
                {
                    Local0 += (\TIT2 << 0x08)
                }
                Else
                {
                    Local0 += (0xFF << 0x08)
                }

                Return (Local0)
            }

            Return (0x00)
        }

        Method (ATMV, 1, NotSerialized)
        {
            Local1 = (Arg0 & 0x0F)
            Local0 = \TNFT
            If ((Local1 >= Local0))
            {
                Return (0x00)
            }

            Local2 = ((Arg0 >> 0x04) & 0x0F)
            Local0 = \TNTT
            If ((Local2 >= Local0))
            {
                Return (0x00)
            }

            If (\TATL)
            {
                If ((Local1 ^ Local2))
                {
                    Return (0x00)
                }
            }

            Return (0x01)
        }

        Method (MHCT, 1, NotSerialized)
        {
            Local0 = 0x00
            If (\SPEN)
            {
                Local0 = \LWST
                Local0++
                Local0 <<= 0x08
            }

            Local1 = 0x08
            Local1 <<= 0x08
            If ((Arg0 == 0xFFFFFFFF))
            {
                Local1 |= \TPCR
                If (\SPEN)
                {
                    Local0 |= \PPCR
                    If (!(\PPMF && 0x02000000))
                    {
                        Local1 |= 0x80
                    }

                    If (!(\PPMF && 0x08000000))
                    {
                        Local1 |= 0x40
                    }
                }
                Else
                {
                    Local1 |= 0xC0
                }
            }
            Else
            {
                If ((\OSPX && \SPEN))
                {
                    Local2 = (Arg0 & 0x00FF0000)
                    Local2 >>= 0x10
                    Local0 |= Local2
                    If ((Local2 ^ \PPCR))
                    {
                        \PPCA = Local2
                        \PNTF (0x80)
                    }
                }

                If (\WVIS)
                {
                    Local2 = (Arg0 & 0x1F)
                    Local1 |= Local2
                    If ((Local2 ^ \TPCR))
                    {
                        \TPCA = Local2
                        \PNTF (0x82)
                    }
                }
            }

            Local0 <<= 0x10
            Local0 |= Local1
            Return (Local0)
        }
    }

    Scope (\_SB.PCI0.LPC.EC)
    {
        Method (ATMC, 0, NotSerialized)
        {
            If ((\WNTF && \TATC))
            {
                If (HPAC)
                {
                    Local0 = \TCFA
                    Local1 = \TCTA
                    Local2 = ((Local1 << 0x04) | Local0)
                    Local3 = (Local2 ^ ATMX) /* \_SB_.PCI0.LPC_.EC__.ATMX */
                    ATMX = Local2
                    If ((\TCTA == 0x00))
                    {
                        \TCRT = \TCR0
                        \TPSV = \TPS0
                    }
                    ElseIf ((\TCTA == 0x01))
                    {
                        \TCRT = \TCR1
                        \TPSV = \TPS1
                    }
                    Else
                    {
                    }
                }
                Else
                {
                    Local0 = \TCFD
                    Local1 = \TCTD
                    Local2 = ((Local1 << 0x04) | Local0)
                    Local3 = (Local2 ^ ATMX) /* \_SB_.PCI0.LPC_.EC__.ATMX */
                    ATMX = Local2
                    If ((\TCTD == 0x00))
                    {
                        \TCRT = \TCR0
                        \TPSV = \TPS0
                    }
                    ElseIf ((\TCTD == 0x01))
                    {
                        \TCRT = \TCR1
                        \TPSV = \TPS1
                    }
                    Else
                    {
                    }
                }

                If (Local3)
                {
                    If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6030)
                    }
                }

                Notify (\_TZ.THM0, 0x81) // Thermal Trip Point Change
            }
        }
    }

    Scope (\_TZ)
    {
        ThermalZone (THM0)
        {
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\TCRT)
            }

            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                If (\H8DR)
                {
                    Local0 = \_SB.PCI0.LPC.EC.TMP0
                    Local1 = \_SB.PCI0.LPC.EC.TSL2
                    Local2 = \_SB.PCI0.LPC.EC.TSL3
                }
                Else
                {
                    Local0 = \RBEC (0x78)
                    Local1 = (\RBEC (0x8A) & 0x7F)
                    Local2 = (\RBEC (0x8B) & 0x7F)
                }

                If ((Local0 == 0x80))
                {
                    Local0 = 0x30
                }

                Local3 = ((\_SB.PCI0.LPC.PIDH << 0x02) | \_SB.PCI0.LPC.PIDL)
                If ((Local3 < 0x03))
                {
                    Local2 &= 0xF7
                }

                If (Local2)
                {
                    \TSDL ()
                    Return (C2K (0x80))
                }

                If (!\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    If (Local1)
                    {
                        \TSDL ()
                        Return (C2K (0x80))
                    }
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Local0 = ((Arg0 * 0x0A) + 0x0AAC)
            If ((Local0 <= 0x0AAC))
            {
                Local0 = 0x0BB8
            }

            If ((Local0 > 0x0FAC))
            {
                Local0 = 0x0BB8
            }

            Return (Local0)
        }
    }

    Scope (\_SB.PCI0.LPC.EC)
    {
        Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\_TZ.THM0, 0x80) // Thermal Status Change
            If (\H8DR)
            {
                Local1 = \_SB.PCI0.LPC.EC.TSL2
            }
            Else
            {
                Local1 = (\RBEC (0x8A) & 0x7F)
            }

            If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
            {
                If (Local1)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6022)
                }
            }

            If (VIGD)
            {
                Noop
            }
            Else
            {
                \VTHR ()
            }

            If ((\PPMF & 0x01))
            {
                If (\OSPX)
                {
                    \PNTF (0x80)
                }
                Else
                {
                    Local2 = (\_SB.PCI0.LPC.EC.TSL0 & 0x77)
                    If (Local2)
                    {
                        \STEP (0x09)
                    }
                    Else
                    {
                        \STEP (0x0A)
                    }
                }
            }
        }
    }

    Name (GPIC, 0x00)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        \GPIC = Arg0
    }

    OperationRegion (SMI0, SystemIO, 0xB2, 0x01)
    Field (SMI0, ByteAcc, NoLock, Preserve)
    {
        APMC,   8
    }

    Field (MNVS, AnyAcc, NoLock, Preserve)
    {
        Offset (0xFC0), 
        CMD,    8, 
        ERR,    32, 
        PAR0,   32, 
        PAR1,   32, 
        PAR2,   32, 
        PAR3,   32
    }

    Mutex (MSMI, 0x07)
    Method (SMI, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        CMD = Arg0
        ERR = 0x01
        PAR0 = Arg1
        PAR1 = Arg2
        PAR2 = Arg3
        PAR3 = Arg4
        APMC = 0xF5
        While ((ERR == 0x01))
        {
            Sleep (0x01)
            APMC = 0xF5
        }

        Local0 = PAR0 /* \PAR0 */
        Release (MSMI)
        Return (Local0)
    }

    Method (RPCI, 1, NotSerialized)
    {
        Return (SMI (0x00, 0x00, Arg0, 0x00, 0x00))
    }

    Method (WPCI, 2, NotSerialized)
    {
        SMI (0x00, 0x01, Arg0, Arg1, 0x00)
    }

    Method (MPCI, 3, NotSerialized)
    {
        SMI (0x00, 0x02, Arg0, Arg1, Arg2)
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (SMI (0x00, 0x03, Arg0, 0x00, 0x00))
    }

    Method (WBEC, 2, NotSerialized)
    {
        SMI (0x00, 0x04, Arg0, Arg1, 0x00)
    }

    Method (MBEC, 3, NotSerialized)
    {
        SMI (0x00, 0x05, Arg0, Arg1, Arg2)
    }

    Method (RISA, 1, NotSerialized)
    {
        Return (SMI (0x00, 0x06, Arg0, 0x00, 0x00))
    }

    Method (WISA, 2, NotSerialized)
    {
        SMI (0x00, 0x07, Arg0, Arg1, 0x00)
    }

    Method (MISA, 3, NotSerialized)
    {
        SMI (0x00, 0x08, Arg0, Arg1, Arg2)
    }

    Method (VEXP, 0, NotSerialized)
    {
        SMI (0x01, 0x00, 0x00, 0x00, 0x00)
    }

    Method (VUPS, 1, NotSerialized)
    {
        SMI (0x01, 0x01, Arg0, 0x00, 0x00)
    }

    Method (VSDS, 2, NotSerialized)
    {
        SMI (0x01, 0x02, Arg0, Arg1, 0x00)
    }

    Method (VDDC, 0, NotSerialized)
    {
        SMI (0x01, 0x03, 0x00, 0x00, 0x00)
    }

    Method (VVPD, 1, NotSerialized)
    {
        SMI (0x01, 0x04, Arg0, 0x00, 0x00)
    }

    Method (VNRS, 1, NotSerialized)
    {
        SMI (0x01, 0x05, Arg0, 0x00, 0x00)
    }

    Method (GLPW, 0, NotSerialized)
    {
        Return (SMI (0x01, 0x06, 0x00, 0x00, 0x00))
    }

    Method (VSLD, 1, NotSerialized)
    {
        SMI (0x01, 0x07, Arg0, 0x00, 0x00)
    }

    Method (VEVT, 1, NotSerialized)
    {
        Return (SMI (0x01, 0x08, Arg0, 0x00, 0x00))
    }

    Method (VTHR, 0, NotSerialized)
    {
        Return (SMI (0x01, 0x09, 0x00, 0x00, 0x00))
    }

    Method (VBRC, 1, NotSerialized)
    {
        SMI (0x01, 0x0A, Arg0, 0x00, 0x00)
    }

    Method (VBRG, 0, NotSerialized)
    {
        Return (SMI (0x01, 0x0E, 0x00, 0x00, 0x00))
    }

    Method (VCMS, 2, NotSerialized)
    {
        Return (SMI (0x01, 0x0B, Arg0, Arg1, 0x00))
    }

    Method (VBTD, 0, NotSerialized)
    {
        Return (SMI (0x01, 0x0F, 0x00, 0x00, 0x00))
    }

    Method (VHYB, 2, NotSerialized)
    {
        Return (SMI (0x01, 0x10, Arg0, Arg1, 0x00))
    }

    Method (VDYN, 2, NotSerialized)
    {
        Return (SMI (0x01, 0x11, Arg0, Arg1, 0x00))
    }

    Method (UCMS, 1, NotSerialized)
    {
        Return (SMI (0x02, Arg0, 0x00, 0x00, 0x00))
    }

    Method (BHDP, 2, NotSerialized)
    {
        Return (SMI (0x03, 0x00, Arg0, Arg1, 0x00))
    }

    Method (STEP, 1, NotSerialized)
    {
        SMI (0x04, Arg0, 0x00, 0x00, 0x00)
    }

    Method (TRAP, 0, NotSerialized)
    {
        SMI (0x05, 0x00, 0x00, 0x00, 0x00)
    }

    Method (CBRI, 0, NotSerialized)
    {
        SMI (0x05, 0x01, 0x00, 0x00, 0x00)
    }

    Method (BCHK, 0, NotSerialized)
    {
        Return (SMI (0x05, 0x04, 0x00, 0x00, 0x00))
    }

    Method (BYRS, 0, NotSerialized)
    {
        SMI (0x05, 0x05, 0x00, 0x00, 0x00)
    }

    Method (LCHK, 1, NotSerialized)
    {
        Return (SMI (0x05, 0x06, Arg0, 0x00, 0x00))
    }

    Method (BLTH, 1, NotSerialized)
    {
        Return (SMI (0x06, Arg0, 0x00, 0x00, 0x00))
    }

    Method (PRSM, 2, NotSerialized)
    {
        Return (SMI (0x07, 0x00, Arg0, Arg1, 0x00))
    }

    Method (IFRS, 2, NotSerialized)
    {
        Return (SMI (0x07, 0x01, Arg0, Arg1, 0x00))
    }

    Method (TDPC, 1, NotSerialized)
    {
        Return (SMI (0x07, 0x02, Arg0, 0x00, 0x00))
    }

    Method (WGSV, 1, NotSerialized)
    {
        Return (SMI (0x09, Arg0, 0x00, 0x00, 0x00))
    }

    Method (SWTT, 1, NotSerialized)
    {
        If (SMI (0x0A, 0x02, Arg0, 0x00, 0x00))
        {
            If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
            {
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6030)
            }
        }
    }

    Method (TSDL, 0, NotSerialized)
    {
        Return (SMI (0x0A, 0x03, 0x00, 0x00, 0x00))
    }

    Method (TPHY, 1, NotSerialized)
    {
        SMI (0x0C, Arg0, 0x00, 0x00, 0x00)
    }

    Method (CSUM, 1, NotSerialized)
    {
        Return (SMI (0x0E, Arg0, 0x00, 0x00, 0x00))
    }

    Method (NVSS, 1, NotSerialized)
    {
        Return (SMI (0x0F, Arg0, 0x00, 0x00, 0x00))
    }

    Method (WMIS, 2, NotSerialized)
    {
        Return (SMI (0x10, Arg0, Arg1, 0x00, 0x00))
    }

    Method (AWON, 1, NotSerialized)
    {
        Return (SMI (0x12, Arg0, 0x00, 0x00, 0x00))
    }

    Method (PMON, 2, NotSerialized)
    {
        Local0 = SizeOf (Arg0)
        Name (TSTR, Buffer (Local0){})
        TSTR = Arg0
        \DBGS = TSTR /* \PMON.TSTR */
        SMI (0x11, Arg1, 0x00, 0x00, 0x00)
    }

    Method (UAWS, 1, NotSerialized)
    {
        Return (SMI (0x13, Arg0, 0x00, 0x00, 0x00))
    }

    Method (BFWC, 1, NotSerialized)
    {
        Return (SMI (0x14, 0x00, Arg0, 0x00, 0x00))
    }

    Method (BFWP, 0, NotSerialized)
    {
        Return (SMI (0x14, 0x01, 0x00, 0x00, 0x00))
    }

    Method (BFWL, 0, NotSerialized)
    {
        SMI (0x14, 0x02, 0x00, 0x00, 0x00)
    }

    Method (BFWG, 1, NotSerialized)
    {
        SMI (0x14, 0x03, Arg0, 0x00, 0x00)
    }

    Method (BDMC, 1, NotSerialized)
    {
        SMI (0x14, 0x04, Arg0, 0x00, 0x00)
    }

    Method (PSIF, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x05, Arg0, Arg1, 0x00))
    }

    Method (FNSC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x06, Arg0, Arg1, 0x00))
    }

    Method (AUDC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x07, Arg0, Arg1, 0x00))
    }

    Method (SYBC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x08, Arg0, Arg1, 0x00))
    }

    Method (KBLS, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x09, Arg0, Arg1, 0x00))
    }

    Method (UBIS, 1, NotSerialized)
    {
        Return (SMI (0x15, 0x00, Arg0, 0x00, 0x00))
    }

    Method (DPIO, 2, NotSerialized)
    {
        If (!Arg0)
        {
            Return (0x00)
        }

        If ((Arg0 > 0xF0))
        {
            Return (0x00)
        }

        If ((Arg0 > 0xB4))
        {
            If (Arg1)
            {
                Return (0x02)
            }
            Else
            {
                Return (0x01)
            }
        }

        If ((Arg0 > 0x78))
        {
            Return (0x03)
        }

        Return (0x04)
    }

    Method (DUDM, 2, NotSerialized)
    {
        If (!Arg1)
        {
            Return (0xFF)
        }

        If ((Arg0 > 0x5A))
        {
            Return (0x00)
        }

        If ((Arg0 > 0x3C))
        {
            Return (0x01)
        }

        If ((Arg0 > 0x2D))
        {
            Return (0x02)
        }

        If ((Arg0 > 0x1E))
        {
            Return (0x03)
        }

        If ((Arg0 > 0x14))
        {
            Return (0x04)
        }

        Return (0x05)
    }

    Method (DMDM, 2, NotSerialized)
    {
        If (Arg1)
        {
            Return (0x00)
        }

        If (!Arg0)
        {
            Return (0x00)
        }

        If ((Arg0 > 0x96))
        {
            Return (0x01)
        }

        If ((Arg0 > 0x78))
        {
            Return (0x02)
        }

        Return (0x03)
    }

    Method (UUDM, 2, NotSerialized)
    {
        If (!(Arg0 & 0x04))
        {
            Return (0x00)
        }

        If ((Arg1 & 0x20))
        {
            Return (0x14)
        }

        If ((Arg1 & 0x10))
        {
            Return (0x1E)
        }

        If ((Arg1 & 0x08))
        {
            Return (0x2D)
        }

        If ((Arg1 & 0x04))
        {
            Return (0x3C)
        }

        If ((Arg1 & 0x02))
        {
            Return (0x5A)
        }

        If ((Arg1 & 0x01))
        {
            Return (0x78)
        }

        Return (0x00)
    }

    Method (UMDM, 4, NotSerialized)
    {
        If (!(Arg0 & 0x02))
        {
            Return (0x00)
        }

        If ((Arg1 & 0x04))
        {
            Return (Arg3)
        }

        If ((Arg1 & 0x02))
        {
            If ((Arg3 <= 0x78))
            {
                Return (0xB4)
            }
            Else
            {
                Return (Arg3)
            }
        }

        If ((Arg2 & 0x04))
        {
            If ((Arg3 <= 0xB4))
            {
                Return (0xF0)
            }
            Else
            {
                Return (Arg3)
            }
        }

        Return (0x00)
    }

    Method (UPIO, 4, NotSerialized)
    {
        If (!(Arg0 & 0x02))
        {
            If ((Arg2 == 0x02))
            {
                Return (0xF0)
            }
            Else
            {
                Return (0x0384)
            }
        }

        If ((Arg1 & 0x02))
        {
            Return (Arg3)
        }

        If ((Arg1 & 0x01))
        {
            If ((Arg3 <= 0x78))
            {
                Return (0xB4)
            }
            Else
            {
                Return (Arg3)
            }
        }

        If ((Arg2 == 0x02))
        {
            Return (0xF0)
        }
        Else
        {
            Return (0x0384)
        }
    }

    Method (FDMA, 2, NotSerialized)
    {
        If ((Arg1 != 0xFF))
        {
            Return ((Arg1 | 0x40))
        }

        If ((Arg0 >= 0x03))
        {
            Return (((Arg0 - 0x02) | 0x20))
        }

        If (Arg0)
        {
            Return (0x12)
        }

        Return (0x00)
    }

    Method (FPIO, 1, NotSerialized)
    {
        If ((Arg0 >= 0x03))
        {
            Return ((Arg0 | 0x08))
        }

        If ((Arg0 == 0x01))
        {
            Return (0x01)
        }

        Return (0x00)
    }

    Method (SCMP, 2, NotSerialized)
    {
        Local0 = SizeOf (Arg0)
        If ((Local0 != SizeOf (Arg1)))
        {
            Return (One)
        }

        Local0++
        Name (STR1, Buffer (Local0){})
        Name (STR2, Buffer (Local0){})
        STR1 = Arg0
        STR2 = Arg1
        Local1 = Zero
        While ((Local1 < Local0))
        {
            Local2 = DerefOf (STR1 [Local1])
            Local3 = DerefOf (STR2 [Local1])
            If ((Local2 != Local3))
            {
                Return (One)
            }

            Local1++
        }

        Return (Zero)
    }

    Name (SPS, 0x00)
    Name (OSIF, 0x00)
    Name (WNTF, 0x00)
    Name (WXPF, 0x00)
    Name (WVIS, 0x00)
    Name (WIN7, 0x00)
    Name (WIN8, 0x00)
    Name (WSPV, 0x00)
    Name (LNUX, 0x00)
    Name (H8DR, 0x00)
    Name (MEMX, 0x00)
    Name (ACST, 0x00)
    Name (FMBL, 0x01)
    Name (FDTP, 0x02)
    Name (FUPS, 0x03)
    Name (FNID, 0x00)
    Name (RRBF, 0x00)
    Name (NBCF, 0x00)
    Name (APIN, 0x00)
}

