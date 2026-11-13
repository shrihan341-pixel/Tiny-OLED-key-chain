# CAD notes

`case.scad` is a parametric OpenSCAD concept for a direct-view OLED keychain: a rounded body, front display aperture, side switch slot, keyring loop, and separate rear cover. It contains no beam-splitter/hologram block. It is not a final fit-checked model because no exact modules or PCB dimensions have been selected.

## Current limitations

- The envelope, screen opening, switch opening, wall, and fit dimensions are assumptions.
- There are no measured OLED retention features, PCB standoffs, battery restraints, charge-port cutout, or verified cover fastening method.
- The current concept has not been validated with a slicer, physical prototype, or assembled electronics.

## Before printing the final enclosure

Confirm the OLED module board size, thickness, active-area position, and connector direction; PCB outline, thickness, mounting-hole centres, and component heights; battery dimensions and lead exit; switch body and actuator requirements; charging connector access; and wire bend/strain-relief space. Update the parameters and add supports/cutouts from those measurements. Ensure the battery cannot be pinched, punctured, or compressed by the cover.

## Preview and export

Open with OpenSCAD. Set `part` to `"body"`, render (F6), and export STL; repeat with `part = "cover"`. Inspect the mesh in a slicer, print a fit-check, and tune `fit_clearance`. For a neutral STEP assembly export, use a CAD tool that supports STEP and check the geometry there; do not describe an unverified export as a production-ready fit.
