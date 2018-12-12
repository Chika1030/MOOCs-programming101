class Feed {
  
  float x, y, xSpeed, ySpeed, size;
  
  Feed() {
    size = 10;
    x = random(width-size);
    y = btnH;
    ySpeed = 1;
  }
  
  void move() {
    y += ySpeed;
    if(y>height-size) { 
      ySpeed = 0; 
    }
  }
  
  void display() {
    fill(240,100,100);
    ellipse(x, y, size, size);
  }
}