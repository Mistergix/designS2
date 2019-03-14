import java.util.Map;

HashMap<Character,Boolean> keys = new HashMap<Character,Boolean>();

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
  
  keys.put('z', false);
  keys.put('q', false);
  keys.put('s', false);
  keys.put('d', false);
  keys.put('y', false);
  keys.put('g', false);
  keys.put('h', false);
  keys.put('j', false);
  
  gx = (int)random(0, gauche.width - half_width);
  gy = (int)random(0, gauche.height - height);
  dx = (int)random(0, droite.width - half_width);
  dy = (int)random(0, droite.height - height);
}

void draw()
{
  if (keys.get('z') && gy >= speed) {
    gy -= speed;
  }
  if (keys.get('q') && gx >= speed) {
    gx -= speed;
  }
  if (keys.get('s') && gy + height + speed < gauche.height) {
    gy += speed;
  }
  if (keys.get('d') && gx + half_width + speed < gauche.width) {
    gx += speed;
  }
  
  if (keys.get('y') && dy >= speed) {
    dy -= speed;
  }
  if (keys.get('g') && dx >= speed) {
    dx -= speed;
  }
  if (keys.get('h') && dy + height + speed < droite.height) {
    dy += speed;
  }
  if (keys.get('j') && dx + half_width +speed < droite.width) {
    dx += speed;
  }
  
  PImage portion_g = gauche.get(gx, gy, half_width, height);
  PImage portion_d = droite.get(dx, dy, half_width, height);
  
  image(portion_g, 0, 0);
  image(portion_d, half_width, 0);
}

void keyPressed() {
  keys.put(key, true);
}

void keyReleased()
{
  keys.put(key, false);
}