#include<Arduino.h>
const int xPin = 2;  // Connect to digital pin 2
const int yPin = 3;  // Connect to digital pin 3
const int zPin = 4;  // Connect to digital pin 4
const int fpin = 13;  // Connect to digital pin 13 (or any other digital pin)

void setup() {
  // Set pins as inputs or outputs
  pinMode(xPin, INPUT);
  pinMode(yPin, INPUT);
  pinMode(zPin, INPUT);
  pinMode(fpin, OUTPUT);
}

void loop() {
  // Read the state of the input pins
  int xState = digitalRead(xPin);
  int yState = digitalRead(yPin);
  int zState = digitalRead(zPin);

  // Evaluate the boolean expression
  int F = (!xState | yState) & (xState | !yState | !zState);

  // Set the state of the result pin based on the expression result
  digitalWrite(fpin, F);

  // Add a delay if needed
  delay(1000);
}
