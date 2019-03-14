PImage gauche, droite;

int half_width;

int gx = 0, gy = 0, dx = 0, dy = 0;

int speed = 5;

void setup()
{
  gauche = loadImage("../junglegauche.jpg");
  droite = loadImage("../jungledroite.jpg");
  size(640, 360);
  
  half_width = width / 2;
  
  gx = (int)random(0, gauche.width - half_width);
  gy = (int)random(0, gauche.height - height);
  dx = (int)random(0, droite.width - half_width);
  dy = (int)random(0, droite.height - height);
}

void draw()
{
  PImage portion_g = gauche.get(gx, gy, half_width, height);
  PImage portion_d = droite.get(dx, dy, half_width, height);
  
  image(portion_g, 0, 0);
  image(portion_d, half_width, 0);
}

void keyPressed() {
  if (key == 'z' && gy >= speed) {
    gy -= speed;
  }
  else if (key == 'q' && gx >= speed) {
    gx -= speed;
  }
  else if (key == 's' && gy + height + speed < gauche.height) {
    gy += speed;
  }
  else if (key == 'd' && gx + half_width + speed < gauche.width) {
    gx += speed;
  }
  
  if (key == 'y' && dy >= speed) {
    dy -= speed;
  }
  else if (key == 'g' && dx >= speed) {
    dx -= speed;
  }
  else if (key == 'h' && dy + height +speed < droite.height) {
    dy += speed;
  }
  else if (key == 'j' && dx + half_width +speed < droite.width) {
    dx += speed;
  }
}