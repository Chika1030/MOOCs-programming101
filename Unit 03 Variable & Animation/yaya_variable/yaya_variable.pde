int x, y, w, h;
int r, g, b;

void setup() {  
  size(800, 800);
  x = width/2;
  y = height/2;
  w = h = 600;
}

void draw() {
  background(255);
  
  rectMode(CENTER);
  noStroke();
  fill(127);
  rect(x, y, w, h);
  fill(255);
  rect(x, y, w/3*2, h/3*2);
  
  //Eyes
  stroke(127);
  strokeWeight(8);
  ellipse(x-w/6, y, w/12, h/12);
  ellipse(x+w/6, y, w/12, h/12);
  
  //Mouth
  noStroke();
  fill(#FF8B00);
  ellipse(x, y+h/6, w/3, h/6);
  stroke(255);
  line(x-w/6, y+h/6, x+w/6, y+h/6);
  
}
