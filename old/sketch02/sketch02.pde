color drawingColor = color(0);

void setup()
{
  size(768, 1024);
  background(255);
}

void draw () {
  if (mousePressed == true) { 
    stroke(drawingColor);     
    strokeWeight(10);         
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}


void keyPressed () {
  if (key == 'R') {  
    background(255); 
  }

  if (key == 'S') {  
    save("mon-beau-dessin.png");  
  }

  if (key == ' ') {  
    drawingColor = color(random(255), random(255), random(255));
  }
}

void mousePressed () {

}