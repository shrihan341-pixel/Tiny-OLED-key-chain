# CAD notes

This version is a more compact direct-view OLED keychain concept: a rounded enclosure with a large front OLED window, a slim slide-switch opening, and a top keyring loop. It is still a design starting point rather than a verified fit, because the exact PCB outline, OLED board dimensions, battery dimensions, and switch body dimensions were not supplied.

## Recommended measurements before final printing

- OLED module board size, active display size, and bezel thickness
- PCB outline and mounting-hole geometry
- Battery length/width/thickness and lead direction
- Switch body length/width and the required operation clearance
- Any connector or charging/protection hardware that must sit inside the case

## Tuning notes

- Increase `window_w` and `window_h` if you want a larger visible display area.
- Increase `case_w` and `case_h` if you want more internal space for a larger battery.
- Adjust `switch_slot_w`, `switch_slot_h`, and `switch_pos_x` to fit the actual switch.
- Use `tol` to tune the friction fit on your printer.
- If the cover is too loose or too tight, alter `tol` and the cover recess dimensions.

The file is ready for OpenSCAD preview and export to STL. Print a quick fit-check before committing to your final version.
