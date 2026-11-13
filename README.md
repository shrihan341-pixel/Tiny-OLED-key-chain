# Tiny OLED Keychain — Wandering Faces

A pocket-sized keychain that shows animated digital faces wandering across a 128×64 OLED. The design uses a Seeed Studio XIAO ESP32-C3, a 1.3-inch OLED module, a LiPo battery, and a slide power switch. This version has no hologram or beam-splitter block: the display is viewed directly through the front window.

> **Prototype status:** The enclosure is a parametric starting concept, not a verified fit. The supplied PCB images show the layout but not its physical dimensions, and OLED/battery modules vary. Measure the actual parts and update `CAD/case.scad` before printing a final case.

## Project contents

- `BOM.csv` — initial parts list; prices and exact part links are intentionally left open until modules are selected.
- `CAD/case.scad` — adjustable two-piece enclosure concept for OpenSCAD.
- `CAD/README.md` — dimensions to measure and case-printing notes.
- `PCB/README.md` — notes on adding the KiCad schematic/layout and resolving power wiring.
- `Firmware/main.ino` — firmware scaffold and pin/configuration checklist.
- `Production/README.md` — prototype and manufacturing checklist.

## Planned hardware

- Seeed Studio XIAO ESP32-C3 SMD controller
- 1.3-inch, 128×64 OLED module (confirm controller and interface before purchase)
- Single-cell LiPo battery sized to the measured enclosure
- Slide switch in series with the device's power input
- Custom PCB, keyring, and 3D-printed enclosure

The currently shared schematic does not show the battery or slide switch. Add and verify the battery/power path, switch, charging method, and protection before connecting a LiPo. Do not connect a bare cell directly to an unverified circuit.

## Getting started

1. Measure the exact OLED module, PCB, battery, and switch.
2. Edit the parameters near the top of `CAD/case.scad`; preview and export the body and cover separately.
3. Check clearance and cable/header access with a low-cost prototype print before using the final material.
4. Add the KiCad source files and verified manufacturing outputs to `PCB/` and `Production/`.
5. Implement and test the OLED animation firmware in `Firmware/`.

## Inspiration and attribution

This is an original project scaffold inspired by the general idea of a portable display keychain. It does not include copied CAD, PCB, firmware, or images from [Hologram-Keychain](https://github.com/srisine/Hologram-Keychain). The hologram block is not part of this design.
