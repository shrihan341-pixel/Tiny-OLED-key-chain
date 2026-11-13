# PCB / electrical design status

The repository does not currently contain a finalized KiCad project for the direct-view keychain. The information shared during planning includes a reference BOM and schematic for a different design: it names a 0.96-inch OLED, has no battery or slide switch shown, and was associated with a beam-splitter concept. It is not enough to create or validate the new 1.3-inch, LiPo-powered board, and it must not be presented as the new project's fabrication source.

## Needed before PCB fabrication

1. Select the exact OLED module and verify its controller, interface, pinout, logic/supply voltage, and connector/mechanical dimensions from its datasheet.
2. Select the exact battery and verify the XIAO board's battery input/charging behavior and limits against official documentation. Add only a correctly designed power/switch/charging arrangement; LiPo cells require suitable charging and protection.
3. Decide whether the OLED connects by a cable/header or is mounted directly, then create the schematic and board with matching footprints.
4. Draw the board outline and mounting features from the mechanical design; verify connector access and clearances in KiCad's 3D viewer.
5. Run ERC and DRC, review all warnings/errors, and have the power circuit checked before ordering.
6. Export Gerbers, drill files, and a production BOM only from the reviewed final board; inspect the exports in a Gerber viewer.

The pasted project-settings text alone is not the KiCad board file. A routed `.kicad_pcb` and matching schematic are required for an actual fabrication package.
