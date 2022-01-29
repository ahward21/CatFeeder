

import processing.serial.*;

import cc.arduino.*;

Serial myport;
GUI gui;
//LDR lightSensor;
//Servo servo;
Clock clock;


void setup() {
  size(1000, 1000);
  myport = new Serial(this, Serial.list()[4], 9600);  
  gui = new GUI();
  //lightSensor= new LDR();
 // servo= new Servo();
  clock= new Clock();


}

void draw() {
  background(255);
  gui.timer();
  gui.display();
 // lightSensor.sensing();
//  servo.rotating();
  clock.display();
  clock.clockTick();
  

  
}
