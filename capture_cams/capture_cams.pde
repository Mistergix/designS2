import processing.video.*;

Capture leftCam, rightCam;

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
    leftCam = new Capture(this, cameras[7]);
    rightCam = new Capture(this, cameras[34]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    leftCam.start();
    rightCam.start();
  }
}

void draw() {
  if (leftCam.available() == true) {
    leftCam.read();
  }
  if (rightCam.available() == true) {
    rightCam.read();
  }
  image(leftCam, 0, 0);
  image(rightCam, half_width, 0);
}
