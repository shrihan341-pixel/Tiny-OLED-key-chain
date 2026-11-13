# PCB / electrical design status

This folder contains a draft KiCad concept for the direct-view keychain project. It is intentionally an early concept and should not be treated as a fabrication-approved design. The exact OLED module, battery, switch, and enclosure fit have not been verified against real hardware.

## Draft design intent

- Controller: Seeed Studio XIAO ESP32-C3 SMD
- Display: 0.96-inch I2C OLED module, 4-wire header style, consistent with the reference build
- Battery: single-cell LiPo via JST or equivalent 2-pin connector
- Power path: slide switch placed in the battery path before the XIAO board input
- Form factor: compact keychain board sized for a printed case and a front display opening

## Included files

- `pcb.kicad_pro` — KiCad project metadata
- `pcb.kicad_sch` — draft electrical schematic
- `pcb.kicad_pcb` — draft board layout

## Before fabrication or submission

1. Confirm the exact OLED module datasheet and pinout.
2. Confirm battery chemistry, capacity, and charging/protection design.
3. Verify the switch and battery connector positions against the physical enclosure.
4. Run KiCad ERC and DRC.
5. Export Gerbers and a final BOM from the reviewed board.
6. Fit-check the enclosure against the assembled PCB before ordering parts.

This folder is a draft starting point, not a manufacturer-ready board.
