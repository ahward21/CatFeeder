class GUI {

  boolean feedPressed1;
  boolean feedPressed2;
  boolean once1;
  boolean once2;
  color buttonColor1;
  color buttonColor2;
  int timer; 
  GUI() {
    feedPressed1=false;
    feedPressed2=false;
    once1=false;
    once2=false;
  }


  void display() {

    feedPressed1=false;
    feedPressed2=false;
    fill(255, 0, 0);
    circle(300, 700, 200);
    fill(255, 0, 0);
    circle(600, 700, 200);

    if (dist(mouseX, mouseY, 300, 700)<100&&feedPressed1==false&&once1==false) {
      if (mousePressed==true) {
        buttonColor1=color(0, 255, 0);
        feedPressed1=true;
        once1=true;
        print("spacko");
        myport.write(1);
      }
    }
    if (dist(mouseX, mouseY, 600, 700)<100&&feedPressed2==false&&once2==false) {
      if (mousePressed==true) {
        buttonColor2=color(0, 255, 0);
        feedPressed2=true;
         once2=true;
        myport.write(2);
        
      }
    }
  }
    void timer() {

    if (millis() - timer >= 1000) {
      once1=false;
      once2=false;
      timer = millis();

    }
  }


}
