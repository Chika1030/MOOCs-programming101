int x, y, w, h;
int r, g, b;

void setup() {  
  size(800, 800);
  x = 100;
  y = 100;
  w = h = 600;
  

}

void draw() {
  background(255);
  
  noStroke();
  fill(128);
  rect(x, y, w, h);
  fill(255);
  rect(x+100, y+100, w/3*2, h/3*2);
  
  //Eyes
  r = floor(random(256));
  g = floor(random(256));
  b = floor(random(256));
  stroke(r, g, b, 180);
  strokeWeight(10);
  ellipse(x+200, y+300, w/12, h/12);
  ellipse(x+400, y+300, w/12, h/12);
  
  //Mouth
  noStroke();
  fill(#FF8B00);
  ellipse(x+300, y+400, w/3, h/6);
  stroke(255);
  strokeWeight(7);
  line(x+200, y+400, x+400, y+400);
  
  x++;
  y+= ceil(random(10));
  x = x%(800-w);
  y = y%(800-h);
  
  
}
