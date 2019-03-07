void setup() {
  size(800, 800);
  background(100);
  noStroke();
  
  int rect_x, rect_y, rect_w, rect_h, offset;
  
  offset = height / 40;
  
  rect_w = width / 8;
  rect_h = height / 4 + offset;
  
  rect_x = (width - rect_w) / 2;
  rect_y = height - rect_h;
  
  fill(0);
  rect(rect_x, rect_y, rect_w, rect_h);
  
  int center_x = width / 2, center_y = height / 2, radius = width / 2;
  
  ellipse(center_x, center_y, radius, radius);
  
  radius *= 0.8;
  
  fill(50);
  ellipse(center_x, center_y, radius, radius);
  
  radius *= 0.7;
  
  fill(255);
  ellipse(center_x, center_y, radius, radius);
  
  radius *= 0.7;
  
  fill(255, 255, 118);
  ellipse(center_x, center_y, radius, radius);
}