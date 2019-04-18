import java.util.Map;

HashMap<Character, Boolean> keys = new HashMap<Character, Boolean>();

PImage gauche, droite;

int half_width;

int gx = 0, gy = 0, dx = 0, dy = 0;

int speed = 5;

void setup()
{
  gauche = loadImage("../junglegauche.jpg");
  droite = loadImage("../jungledroite.jpg");
  size(1000, 500);

  half_width = width / 2;

  keys.put('z', false);
  keys.put('q', false);
  keys.put('s', false);
  keys.put('d', false);
  keys.put('y', false);
  keys.put('g', false);
  keys.put('h', false);
  keys.put('j', false);

  gx = gauche.width - half_width;
  gy = 0;
  dx = 0;
  dy = 0;
}

void draw()
{
  if (keys.get('z')) {
    gy = constrain(gy - speed, 0, gauche.height - height);
  }
  if (keys.get('q')) {
    gx = constrain(gx - speed, 0, gauche.width - half_width);
  }
  if (keys.get('s')) {
    gy = constrain(gy + speed, 0, gauche.height - height);
  }
  if (keys.get('d')) {
    gx = constrain(gx + speed, 0, gauche.width - half_width);
  }
  
  if (keys.get('y')) {
    dy = constrain(dy - speed, 0, droite.height - height);
  }
  if (keys.get('g')) {
    dx = constrain(dx - speed, 0, droite.width - half_width);
  }
  if (keys.get('h')) {
    dy = constrain(dy + speed, 0, droite.height - height);
  }
  if (keys.get('j')) {
    dx = constrain(dx + speed, 0, droite.width - half_width);
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
