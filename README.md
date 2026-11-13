# Tiny OLED Keychain

A compact mini keychain that shows animated digital faces drifting across a 128×64 OLED. This repository contains a practical starter package for a direct-view OLED keychain using a Seeed Studio XIAO ESP32-C3, a 1.3-inch OLED module, a LiPo battery, and a compact slide switch.

## Project summary

The concept uses a minimal body that keeps the screen visible and the overall product easy to carry. The project is built around a small direct-view display rather than a hologram or beam-splitter cube. The case is designed to feel like a modern compact accessory while keeping enough internal space for the battery and controller.

## Hardware concept

- Controller: Seeed Studio XIAO ESP32-C3 SMD
- Display: 1.3-inch OLED, 128×64 pixels
- Power: single-cell LiPo battery
- Switching: slide power switch
- Form factor: portable keychain / pocket companion
- Enclosure: 3D-printed compact body with a direct front display opening

## Repository structure

- `README.md` — overview and build notes
- `BOM.csv` — preliminary parts list
- `CAD/` — OpenSCAD case concept and design notes
- `PCB/` — KiCad planning notes and placement guidance
- `Firmware/` — firmware scaffold and animation placeholder
- `Production/` — assembly and manufacturing checklist
- `LICENSE` — MIT license

## Design direction

This repository is intentionally structured as a complete project package rather than a partial experiment. The default enclosure is a compact rounded body with:

- a wider front OLED aperture
- a slim power-switch slot
- a keyring loop on the top edge
- a rear panel that can be adjusted for battery fit and print tolerance

## Important notes

This project package is a strong starting point, but the exact enclosure should still be tuned to the actual purchased module and battery dimensions. The PCB and battery are not yet finalized in the uploaded schematics, so the case dimensions are intentionally parameterized for easy modification.

Before ordering final PCBs or printing the final case, confirm:

- OLED board width, height, and bezel thickness
- display active window location
- battery dimensions and polarity
- switch body size and actuator clearance
- PCB mounting-hole spacing and component height

## BOM

See `BOM.csv` for the initial component list.

## CAD workflow

Open `CAD/case.scad` in OpenSCAD and render the body or cover. Adjust the variable block near the top of the file to match the exact hardware dimensions before printing. The included notes describe the main fitting considerations.

## Firmware workflow

The firmware is intentionally scaffolded so that the display animation logic can be implemented cleanly. Use the selected OLED library and confirm the power and I2C/SPI bus configuration with the exact board revision before writing the final animation code.

## Production preparation

Use `Production/README.md` to track:

- PCB export review
- case fit testing
- battery insulation and power protection checks
- enclosure print validation
- final wiring and assembly test

## License

This project is released under the MIT License. See `LICENSE` for details.

## Submission note

This repository is arranged to function as a project submission package: it contains the core concept, parts list, file structure, CAD starter, firmware scaffold, and production guidance in one place.
