# CAD notes

`case.scad` is a parametric OpenSCAD starter for a rounded, direct-view OLED keychain with a rear cover. It is intentionally an initial concept: the provided board screenshots do not establish physical scale, OLED-module dimensions, battery dimensions, switch location, or connector height.

## Measure before finalizing

- PCB outer width/height/thickness and mounting-hole centres/diameters
- OLED module board width/height/thickness and active display window position
- Battery length/width/thickness, lead exit direction, and bend clearance
- Slide-switch body, actuator travel, and required access slot
- USB connector and any headers/components that need access or headroom

Update the matching parameters and add suitable PCB supports, switch opening, and connector access only after those measurements are known. Check that the front aperture exposes the active pixels without covering the display bezel. Keep the battery from being pinched by the cover.

## Preview/export

Open `case.scad` in OpenSCAD. Set `part` to `"body"` or `"cover"`, render (F6), then export each part as STL. Print a fit-check first; tune `cover_clearance` for your printer. The current model does not include confirmed PCB standoffs or a switch cutout.
