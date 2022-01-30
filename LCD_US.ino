#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);

int counter;
float duration_us;
float distance_cm;
boolean detected;
int timer;

void setup() {
  // put your setup code here, to run once:
  pinMode(9, OUTPUT);
  pinMode(8, INPUT);

  Serial.begin(9600);
  lcd.begin();
  lcd.backlight();
  counter = 0;
  detected = false;
  timer = 0;


}

void loop() {
  // put your main code here, to run repeatedly:

  digitalWrite(9, HIGH);
  delayMicroseconds(10000);
  digitalWrite(9, LOW);
  duration_us = pulseIn(8, HIGH);
  distance_cm = 0.017 * duration_us;
  Serial.print(distance_cm);
  Serial.println(",");
  timer=timer+1;
  if (distance_cm < 10.00) {

    if (timer > 100) {

      counter++;
      timer = 0;
    }


  }



  lcd.setCursor(0, 0);
  lcd.print("Milo counter:");
  lcd.setCursor(0, 1);
  lcd.print(counter);
}
