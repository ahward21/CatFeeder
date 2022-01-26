#include <LiquidCrystal_I2C.h>
#include <Wire.h>

LiquidCrystal_I2C lcd(0x27,16,2);
void setup() {
  // put your setup code here, to run once:
  lcd.begin();

  lcd.backlight();


}

void loop() {
  // put your main code here, to run repeatedly:



  lcd.print("peenis");

  lcd.setCursor(0,1);
  lcd.print("vagina");
   

}
