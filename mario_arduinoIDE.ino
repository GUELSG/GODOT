

#include <BleKeyboard.h>

#define btn_left 22
#define btn_right 23
#define btn_up  18
#define btn_down 19

BleKeyboard bleKeyboard("ESP32 Janylson", "Espressif", 100);

void setup() {
  Serial.begin(115200);
  pinMode(btn_left, INPUT_PULLUP);
  pinMode(btn_right, INPUT_PULLUP);
  pinMode(btn_up, INPUT_PULLUP);
  pinMode(btn_down, INPUT_PULLUP);
  bleKeyboard.begin();
}

void loop() {
  if (digitalRead(btn_left) == LOW) {
    Serial.println("Esquerda");
    if (bleKeyboard.isConnected()) {
      bleKeyboard.press(KEY_LEFT_ARROW);
      delay(100);
      bleKeyboard.release(KEY_LEFT_ARROW);
    }
  }

  if (digitalRead(btn_right) == LOW) {
    Serial.println("Direita");
    if (bleKeyboard.isConnected()) {
      bleKeyboard.press(KEY_RIGHT_ARROW);
      delay(100);
      bleKeyboard.release(KEY_RIGHT_ARROW);
    }
  }

  if (digitalRead(btn_up) == LOW) {
    Serial.println("Pula");
    if (bleKeyboard.isConnected()) {
      bleKeyboard.press(KEY_UP_ARROW);
      delay(100);
      bleKeyboard.release(KEY_UP_ARROW);
    }
  }

   
  if (digitalRead(btn_down) == LOW) {
    Serial.println("Atira");
    if (bleKeyboard.isConnected()) {
      bleKeyboard.press(KEY_DOWN_ARROW);
      delay(100);
      bleKeyboard.release(KEY_DOWN_ARROW);
    }
  }

}
