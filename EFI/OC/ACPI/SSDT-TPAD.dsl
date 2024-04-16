/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLmDRVXO.aml, Tue Apr 16 15:56:37 2024
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000181 (385)
 *     Revision         0x02
 *     Checksum         0x44
 *     OEM ID           "hack"
 *     OEM Table ID     "I2Cpatch"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "I2Cpatch", 0x00000000)
{
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C0.TPXX, DeviceObj)
    External (FMD1, IntObj)
    External (FMH1, IntObj)
    External (FML1, IntObj)
    External (SSD1, IntObj)
    External (SSH1, IntObj)
    External (SSL1, IntObj)
    External (TPAD, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            TPAD = Zero
        }
    }

    Scope (\_SB.PCI0.I2C0)
    {
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
            Return (PKGX (SSH1, SSL1, SSD1))
        }

        Method (FMCN, 0, NotSerialized)
        {
            Name (PKG, Package (0x03)
            {
                0x0101, 
                0x012C, 
                0x62
            })
            Return (PKG) /* \_SB_.PCI0.I2C0.FMCN.PKG_ */
        }
    }

    Scope (\_SB.PCI0.I2C0.TPXX)
    {
        Name (SBFX, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x0000003F,
            }
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Name (SBFI, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (ConcatenateResTemplate (SBFI, SBFX))
        }
    }
}

