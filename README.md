# Tiny OLED Keychain — Wandering Faces

A pocket-sized keychain concept that shows animated digital faces wandering across a directly viewed 128×64 OLED. The intended controller is a Seeed Studio XIAO ESP32-C3 SMD. The enclosure concept has a front display window, a side switch opening, a rear cover, and a keyring loop. There is no hologram or beam-splitter block in this design.

## Project status — prototype concept, not fabrication-approved

This repository is being developed as an original project. The display, battery, switch, and PCB are not yet finalized or purchased. The CAD dimensions are placeholders, the firmware needs to be configured for the chosen display controller, and the electronics have not been validated. Do not order a PCB or assemble a LiPo-powered prototype from these concept files alone.

## Intended hardware

- Seeed Studio XIAO ESP32-C3 SMD
- 1.3-inch 128×64 OLED module; confirm whether its controller is SH1106, SSD1306, or another type and verify its interface/pinout
- Single-cell LiPo battery with an appropriate, verified charging/protection arrangement
- Slide switch selected to suit the actual power path and mechanical cutout
- Custom PCB, keyring, and 3D-printed enclosure

The reference schematic/BOM shared during planning describes a 0.96-inch OLED and does not show the proposed battery or slide switch. It is not the final schematic for this 1.3-inch battery-powered design. The reference project also includes a beam-splitter cube; that part is intentionally excluded here.

## Repository map

- `BOM.csv` — proposed parts and unresolved selection/verification status
- `CAD/case.scad` — adjustable OpenSCAD enclosure concept; not a measured fit
- `CAD/README.md` — CAD assumptions and export instructions
- `PCB/README.md` — current electrical design status and required KiCad checks
- `Firmware/main.ino` — animated face demo using U8g2; display driver selection is configurable
- `Firmware/README.md` — libraries, configuration, and flash instructions
- `Production/README.md` — fabrication-readiness and safety checklist
- `PROJECT_SUMMARY.md` — concise project brief

## Build / preview

### CAD

Open `CAD/case.scad` in OpenSCAD. Set `part` to `"body"` or `"cover"`, render, then export each STL separately. Dimensions are deliberately adjustable; compare the model against the actual PCB, OLED module, battery, and switch before printing. See `CAD/README.md`.

### Firmware

Install the Arduino IDE, ESP32 board support for XIAO ESP32-C3, and the U8g2 library. Select the OLED controller in `Firmware/main.ino`, then build and test with the exact display module. See `Firmware/README.md`.

### Electronics

The repository does not yet include a finalized KiCad schematic or routed board. The available reference schematic/BOM is for a different configuration and must not be treated as manufacturing data for this project. See `PCB/README.md` before creating fabrication files.

## Fabrication review checklist

A reviewer should be able to find the native KiCad schematic and board, verified BOM, checked Gerbers/drill outputs, source CAD plus STEP/STL exports, firmware and build instructions, assembly notes, and truthful status photos or renders. At present, several of these deliverables are not complete; the checklist in `Production/README.md` records them without claiming approval.

## Attribution and scope

This is an original direct-view keychain concept, not a copy of the referenced Hologram-Keychain design. The reference was used only to understand the general organization of a hardware project. Do not include its design files, images, or BOM as if they were created for this project. Review the referenced project's license before reusing any of its materials.
