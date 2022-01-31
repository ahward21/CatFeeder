class GUI {

  boolean feedPressed1;
  boolean feedPressed2;
  color buttonColor1;                     //variables for colors of the button
  color buttonColor2;
  GUI() {
    feedPressed1=false;                   //setting initial state of the buttons
    feedPressed2=false;
  }


  void display() {
    
    feedPressed1=false;
    feedPressed2=false;
    fill(0,255,0);                          //green button
    circle(300, 700, 200);
    fill(255,0,0);                          //red button
    circle(600, 700, 200);

    if (dist(mouseX, mouseY, 300, 700)<100&&feedPressed1==false) {              //if mouse is over box and state is false
      if (mousePressed==true) {                                                 //if mouse is pressed
        buttonColor1=color(0, 255, 0);
        feedPressed1=true;                                                      //change state of button
        
       
      }
    }
    if (dist(mouseX, mouseY, 600, 700)<100&&feedPressed2==false) {            //if mouse is over box and state is false
      if (mousePressed==true) {                                               //if mouse is pressed
        buttonColor2=color(0, 255, 0);
        feedPressed2=true;                                                    //change state of button
                        
        
      }
    }
  }
}
