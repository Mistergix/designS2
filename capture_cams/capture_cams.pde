import processing.video.*;

Capture leftCam, rightCam;

int idLeft = 7;
int idRight = 34;

int half_width;

void settings () {
  fullScreen(0);
}

void setup() {
  
  half_width = width / 2;

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    leftCam = new Capture(this, 640, 480);
    rightCam = new Capture(this, 640, 480);
  } 
  else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    leftCam = new Capture(this, cameras[idLeft]);
    rightCam = new Capture(this, cameras[idRight]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    leftCam.start();
    rightCam.start();
  }
}

void draw() {
  background(0);
  if (leftCam.available() == true) {
    leftCam.read();
  }
  if (rightCam.available() == true) {
    rightCam.read();
  }
  
  float lHeight = height * leftCam.width / half_width; 
  float rHeight = height * rightCam.width / half_width;
  image(leftCam, 0, (height - lHeight) / 2, half_width, lHeight);
  image(rightCam, half_width, (height - rHeight) / 2, half_width, rHeight);
}
