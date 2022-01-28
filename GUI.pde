class GUI {

  boolean feedPressed;
  color buttonColor;
  GUI() {
    feedPressed=false;
    buttonColor=color(255, 0, 0);
  }


  void display() {

    fill(buttonColor);

    circle(500, 700, 200);

    if (dist(mouseX, mouseY, 500, 700)<100) {
      if (mousePressed==true) {
        buttonColor=color(0, 255, 0);
        feedPressed=true;
        arduino.servoWrite(11,90);
      } else {
        buttonColor=color(255, 0, 0);
        feedPressed=false;
        arduino.servoWrite(11,-90);
      }
    }
   
  }
}
