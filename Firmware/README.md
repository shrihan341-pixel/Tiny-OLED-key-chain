# Animated OLED face demo

This sketch animates a pair of eyes wandering around a 128×64 display. It uses U8g2 and is a firmware starting point—not tested on the user's actual module or board yet.

## Arduino IDE setup

1. Install Arduino IDE and Espressif's ESP32 board package; choose the Seeed XIAO ESP32-C3 board.
2. Install the **U8g2** library through Library Manager.
3. In `main.ino`, choose the constructor matching the display controller. The default is SH1106 because it is common in 1.3-inch modules; change it to SSD1306 if that is what the module datasheet specifies. Do not assume controller type from diagonal size alone.
4. Confirm the module's interface/address and XIAO I2C pins from the exact board/module documentation. The sketch uses the board core's default `Wire` pins and 0x3C address; adjust if required.
5. Compile and test over USB before connecting a LiPo. Verify current draw and safe power/charging design separately.

## Current limitations

The sketch does not implement touch input, sleep/power management, battery monitoring, or a battery charger. These should only be added after the electronics and actual parts are finalized.
