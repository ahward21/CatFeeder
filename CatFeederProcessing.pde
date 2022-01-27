import processing.serial.*;
Serial port;
Arduino arduino;
Clock clock;

void setup(){
  rectMode(CENTER);
  size(1000,1000);
  background(0,0,0);
 // port = new Serial(this, Serial.list()[3], 9600);  
  arduino = new Arduino();
  clock = new Clock();

}

void draw() {
 background(255,235,198);
 clock.display();
 clock.clockTick();
 //arduino.connect();
  
}
