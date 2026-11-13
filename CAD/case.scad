// Parametric two-piece enclosure concept for a direct-view OLED keychain.
// This is an adjustable prototype, NOT a verified fit. Measure all real parts
// and update the parameters before printing. Units: millimetres.

$fn = 64;
part = "body"; // "body", "cover", or "both"

// Initial envelope assumptions — revise against your actual PCB/module.
body_w = 54;
body_h = 60;                 // enclosure body, excluding the keyring loop
body_d = 12;
corner_r = 6;
wall = 2;
front = 2;
cover_t = 2;
cover_clearance = 0.25;      // tune for printer/material

// Keep the OLED window sized to the ACTIVE display area, not the module PCB.
// A common 1.3-inch 128x64 panel is about 30 x 15 mm active; verify yours.
window_w = 31;
window_h = 16;
window_y = 5;                // positive is toward the top of the case

// Internal cavity placeholder: check against PCB, connectors, battery and wires.
cavity_w = body_w - 2*wall;
cavity_h = body_h - 2*wall;

// Integrated keyring tab and hole.
loop_outer_d = 15;
loop_hole_d = 6;
loop_overlap = 3;

module rounded_rect_2d(w,h,r) {
    offset(r=r) square([w-2*r,h-2*r], center=true);
}

module body_outline_2d() {
    union() {
        rounded_rect_2d(body_w, body_h, corner_r);
        translate([0, body_h/2 + loop_outer_d/2 - loop_overlap])
            circle(d=loop_outer_d);
    }
}

module body() {
    difference() {
        linear_extrude(height=body_d) body_outline_2d();
        // Rear cavity opens from z=0, leaving the front face intact.
        translate([0,0,-0.1])
            linear_extrude(height=body_d-front+0.1)
                rounded_rect_2d(cavity_w,cavity_h,max(2,corner_r-wall));
        // Direct-view OLED aperture through the front face.
        translate([0,window_y,body_d-front])
            linear_extrude(height=front+0.2)
                rounded_rect_2d(window_w,window_h,1.5);
        // Keyring opening.
        translate([0, body_h/2 + loop_outer_d/2 - loop_overlap, -0.1])
            cylinder(d=loop_hole_d,h=body_d+0.2);
    }
}

module cover() {
    // Flat rear cover with a shallow register lip. Adjust clearance after test print.
    union() {
        linear_extrude(height=cover_t)
            rounded_rect_2d(body_w-2*cover_clearance,
                            body_h-2*cover_clearance,
                            max(2,corner_r-cover_clearance));
        translate([0,0,cover_t])
            linear_extrude(height=1.2)
                rounded_rect_2d(cavity_w-2*cover_clearance,
                                cavity_h-2*cover_clearance,
                                max(2,corner_r-wall-cover_clearance));
    }
}

if (part == "body") body();
if (part == "cover") cover();
if (part == "both") {
    body();
    // Display the cover beside the body for preview; export parts separately.
    translate([body_w+5,0,0]) cover();
}
