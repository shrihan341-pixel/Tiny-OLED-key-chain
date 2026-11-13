# Fabrication and review status

This is a concept-stage project package, not a fabrication-approved release. Do not submit the current CAD or reference schematic as final manufacturing data.

## Available now

- Project description and intended hardware
- Preliminary BOM with unselected components identified
- OpenSCAD enclosure concept (assumed dimensions; not fit checked)
- U8g2 animated-face firmware demo (not tested on actual hardware)
- PCB status and required review steps

## Required before requesting PCB fabrication

- [ ] Select exact, compatible OLED module, battery, switch, and connectors; record links and datasheets.
- [ ] Finalize and review the power/charging/protection circuit for the chosen LiPo and controller; independently check battery safety.
- [ ] Add matching native KiCad schematic, project, and routed board files.
- [ ] Run KiCad ERC and DRC; resolve errors and document justified exceptions.
- [ ] Generate Gerbers and drill files from that final board; inspect outputs in a Gerber viewer.
- [ ] Produce a BOM with real manufacturer part numbers, quantities, and sourcing details.
- [ ] Fit the CAD enclosure to actual component/PCB dimensions; inspect mesh and print a fit-check.
- [ ] Provide CAD source and usable exports (STL for printing; STEP if requested and exported/checked in CAD software).
- [ ] Test the firmware on the actual display/controller and document libraries, pin mapping, and flashing steps.
- [ ] Add assembly instructions, wiring/polarity diagrams, and real prototype photos or clearly labeled CAD renders.
- [ ] Have another person review the design and follow the current fabrication team's own submission guidance.

Approval is determined by the fabrication team. This checklist cannot guarantee approval; their current rules and technical review take precedence.
