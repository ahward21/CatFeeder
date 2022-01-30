
int yellowPin=1;
int redPin=2;
int bluePin=3;

void setup() {
  // put your setup code here, to run once:
pinMode(yellowPin,OUTPUT);
pinMode(redPin,OUTPUT);
pinMode(bluePin,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
ldrSense=analogRead(A0);
if(ldrSense<400){
  digitalWrite(yellowPin,HIGH);
  digitalWrite(redPin,HIGH);
  digitalWrite(bluePin,HIGH);
}

else if(servo_rotating==true){
  digitalWrite(bluePin,HIGH);
  delay(100);
  digitalWrite(bluePin,LOW);
  digitalWrite(redPin,HIGH);
  delay(100);
  digitalWrite(redPin,LOW);
  digitalWrite(yellowPin,HIGH);
  delay(100);
  digitalWrite(yellowPin,LOW);
  delay(100);
}

else{ldrSense>400){
  digitalWrite(yellowPin,LOW);
  digitalWrite(redPin,LOW);
  digitalWrite(bluePin,LOW);
}
  
}


}
