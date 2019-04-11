#include <sensorShieldLib.h>
SensorShield board;

#include <Servo.h>
Servo myServo;
Servo myServo2;
int angle=0;
int buttons[4];
int angle2=0;
const int button1Pin = 2;   
const int button2Pin = 3;   
const int button3Pin = 4;   
const int button4Pin = 5; 

void setup() {
  myServo.attach(10);
  myServo2.attach(11);
  Serial.begin(9600);
  board.init();
  board.addSensor("bouton1", 2);
  board.addSensor("bouton2", 3);
  board.addSensor("bouton3", 4);
  board.addSensor("bouton4", 5);

  
}

void loop() {
  board.update();
  buttons[0]= digitalRead(2);
  buttons[1]= digitalRead(3);
  buttons[2]=digitalRead(3);
  buttons[3]=digitalRead(5);  
  if (buttons[0]==HIGH && angle<180){
      angle=angle+1; 
    }
  else if (buttons[1]==HIGH && angle>0){
      angle=angle-1;
  }
  
  
  if (buttons[2]==HIGH && angle2<180){
      angle2=angle2+1;
  }
  else if (buttons[3]==HIGH && angle2>0){
      angle2=angle2-1;
  }
  Serial.println(angle);
  myServo.write(angle);
  myServo2.write(angle2);
  delay(5);
}
