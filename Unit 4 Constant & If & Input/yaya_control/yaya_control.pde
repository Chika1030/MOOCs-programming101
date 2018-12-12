int x=100, y=100, w=300, h=300;
int speedX=3, speedY=3;
boolean pause = false;

void setup() {  
  size(800, 800);
}

void draw() {
  background(255);
  
  noStroke();
  fill(128);
  rect(x, y, w, h);
  fill(255);
  rect(x+w/6, y+h/6, w/3*2, h/3*2);
  
  //Eyes
  stroke(128);
  strokeWeight(6);
  ellipse(x+w/3, y+w/2, w/12, h/12);
  ellipse(x+w/3*2, y+w/2, w/12, h/12);
  
  //Mouth
  noStroke();
  fill(#FF8B00);
  ellipse(x+w/2, y+w/3*2, w/3, h/6);
  stroke(255);
  strokeWeight(4);
  line(x+w/3, y+w/3*2, x+w/3*2, y+w/3*2);
  
  if (!pause) {
    x += speedX;
    y += speedY;
  }
  
  if ( x < 0 || x+w > width ) { 
      speedX *= -1; 
  } 
  if ( y < 0 || y+h > height ) { 
     speedY *= -1; 
  }
 
}

void mouseClicked() { 
    pause = !pause;
}

void keyPressed(){
  
  if (keyCode == UP) {
     speedY = -abs(speedY);
  }
  if (keyCode == RIGHT) {
     speedX = abs(speedX);
  }
  if (keyCode == DOWN) {
     speedY = abs(speedY);
  }
  if (keyCode == LEFT) {
     speedX = -abs(speedX);
  }
}
  
