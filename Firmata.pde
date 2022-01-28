

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
GUI gui;


void setup() {
  size(1000, 1000);


  println(Arduino.list());


  arduino = new Arduino(this, Arduino.list()[0], 57600);
  gui = new GUI();

  arduino.pinMode(13, Arduino.INPUT_PULLUP);
  arduino.pinMode(11, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
}

void draw() {
  background(255);
  int Button= arduino.digitalRead(13);
  int ldr= arduino.analogRead(0);
  println(Button);
  println(ldr);
  gui.display();

  
}
