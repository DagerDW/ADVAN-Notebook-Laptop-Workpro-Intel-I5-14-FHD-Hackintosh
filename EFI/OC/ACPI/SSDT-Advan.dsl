/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLLqT6Ot.aml, Tue Apr 16 15:56:17 2024
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001091 (4241)
 *     Revision         0x02
 *     Checksum         0x88
 *     OEM ID           "Advan"
 *     OEM Table ID     "AdvanHCK"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Advan", "AdvanHCK", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.CLP0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.IGPU, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ADP1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.B1ST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT0, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET.XCRS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.HPET.XSTA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (ALSE, IntObj)
    External (FMD0, UnknownObj)
    External (FMH0, UnknownObj)
    External (FML0, UnknownObj)
    External (FPD0, UnknownObj)
    External (FPH0, UnknownObj)
    External (FPL0, UnknownObj)
    External (GPEN, FieldUnitObj)
    External (GPHD, UnknownObj)
    External (HMD0, UnknownObj)
    External (HMH0, UnknownObj)
    External (HML0, UnknownObj)
    External (HPTE, UnknownObj)
    External (M0C0, UnknownObj)
    External (M1C0, UnknownObj)
    External (NBCF, FieldUnitObj)
    External (SSD0, UnknownObj)
    External (SSH0, UnknownObj)
    External (SSL0, UnknownObj)
    External (STAS, IntObj)
    External (TPAD, FieldUnitObj)

    Method (XOSI, 1, NotSerialized)
    {
        Local0 = Package (0x0D)
            {
                "Windows 2000", 
                "Windows 2001", 
                "Windows 2001 SP1", 
                "Windows 2001.1", 
                "Windows 2001 SP2", 
                "Windows 2001.1 SP1", 
                "Windows 2006", 
                "Windows 2006 SP1", 
                "Windows 2006.1", 
                "Windows 2009", 
                "Windows 2012", 
                "Windows 2013", 
                "Windows 2015"
            }
        If (_OSI ("Darwin"))
        {
            Return ((Match (Local0, MEQ, Arg0, MTR, Zero, Zero) != Ones))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Method (B1B4, 4, NotSerialized)
    {
        Local0 = (Arg2 | (Arg3 << 0x08))
        Local0 = (Arg1 | (Local0 << 0x08))
        Local0 = (Arg0 | (Local0 << 0x08))
        Return (Local0)
    }

    Method (W16B, 3, NotSerialized)
    {
        Arg0 = Arg2
        Arg1 = (Arg2 >> 0x08)
    }

    Scope (\)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
                ALSE = 0x02
                GPEN = One
                NBCF = One
            }
        }
    }

    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPortCurrentLimit", 
                    0x0BB8, 
                    "kUSBWakePortCurrentLimit", 
                    0x0BB8
                })
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
    }

    Scope (\_SB.PR00)
    {
        If (_OSI ("Darwin"))
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    Scope (\_SB.PCI0)
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

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x06)
                {
                    "model", 
                    Buffer (0x31)
                    {
                        "Ice Lake-LP Processor Host Bridge/DRAM Registers"
                    }, 

                    "device_type", 
                    Buffer (0x0C)
                    {
                        "Host bridge"
                    }, 

                    "AAPL,slot-name", 
                    Buffer (0x0E)
                    {
                        "Internal@,4,0"
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (XSPI)
        {
            Name (_ADR, 0x001F0005)  // _ADR: Address
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

    Scope (\_SB.PCI0)
    {
        Scope (HDAS)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Device (HDEF)
        {
            Name (_ADR, 0x001F0003)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "model", 
                    Buffer (0x14)
                    {
                        "Comet Lake PCH cAVS"
                    }, 

                    "device_type", 
                    Buffer (0x0D)
                    {
                        "Audio device"
                    }, 

                    "AAPL,slot-name", 
                    Buffer (0x10)
                    {
                        "Internal@0,31,3"
                    }, 

                    "layout-id", 
                    Buffer (0x04)
                    {
                         0x1D, 0x00, 0x00, 0x00                           // ....
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Scope (GFX0)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Device (IGPU)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x20)
                {
                    "AAPL,GfxYTile", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "AAPL,ig-platform-id", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x5C, 0x8A                           // ..\.
                    }, 

                    "device-id", 
                    Buffer (0x04)
                    {
                         0x5C, 0x8A, 0x00, 0x00                           // \...
                    }, 

                    "enable-cdclk-frequency-fix", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "enable-cfl-backlight-fix", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "enable-dvmt-calc-fix", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "AAPL,slot-name", 
                    Buffer (0x09)
                    {
                        "Built-in"
                    }, 

                    "enable-backlight-registers-fix", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "enable-backlight-smoother", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "framebuffer-fbmem", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x90, 0x00                           // ....
                    }, 

                    "framebuffer-patch-enable", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "framebuffer-stolenmem", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x20, 0x02                           // .. .
                    }, 

                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }, 

                    "device_type", 
                    Buffer (0x1A)
                    {
                        "VGA compatible controller"
                    }, 

                    "model", 
                    Buffer (0x27)
                    {
                        "Intel Iris Plus Graphics G4 (Ice Lake)"
                    }, 

                    "framebuffer-unifiedmem", 
                    Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0xC0                           // ....
                    }
                })
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Scope (SAT0)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }

        Device (SATA)
        {
            Name (_HID, "HACK0001")  // _HID: Hardware ID
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

    Scope (\_SB.PCI0.CLP0)
    {
        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
        }
    }

    Scope (\_SB.PCI0.I2C0)
    {
        If (_OSI ("Darwin"))
        {
            Method (PKGY, 1, Serialized)
            {
                Name (PKG, Package (0x01)
                {
                    Zero
                })
                PKG [Zero] = Arg0
                Return (PKG) /* \_SB_.PCI0.I2C0.PKGY.PKG_ */
            }

            Method (PKGX, 3, Serialized)
            {
                Name (PKG, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                PKG [Zero] = Arg0
                PKG [One] = Arg1
                PKG [0x02] = Arg2
                Return (PKG) /* \_SB_.PCI0.I2C0.PKGX.PKG_ */
            }

            Method (SSCN, 0, NotSerialized)
            {
                Return (PKGX (SSH0, SSL0, SSD0))
            }

            Method (FMCN, 0, NotSerialized)
            {
                Return (PKGX (FMH0, FML0, FMD0))
            }

            Method (FPCN, 0, NotSerialized)
            {
                Return (PKGX (FPH0, FPL0, FPD0))
            }

            Method (HMCN, 0, NotSerialized)
            {
                Return (PKGX (HMH0, HML0, HMD0))
            }

            Method (M0D3, 0, NotSerialized)
            {
                Return (PKGY (M0C0))
            }

            Method (M1D3, 0, NotSerialized)
            {
                Return (PKGY (M1C0))
            }
        }
    }

    Scope (\_SB.PCI0.I2C1)
    {
        If (_OSI ("Darwin"))
        {
            Method (PKGY, 1, Serialized)
            {
                Name (PKG, Package (0x01)
                {
                    Zero
                })
                PKG [Zero] = Arg0
                Return (PKG) /* \_SB_.PCI0.I2C1.PKGY.PKG_ */
            }

            Method (PKGX, 3, Serialized)
            {
                Name (PKG, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                PKG [Zero] = Arg0
                PKG [One] = Arg1
                PKG [0x02] = Arg2
                Return (PKG) /* \_SB_.PCI0.I2C1.PKGX.PKG_ */
            }

            Method (SSCN, 0, NotSerialized)
            {
                Return (PKGX (SSH0, SSL0, SSD0))
            }

            Method (FMCN, 0, NotSerialized)
            {
                Return (PKGX (FMH0, FML0, FMD0))
            }

            Method (FPCN, 0, NotSerialized)
            {
                Return (PKGX (FPH0, FPL0, FPD0))
            }

            Method (HMCN, 0, NotSerialized)
            {
                Return (PKGX (HMH0, HML0, HMD0))
            }

            Method (M0D3, 0, NotSerialized)
            {
                Return (PKGY (M0C0))
            }

            Method (M1D3, 0, NotSerialized)
            {
                Return (PKGY (M1C0))
            }
        }
    }

    Device (\_SB.PCI0.SBUS.BUS0)
    {
        Name (_CID, "smbus")  // _CID: Compatible ID
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

    Device (\_SB.PCI0.IGPU.PNLF)
    {
        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
        Name (_CID, "backlight")  // _CID: Compatible ID
        Name (_UID, 0x13)  // _UID: Unique ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0B)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
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

        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,         // Address Base
                    0x00010000,         // Address Length
                    )
            })
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
                    0x20,               // Length
                    )
                IO (Decode16,
                    0x0081,             // Range Minimum
                    0x0081,             // Range Maximum
                    0x01,               // Alignment
                    0x11,               // Length
                    )
                IO (Decode16,
                    0x0093,             // Range Minimum
                    0x0093,             // Range Maximum
                    0x01,               // Alignment
                    0x0D,               // Length
                    )
                IO (Decode16,
                    0x00C0,             // Range Minimum
                    0x00C0,             // Range Maximum
                    0x01,               // Alignment
                    0x20,               // Length
                    )
                DMA (Compatibility, NotBusMaster, Transfer8_16, )
                    {4}
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

    Scope (\_SB.PCI0.LPCB.H_EC.ADP1)
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

    Scope (_SB.PCI0.LPCB.H_EC)
    {
        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERM2, EmbeddedControl, Arg0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPCB.H_EC.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP) /* \_SB_.PCI0.LPCB.H_EC.RECB.TEMP */
        }

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERM2, EmbeddedControl, Arg0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }

        OperationRegion (ECX2, EmbeddedControl, Zero, 0xFF)
        Field (ECX2, ByteAcc, Lock, Preserve)
        {
            Offset (0x84), 
            IF00,   8, 
            IF01,   8, 
            IF02,   8, 
            IF03,   8, 
            IF04,   8, 
            IF05,   8, 
            Offset (0x8D), 
            IF06,   8, 
            IF07,   8, 
            IF08,   8, 
            IF09,   8
        }
    }

    Scope (_SB.PCI0.LPCB.H_EC.BAT0)
    {
        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            Name (BPKG, Package (0x0D)
            {
                Zero, 
                0x1BFA, 
                0x1BFA, 
                One, 
                0x1CE8, 
                Zero, 
                Zero, 
                0x64, 
                Zero, 
                "SR Real Battery", 
                "123456789", 
                "Real", 
                "Intel SR 1"
            })
            BPKG [One] = (B1B2 (IF00, IF01) * 0x0A)
            BPKG [0x02] = (B1B2 (IF04, IF05) * 0x0A)
            If (B1B2 (IF04, IF05))
            {
                BPKG [0x05] = ((B1B2 (IF04, IF05) * 0x0A) / 0x0A)
                BPKG [0x06] = ((B1B2 (IF04, IF05) * 0x0A) / 0x19)
                BPKG [0x07] = ((B1B2 (IF00, IF01) * 0x0A) / 0x64)
            }

            Return (BPKG) /* \_SB_.PCI0.LPCB.H_EC.BAT0._BIF.BPKG */
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            Name (PKG1, Package (0x04)
            {
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            PKG1 [Zero] = (B1ST & 0x07)
            If ((B1ST & One))
            {
                Local0 = (B1B2 (IF06, IF07) * B1B2 (IF02, IF03))
                Local0 /= 0x03E8
                PKG1 [One] = Local0
            }
            Else
            {
                Local0 = (B1B2 (IF06, IF07) * B1B2 (IF02, IF03))
                Local0 /= 0x03E8
                PKG1 [One] = Local0
            }

            PKG1 [0x02] = (B1B2 (IF08, IF09) * 0x0A)
            PKG1 [0x03] = B1B2 (IF02, IF03)
            Return (PKG1) /* \_SB_.PCI0.LPCB.H_EC.BAT0._BST.PKG1 */
        }
    }

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If ((_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.LPCB.HPET.XCRS)))
            {
                Return (BUFX) /* \_SB_.PCI0.LPCB.HPET.BUFX */
            }

            Return (\_SB.PCI0.LPCB.HPET.XCRS ())
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.LPCB.HPET.XSTA)))
            {
                Return (0x0F)
            }

            Return (\_SB.PCI0.LPCB.HPET.XSTA ())
        }
    }

    Scope (\_SB.PCI0.XHC.RHUB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
        {
            If ((Arg1 == One))
            {
                If ((Arg2 == Zero))
                {
                    Arg4 = Buffer (One)
                        {
                             0x03                                             // .
                        }
                    Return (One)
                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             // .
            }
        Return (Zero)
    }
}

