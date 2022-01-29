int button = 8;   //pin of the first button
int button1 = 7;  //pin of the second button
#include<Servo.h> //include the servo library
Servo servo; //create a servo object
int pos = 0;  //initial position of the servo
int val = 0; 
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

 // pinMode(button, INPUT_PULLUP);  //define first button as input pullup
// pinMode(button1, INPUT_PULLUP); //define second button as input pullup
  /*
  INPUT_PULLUP send to arduino LOW signal, so, when you press the button, you send a LOW signal to arduino
  */
}

void loop() {
    if (Serial.available()) {
    // read the incoming byte:
    val = Serial.read();
  }
  if (val == 1) { //if Value read of the button ==LOW:
    servo.attach(9);  //pin used by the servo
    pos++;  //increases the value of the "pos" variable each time the push button of the left is pressed
    delay(5); //5 milliseconds of delay
    servo.write(10); //servo goes to variable pos
  
  }
  if (val == 2) { //if Value read of the button ==LOW:

    servo.detach(); 
    pos--;  //decreases the value of the "pos" variable each time the push button of the right is pressed
    delay(5); //5 milliseconds of delay
 //   servo.write(pos); //servo goes to variable pos
  }
}
