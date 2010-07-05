#include <Wire.h>
#include "nunchuck_funcs.h"

int loop_cnt=0;

byte accx,accy,zbut,cbut;
int ledPin = 13;


void setup()
{
    Serial.begin(19200);
    nunchuck_setpowerpins();
    nunchuck_init(); // send the initilization handshake
    
    Serial.print("WiiChuckDemo ready\n");
}

void loop()
{
    if( loop_cnt > 100 ) { // every 100 msecs get new data
        loop_cnt = 0;

        nunchuck_get_data();

        accx  = nunchuck_accelx(); // ranges from approx 70 - 182
        accy  = nunchuck_accely(); // ranges from approx 65 - 173
        zbut = nunchuck_zbutton();
        cbut = nunchuck_cbutton(); 
            
        //ACCX
        Serial.println((byte)accx,DEC);
        //ACCY
        Serial.println((byte)accy,DEC);
        //ZBUT
        //Serial.print((byte)zbut,DEC);
        //CBUT
        //Serial.println((byte)cbut,DEC);
    }
    loop_cnt++;
    delay(1);
}

