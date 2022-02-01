class GUI {

  boolean startFeeding;
  boolean stopFeeding;
  boolean quickFeed;

  boolean once1;
  boolean once2;
  boolean once3;
  int timer;
  GUI() {
    startFeeding=false;
    stopFeeding=false;
    once1=false;
    once2=false;
  }


  void display() {
    textSize(38);
    fill(0, 0, 0);

    text( int(clock.hoursUntilFeed) + " hour and " + int(clock.minsUntilFeed) +" minutes, until next Munch", width/4, height/2);
    startFeeding=false;
    stopFeeding=false;
    fill(0, 255, 0);
    circle(200, 700, 200);
    fill(255, 0, 0);
    circle(500, 700, 200);
    fill(0, 0, 255);
    circle(800, 700, 200);

    if (dist(mouseX, mouseY, 200, 700)<100&&startFeeding==false&&once1==false) {
      if (mousePressed==true) {

        startFeeding=true;
        once1=true;
        myport.write(1);
      }
    }
    if (dist(mouseX, mouseY, 500, 700)<100&&stopFeeding==false&&once2==false) {
      if (mousePressed==true) {

        stopFeeding=true;
        once2=true;
        myport.write(2);
      }
    }
    if (dist(mouseX, mouseY, 800, 700)<100&&quickFeed==false&&once3==false) {
      if (mousePressed==true) {

        quickFeed=true;
        once3=true;
        myport.write(1);
        long uneFeedCycle = millis();
        while (millis() - uneFeedCycle < 3000) {
          // Do nothing
        }
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
