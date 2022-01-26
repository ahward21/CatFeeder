#include <LiquidCrystal_I2C.h>
#include <Servo.h>
#include <Wire.h>
#include "pitches.h"
int ButtonPin= 13;
int SpeakerPin = 12;

Servo myservo;
LiquidCrystal_I2C lcd(0x27,16,2);

void setup() {
  // put your setup code here, to run once:
  lcd.begin();

  lcd.backlight();
  pinMode(ButtonPin,INPUT_PULLUP);
  myservo.attach(11);
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  int pinValue=digitalRead(ButtonPin);
  int ldrValue= analogRead(A0);
  lcd.setCursor(0,0);   
  lcd.print(pinValue);

  lcd.setCursor(0,1);
  lcd.print(ldrValue);

  if( pinValue ==1){
    myservo.write(180);
  }
  if (pinValue==0){
    myservo.write(-180);
  }
  
  //tone(SpeakerPin,NOTE_G4,1000);
  //tone(SpeakerPin,NOTE_C4,1000);

  Serial.print(pinValue);
  Serial.print(",");
  Serial.println(ldrValue);
  

  
}
