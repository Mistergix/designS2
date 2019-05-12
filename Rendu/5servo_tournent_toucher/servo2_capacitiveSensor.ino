#include <CapacitiveSensor.h>
CapacitiveSensor capSensor=CapacitiveSensor(3,2);
CapacitiveSensor capSensor2=CapacitiveSensor(5,4);
CapacitiveSensor capSensor3=CapacitiveSensor(7,6);
CapacitiveSensor capSensor4=CapacitiveSensor(9,8);

#include <Servo.h>
Servo myServo;
int angle=0;
Servo myServo2;
int angle2=0;

int threshold=1000;
//const int ledPin=12;

void setup() {
  Serial.begin(9600);
  //pinMode(ledPin,OUTPUT);
  myServo.attach(10);
  myServo2.attach(11);
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  long sensorValue=capSensor.capacitiveSensor(30);
  long sensorValue2=capSensor2.capacitiveSensor(30);
  long sensorValue3=capSensor3.capacitiveSensor(30);
  long sensorValue4=capSensor4.capacitiveSensor(30);
  //Serial.println(sensorValue);
  if (sensorValue> threshold && angle<180){
      angle=angle+1; 
  }
   else if (sensorValue2> threshold && angle>0){
      angle=angle-1;
  }
  if (sensorValue3> threshold && angle2<180){
      angle2=angle2+1; 
  }
   else if (sensorValue4> threshold && angle2>0){
      angle2=angle2-1;
  }
  //if (sensorValue> threshold){
  //  digitalWrite(ledPin,HIGH);
  //}
  //else{
  //  digitalWrite(ledPin,LOW);
  //}
  Serial.println(angle);
  myServo.write(angle);
  myServo2.write(angle2);
  delay(5);

}
