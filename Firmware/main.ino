// Tiny OLED Keychain — wandering face demo
// Requires Arduino ESP32 core and U8g2 library.
// Choose the display driver from the exact module datasheet.

#include <Arduino.h>
#include <Wire.h>
#include <U8g2lib.h>

// Default is a commonly used 1.3-inch SH1106 module.
// If the module uses SSD1306, replace the constructor below with the alternative.
#define OLED_DRIVER_SH1106 1

#if OLED_DRIVER_SH1106
U8G2_SH1106_128X64_NONAME_F_HW_I2C display(U8G2_R0, U8X8_PIN_NONE);
#else
U8G2_SSD1306_128X64_NONAME_F_HW_I2C display(U8G2_R0, U8X8_PIN_NONE);
#endif

float faceX = 64.0f;
float faceY = 32.0f;
float targetX = 64.0f;
float targetY = 32.0f;
uint32_t nextTargetAt = 0;
uint32_t nextBlinkAt = 0;
bool blinking = false;

void chooseTarget(uint32_t now) {
  targetX = random(28, 101);
  targetY = random(22, 43);
  nextTargetAt = now + random(900, 2400);
}

void drawFace() {
  display.clearBuffer();

  // Soft rectangular eye shapes with pupils that follow the wandering face.
  const int eyeY = (int)faceY;
  const int leftX = (int)faceX - 15;
  const int rightX = (int)faceX + 15;

  if (blinking) {
    display.drawHLine(leftX - 7, eyeY, 14);
    display.drawHLine(rightX - 7, eyeY, 14);
  } else {
    display.drawRFrame(leftX - 7, eyeY - 7, 14, 14, 4);
    display.drawRFrame(rightX - 7, eyeY - 7, 14, 14, 4);

    int dx = (targetX > faceX) ? 2 : (targetX < faceX ? -2 : 0);
    int dy = (targetY > faceY) ? 2 : (targetY < faceY ? -2 : 0);
    display.drawDisc(leftX + dx, eyeY + dy, 2);
    display.drawDisc(rightX + dx, eyeY + dy, 2);
  }

  // Tiny mouth gives the character a readable expression.
  display.drawHLine((int)faceX - 4, (int)faceY + 13, 8);
  display.sendBuffer();
}

void setup() {
  randomSeed((uint32_t)micros());
  Wire.begin(); // Uses the selected XIAO board core's default I2C pins.
  display.begin();
  display.setContrast(180);
  uint32_t now = millis();
  chooseTarget(now);
  nextBlinkAt = now + random(1800, 4200);
}

void loop() {
  uint32_t now = millis();

  if ((int32_t)(now - nextTargetAt) >= 0) {
    chooseTarget(now);
  }
  if ((int32_t)(now - nextBlinkAt) >= 0) {
    blinking = true;
    nextBlinkAt = now + random(180, 260);
  } else if (blinking && (int32_t)(now - (nextBlinkAt - 180)) >= 0) {
    blinking = false;
    nextBlinkAt = now + random(1800, 4200);
  }

  faceX += (targetX - faceX) * 0.06f;
  faceY += (targetY - faceY) * 0.06f;
  drawFace();
  delay(35);
}
