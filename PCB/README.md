# PCB files

Add the KiCad schematic (`.kicad_sch`), board (`.kicad_pcb`), and project settings here when ready. The shared screenshots are useful references but do not provide editable source files or a reliable physical scale.

## Checks before fabrication

- Verify OLED module controller, interface, pin mapping, supply voltage, and connector orientation against its datasheet.
- Add the LiPo power path and slide switch to the schematic; confirm charging and cell-protection requirements for the selected battery and controller board.
- Check footprints and the physical board outline, mounting-hole centres, and connector access.
- Run KiCad electrical-rule and design-rule checks and inspect the 3D board view before ordering.
