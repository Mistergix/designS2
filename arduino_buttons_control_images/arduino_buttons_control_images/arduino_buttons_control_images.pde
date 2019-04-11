import processing.serial.*;

Serial myPort;
JSONObject json;


////// VARIABLES CAPTEURS INPUT //////

int leftP;
int leftM;
int rightP;
int rightM;

PImage gauche, droite;

int half_width;

int gy = 0, dy = 0;

int speed = 5;

void setup()
{
  gauche = loadImage("../junglegauche.jpg");
  droite = loadImage("../jungledroite.jpg");
  size(640, 360);

  half_width = width / 2;

  gy = (int)random(0, gauche.height - height);
  dy = (int)random(0, droite.height - height);
  
  try
  {
    printArray( Serial.list() );
    myPort = new Serial( this, Serial.list()[0], 9600 ); // indicate your arduino port
    myPort.clear();
    println();
  }
  catch(Exception e)
  {
    println("error");
  }
}

void draw()
{
  // read sensorShield
  while ( myPort.available() > 0 ) {
    String data = myPort.readStringUntil( '\n' );
    if ( data != null ) {
      println( data ); 
      try {
        json = JSONObject.parse( data );
        // get the values of your sensors from serial (arduino)
        leftP = json.getInt("bouton1");         
        leftM = json.getInt("bouton2");
        rightP = json.getInt("bouton3");
        rightM = json.getInt("bouton4");
      } 
      catch ( Exception e ) {
        e.printStackTrace();
      }
    }
  }
  
  if (leftM == 1) {
    gy = constrain(gy - speed, 0, gauche.height - height);
  }
  if (leftP == 1) {
    gy = constrain(gy + speed, 0, gauche.height - height);
  }
  
  if (rightM == 1) {
    dy = constrain(dy - speed, 0, droite.height - height);
  }
  if (rightP == 1) {
    dy = constrain(dy + speed, 0, droite.height - height);
  }

  PImage portion_g = gauche.get(0, gy, half_width, height);
  PImage portion_d = droite.get(0, dy, half_width, height);

  image(portion_g, 0, 0);
  image(portion_d, half_width, 0);
}
