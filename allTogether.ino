#include <LiquidCrystal_I2C.h>//include LCD library
#include<Servo.h> //include the servo library

int pos = 0;  //initial position of the servo
int val = 0;

int yellowPin = 2;      //pin of the yellow LED
int redPin = 3;         //pin of the red LED
int bluePin = 4;      //pin of the blue LED
int button = 8;   //pin of the first button
int button1 = 7;  //pin of the second button

int counter;
float duration_us;
float distance_cm;
int timer;
boolean rotating;

Servo servo; //create a servo object
LiquidCrystal_I2C lcd(0x27, 16, 2);     //creates the LCD display as an object

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);             //starts connection with the Serial monitor

  pinMode(yellowPin, OUTPUT);
  pinMode(redPin, OUTPUT);        //sets LED pins up to work
  pinMode(bluePin, OUTPUT);

  pinMode(9, OUTPUT);             //trigger pin for the UltraSonicSensor
  pinMode(8, INPUT);               //echo pin for the UltraSonicSensor

  lcd.begin();                    //activates the LCD screen
  lcd.backlight();
  counter = 0;
  timer = 0;

}

void loop() {

  // put your main code here, to run repeatedly:

  if (Serial.available()) {         //checks if data from processing is available
    // read the incoming byte:
    val = Serial.read();            //sets value of the processing output to "val"
  }
  if (val == 1) { //if Value read of the button ==LOW:
    servo.attach(11);  //pin used by the servo
    pos++;  //increases the value of the "pos" variable each time the push button of the left is pressed
    delay(5); //5 milliseconds of delay
    servo.write(10); //servo goes to variable pos
    rotating = true;


  }
  if (val == 2) { //if Value read of the button ==LOW:

    servo.detach();
    pos--;  //decreases the value of the "pos" variable each time the push button of the right is pressed
    delay(5); //5 milliseconds of delay
    //   servo.write(pos); //servo goes to variable pos
    rotating = false;
  }


  ldrSense = analogRead(A0);          //reads data from LDRSensor
  if (ldrSense < 450) {               //if value is smaller than 450(dark room)
    digitalWrite(yellowPin, HIGH);
    digitalWrite(redPin, HIGH);         //turns all the LED's on
    digitalWrite(bluePin, HIGH);
  }

  else if (rotating == true) {          //if boolean is true(screw is rotating)
    digitalWrite(bluePin, HIGH);
    delay(100);
    digitalWrite(bluePin, LOW);
    digitalWrite(redPin, HIGH);
    delay(100);
    digitalWrite(redPin, LOW);              //plays fancy light pattern
    digitalWrite(yellowPin, HIGH);
    delay(100);
    digitalWrite(yellowPin, LOW);
    delay(100);
  }

  else                    //if value is over 450(light room)
  {
    digitalWrite(yellowPin, LOW);
    digitalWrite(redPin, LOW);          //all LED's off
    digitalWrite(bluePin, LOW);
  }



  digitalWrite(9, HIGH);
  delayMicroseconds(10000);             //sends pulse signal to UltraSonicSensor
  digitalWrite(9, LOW);

  duration_us = pulseIn(8, HIGH);           //reads value from UltraSonicSensor
  distance_cm = 0.017 * duration_us;        //calculates distance to object
  Serial.print(distance_cm);
  Serial.println(",");
  timer = timer + 1;                      //adds one to timer variable
  if (distance_cm < 10.00) {              //if object is closer than 10cm

    if (timer > 100) {                    //if timer is over 100

      counter++;                          //adds one to timer
      timer = 0;                          //resets timer
    }
  }
  lcd.setCursor(0, 0);
  lcd.print("Milo counter:");             //prints message on LCD Screen
  lcd.setCursor(0, 1);
  lcd.print(counter);                     //prints counter variable on LCD
}
}
