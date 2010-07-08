int y;
int x;

void setup() {

  Serial.begin(9600);
}

void loop() {
  y = analogRead(0);
  x = analogRead(1);

  Serial.print((byte)x, DEC);
  Serial.print(",");
  Serial.print((byte)y, DEC);
  Serial.print(",");
  //Lixo pra manter a compatibilidade com o exemplo do numchuck, remover isso aqui depois
  Serial.print((byte)10, DEC);
  Serial.print(",");
  Serial.println((byte)10, DEC);

  delay(1); 
}

