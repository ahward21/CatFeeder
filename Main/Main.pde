import processing.serial.*;
import cc.arduino.*;

Serial myport;
GUI gui;
Clock clock;


void setup() {
  size(1000, 1000);
  myport = new Serial(this, Serial.list()[4], 9600);  
  gui = new GUI();

  clock= new Clock();


}

void draw() {
  background(255);
  gui.timer();
  gui.display();

  clock.display();
  
  clock.clockTick();
  clock.schedule();
  


  
}
