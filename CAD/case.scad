// Tiny OLED keychain enclosure concept — direct-view display, no hologram block.
// OpenSCAD, units in millimetres. NOT dimensionally verified against hardware.
// Measure actual module, PCB, battery, switch, and connector before fabrication.

$fn = 64;
part = "both"; // "body", "cover", or "both"

// Envelope assumptions; revise using measured components.
case_w = 58;
case_h = 62;             // body height, not including integrated ring tab
case_d = 12;
corner_r = 7;
wall = 1.8;
front_thickness = 1.8;
cover_thickness = 2.0;
fit_clearance = 0.30;    // tune for printer/material after a test print

// Window is an initial aperture for the active pixels, not the OLED module PCB.
window_w = 32;
window_h = 16;
window_y = 5;
window_corner_r = 2;

// Side switch opening placeholder; position/dimensions depend on chosen switch.
switch_slot_y = -8;
switch_slot_z = 6;
switch_slot_h = 3.2;
switch_slot_depth = wall + 1.0;

// Keyring attachment.
loop_outer_d = 15;
loop_hole_d = 6;
loop_center_y = case_h/2 + loop_outer_d/2 - 2;

// Interior is a general cavity. This does not yet include measured supports,
// battery restraints, or OLED mounting features.
inner_w = case_w - 2*wall;
inner_h = case_h - 2*wall;

module rounded_rect_2d(w, h, r) {
    offset(r=r) square([w-2*r, h-2*r], center=true);
}

module outer_profile() {
    union() {
        rounded_rect_2d(case_w, case_h, corner_r);
        translate([0, loop_center_y]) circle(d=loop_outer_d);
    }
}

module body() {
    difference() {
        // Front face is at z=case_d. Rear cavity opens from z=0.
        linear_extrude(height=case_d) outer_profile();

        // Open-backed cavity, leaving the front face and perimeter walls.
        translate([0, 0, -0.05])
            linear_extrude(height=case_d-front_thickness+0.05)
                rounded_rect_2d(inner_w, inner_h, max(2, corner_r-wall));

        // Display aperture through the remaining front face.
        translate([0, window_y, case_d-front_thickness-0.1])
            linear_extrude(height=front_thickness+0.2)
                rounded_rect_2d(window_w, window_h, window_corner_r);

        // Keyring opening.
        translate([0, loop_center_y, -0.1])
            cylinder(d=loop_hole_d, h=case_d+0.2);

        // Side opening for a slide-switch actuator on the right-hand edge.
        translate([case_w/2-switch_slot_depth/2, switch_slot_y, switch_slot_z])
            cube([switch_slot_depth+0.2, switch_slot_h, switch_slot_z], center=true);
    }
}

module cover() {
    // Rear plate with an inset register lip. Fastening/retention is not designed yet.
    union() {
        linear_extrude(height=cover_thickness)
            rounded_rect_2d(case_w, case_h, corner_r);
        translate([0, 0, cover_thickness])
            linear_extrude(height=1.0)
                rounded_rect_2d(inner_w-2*fit_clearance,
                                 inner_h-2*fit_clearance,
                                 max(2, corner_r-wall-fit_clearance));
    }
}

if (part == "body") body();
else if (part == "cover") cover();
else {
    body();
    translate([case_w+8, 0, 0]) cover();
}
