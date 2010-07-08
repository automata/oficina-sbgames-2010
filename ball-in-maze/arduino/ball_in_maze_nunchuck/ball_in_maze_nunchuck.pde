/*

  Sketch: WiichuckPongReader
  Language: Arduino/Wiring
  Last Modified: February 27, 2010
  
  Dependencies: nunchuck_funcs.h (Arduino/Wiring)
  
  Connections: Wii Nunchuk on analog pins 2, 3, 4, 5
  Use a WiiChuck adapter and the corresponding function library:
    http://todbot.com/blog/2008/02/18/wiichuck-wii-nunchuck-adapter-available/
  
  Reads two analog accelerometer inputs
  and two digital button inputs from a Wii Nunchuk,
  and outputs their values to a serial string.

  Produces a serial string in the following format:
    accx,accy,zbut,cbut,linefeed
    
  This code is a blending of the Sensor Reader example from
  Tom Igoe's book Making Things Talk:
    http://www.makingthingstalk.com/chapter2/56/

  ...and the WiiChuck Demo from Tod Kurt:
    http://todbot.com/blog/2008/02/18/wiichuck-wii-nunchuck-adapter-available/
  
  More information:
  http://hansandumbach.com/

*/

#include <Wire.h> // used by the nunchuck function library
#include "nunchuck_funcs.h" // includes the nunchuck function library

int loop_cnt = 0; // loop counter

byte accx, accy, zbut, cbut; // incoming bytes from accelerometer and button inputs

void setup() {
  // configure the serial connection:
  Serial.begin(9600);
  
  nunchuck_setpowerpins(); // setup power for the nunchuck
  nunchuck_init(); // initialize the nunchuck

}

void loop() {


  nunchuck_get_data(); // grab data from the nunchuck 
   
  accx = nunchuck_accelx(); // feed inputs from the nunchuk into our variables
  accy = nunchuck_accely();
  zbut = nunchuck_zbutton();
  cbut = nunchuck_cbutton();
  
  // print the results:
  Serial.print((byte)accx, DEC);
  Serial.print(",");
  Serial.print((byte)accy, DEC);
  Serial.print(",");
  Serial.print((byte)zbut, DEC);
  Serial.print(",");
  // print the last sensor value with a println() so that
  // each set of four readings prints on a line by itself:
  Serial.println((byte)cbut, DEC);

  delay(1); 
}

