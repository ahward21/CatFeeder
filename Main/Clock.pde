/*Class which displays the clock
 Creates an internalised clock, using inbuilt functions
 Moves the tick hand in real time
 */
class Clock {
  float clockRadius = 400;
  float h, m, s;
  float clockSpeedSecs = 60.0;          //global variables of class Clock
  float clockSpeedMins;
  float time;
  int list;
  float hoursUntilFeed;
  float minsUntilFeed;
  boolean runOnce = false;
  String[] lines = loadStrings("schedule.txt");
  float [] schedule = new float[3];



  Clock() {
  }


  void display() {
    translate(width/2, height/4);
    fill( color(255, 255, 255));
    strokeWeight(10);                  //draws the background of the clock
    stroke(237, 212, 123);
    circle(0, 0, clockRadius);
    //portays the numbers and lines of the clock as an image
  }

  void clockTick() {
    h = hour();
    m = minute();                    //sets values of h,m,s to the real life amounts of hours, minutes and seconds
    s = second();
    //   print(m); testing purposes
    noFill();
    stroke(0, 0, 0);               //colour of stroke
    strokeWeight(1);
    s += clockSpeedSecs;
    float tickAngle = (30-s)*6*PI/180;
    float sinAngle = sin(tickAngle)  ;
    float cosAngle = cos(tickAngle) ;
    circle(0, 5, 8);
    // SECONDS

    int secondY= (int)(0 +clockRadius/2.3 * cosAngle);
    int secondX = (int)(0 + clockRadius/2.3 * sinAngle);            //updates the clock arm seconds
    line(0, 5, secondX, secondY);
    strokeWeight(3);


    // MINUTES

    m+= (s/60.0);
    m += clockSpeedMins;                                //updates the clock minute clock arm every minute
    tickAngle = (30-m) * 6*PI/180;
    sinAngle = sin(tickAngle);
    cosAngle = cos(tickAngle);

    int minuteY = (int)(0 + clockRadius / 2.5 * cosAngle);
    int minuteX = (int)(0 + clockRadius / 2.5 * sinAngle);

    line(0, 5, minuteX, minuteY);

    // HOURS

    strokeWeight(4);
    h += (m/60.0);
    tickAngle = (30-h)*30*PI/180;
    sinAngle = sin(tickAngle);                        //updates the hours clock arm every hour
    cosAngle = cos(tickAngle);

    int hourY= (int)(0 + clockRadius / 3 * cosAngle);
    int hourX= (int)(0 + clockRadius / 3 * sinAngle);

    line(0, 5, hourX, hourY);
  }

  void schedule() {

    for (int i = 0; i <lines.length; i++) {

      schedule[i] = float(lines[i]);
      schedule[i] = schedule[i] * 1000;
      schedule[i] = hour() - schedule[i];
    }


    m = minute();

    minsUntilFeed = 60 - m ;
    println(schedule[0]);

    hoursUntilFeed = min(schedule);
    if (hoursUntilFeed < 0 ) {
      hoursUntilFeed = hoursUntilFeed * -1 ;
    } else if (hoursUntilFeed == 0 && minsUntilFeed == 52 && runOnce == false) {
      myport.write(1);
      long uneFeedCycle = millis();
      while (millis() - uneFeedCycle < 3000) {
        // Do nothing
      }
      
      myport.write(2);
      runOnce = true;
    } 
    if(hoursUntilFeed == 1){
      hoursUntilFeed = 0;
    }else if(hoursUntilFeed ==0){
      hoursUntilFeed =  hoursUntilFeed + max(schedule);
    }
  }
}
