/* Arduino handle, takes care of the data being sent too and from the arduino 
Serial port - Alex - 4
Serial port - Jan - idk yet

*/
String recievedString;
String textDisplay;
float LDR;
float mRotation;
float distance;
String[] d;  



class Arduino {
  
  
  Arduino() {
    
  }
  
  
  void connect (){
   if(port.available() > 0){
     recievedString = port.readString();
     }
   if (recievedString != null) {
     d = split(recievedString, ',');
     
     LDR = Float.parseFloat(d[0].trim());
     distance = Float.parseFloat(d[1].trim());
     }
      
   }
     
    
  
}
