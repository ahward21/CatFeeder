class GUI {

  boolean feedPressed1;
  boolean feedPressed2;
  color buttonColor1;
  color buttonColor2;
  GUI() {
    feedPressed1=false;
    feedPressed2=false;
  }


  void display() {
    
    feedPressed1=false;
    feedPressed2=false;
    fill(0,255,0);
    circle(300, 700, 200);
    fill(255,0,0);
    circle(600, 700, 200);

    if (dist(mouseX, mouseY, 300, 700)<100&&feedPressed1==false) {
      if (mousePressed==true) {
        buttonColor1=color(0, 255, 0);
        feedPressed1=true;
        
       
      }
    }
    if (dist(mouseX, mouseY, 600, 700)<100&&feedPressed2==false) {
      if (mousePressed==true) {
        buttonColor2=color(0, 255, 0);
        feedPressed2=true;
      
        
      }
    }
  }
}
