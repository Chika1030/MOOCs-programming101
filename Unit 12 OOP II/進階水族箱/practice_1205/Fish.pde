class Fish extends Animal {

  Fish() {
    super(str(floor(random(4))+1));
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
  }

  void moveToFeed() {
    if (x > feed.x+feed.size) {
      xSpeed = -abs(xSpeed);
    }
    if (x+size < feed.x) {
      xSpeed = abs(xSpeed);
    } 
    if (y > feed.y+feed.size) {
      ySpeed = -abs(ySpeed);
    }
    if (y+size < feed.y) {
      ySpeed = abs(ySpeed);
    }
    super.moveToFeed();
  }
  
  void free() {
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
  }

  void move() {
    super.move();
    if (y<btnH || y>height-size) { 
      ySpeed *=-1;
    }
  }

  void display() {
    super.display(size, size);
  }
}