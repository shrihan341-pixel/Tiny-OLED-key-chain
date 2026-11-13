// Direct-view OLED keychain case concept
// Revised for a compact keychain with a large OLED front window,
// a battery cavity, and a slim rear cover.
// Units: millimetres

$fn = 64;
part = "both"; // "body", "cover", or "both"

tol = 0.5;                // general fit tolerance
wall = 1.8;
front_thick = 1.6;
cover_thick = 2.2;
case_thick = 12;
corner_r = 6;

case_w = 58;
case_h = 62;
case_d = 12;

window_w = 34;
window_h = 18;
window_y = 4;             // move window upward in the body

switch_slot_w = 7.5;
switch_slot_h = 3.4;
switch_pos_x = 18;

loop_outer_d = 16;
loop_hole_d = 6.2;
loop_offset_y = case_h/2 + 4;

battery_w = 30;
battery_h = 46;
battery_t = 6.5;

module rounded_rect(size_x, size_y, r) {
    offset(r = r)
        square([size_x - 2*r, size_y - 2*r], center = true);
}

module body_outline() {
    union() {
        rounded_rect(case_w, case_h, corner_r);
        translate([0, loop_offset_y, 0])
            circle(d = loop_outer_d);
    }
}

module body() {
    difference() {
        // outer shell
        linear_extrude(height = case_d)
            body_outline();

        // main internal cavity (keeps wall thickness around the edges)
        translate([0, 0, wall])
            linear_extrude(height = case_d - wall + 0.2)
                rounded_rect(case_w - 2*wall,
                             case_h - 2*wall,
                             max(2, corner_r - wall));

        // front OLED aperture
        translate([0, window_y, case_d - front_thick])
            linear_extrude(height = front_thick + 0.5)
                rounded_rect(window_w + tol, window_h + tol, 2.2);

        // switch slot at the side of the case
        translate([switch_pos_x, 0, case_d - front_thick])
            linear_extrude(height = front_thick + 0.5)
                square([switch_slot_w, switch_slot_h], center = true);

        // keyring hole
        translate([0, loop_offset_y, -0.1])
            cylinder(d = loop_hole_d, h = case_d + 0.2);

        // simple internal clearance for a thin PCB - only rough placeholder
        translate([0, -4, wall + 0.9])
            linear_extrude(height = 2.4)
                rounded_rect(40, 28, 3);
    }
}

module cover() {
    difference() {
        linear_extrude(height = cover_thick)
            rounded_rect(case_w, case_h, corner_r);

        // inner recess so cover sits over shell body
        translate([0, 0, 0.8])
            linear_extrude(height = cover_thick)
                rounded_rect(case_w - 2*wall,
                             case_h - 2*wall,
                             max(2, corner_r - wall));

        // small hole for the switch actuator on the rear cover (optional)
        translate([switch_pos_x, 0, -0.1])
            linear_extrude(height = cover_thick + 0.2)
                square([switch_slot_w + 1.5, switch_slot_h + 1.5], center = true);
    }
}

if (part == "body") {
    body();
}
else if (part == "cover") {
    cover();
}
else {
    body();
    translate([case_w + 12, 0, 0]) cover();
}
