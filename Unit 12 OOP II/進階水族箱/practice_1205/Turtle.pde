class Turtle extends Animal {

  Turtle() {
    super("turtle");
    xSpeed = random(3)-2;
    ySpeed = random(2)+1;
  }

  void moveToFeed() {
    if (x > feed.x+feed.size) {
      xSpeed = -abs(xSpeed);
    }
    if (x+size < feed.x) {
      xSpeed = abs(xSpeed);
    }
    super.moveToFeed();
  }
  
  void free() {
    xSpeed = random(6)-3;
    ySpeed = random(3)+1;
  }
  
  void move() {
    super.move();
    if (y > height-size/2) { 
      ySpeed = 0;
    }
  }

  void display() {
    super.display(size, size/2);
  }
}