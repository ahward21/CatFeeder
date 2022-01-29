class Servo {

  Servo() {
  }



  void rotating() {

    if (gui.feedPressed1= true) {
      arduino.servoWrite(11, 180);
      println("1");
    }

    if (gui.feedPressed2=true) {
      arduino.servoWrite(11, 180);
      println("2");
    }
  }
}
