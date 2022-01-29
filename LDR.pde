class LDR{
  
  LDR(){}
  
  
 void sensing(){
   int ldr= arduino.analogRead(0);
   
   if(ldr<=400){
     arduino.digitalWrite(4,arduino.HIGH);
     
   }else{
     arduino.digitalWrite(4,arduino.LOW);
   }

 }










} 
