

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
GUI gui;
Clock clock;


void setup() {
  size(1000, 1000);


  println(Arduino.list());


  arduino = new Arduino(this, Arduino.list()[0], 57600);
  gui = new GUI();
  clock= new Clock();

}

void draw() {
  background(255);
  gui.display();
  clock.display();
  clock.clockTick();

  
}
