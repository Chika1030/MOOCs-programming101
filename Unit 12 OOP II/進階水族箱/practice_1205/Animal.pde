class Animal {
  float x, y, xSpeed, ySpeed;
  int size;
  PImage img;

  Animal(String filename) {
    img = loadImage("img/" + filename + ".png");
    size = floor(random(1)+1)*100;
    x = random(width-size);
    y = btnH;
  }

  void moveToFeed() {
    if ( feed.x > x && feed.x < x+size && feed.y > y && feed.y < y+size) {
      fed();
    }
  }

  void fed() {
    feed = null;
    size += size*0.1;
  }

  boolean married = false;

  boolean grab() {
    boolean gotcha = false;
    if (!married && mouseX > x && mouseX < x+size && mouseY > y && mouseY < y+size ) {
      gotcha = true;
      xSpeed = 0;
      ySpeed = 0;
    }
    return gotcha;
  }

  void moveTo() {
    if (mouseX > 0 && mouseX < width-size && mouseY > btnH && mouseY < height-size ) {
      x = mouseX;
      y = mouseY;
    }
  }

  boolean met() {
    boolean met = false;
    if (!married && mouseX > x && mouseX < x+size && mouseY > y && mouseY < y+size ) {
      met = true;
      married = true;
      xSpeed = 0;
      ySpeed = 0;
    }
    return met;
  }

  void getMarried() {
    married = true;
  }

  void free() {
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
    if (x<0 || x>width-size) { 
      xSpeed *=-1;
    }
  }

  void display() {
  }

  void display(int w, int h) {
    //----!!!!----//
    boolean hDirection = (xSpeed > 0) ? true : false;
    if (hDirection) {
      pushMatrix();
      translate(x, y);
      scale(1, 1);
      image(img, 0, 0, w, h);
      popMatrix();
    } else {
      pushMatrix();
      translate(x, y);
      scale(-1, 1);
      image(img, -w, 0, w, h);
      popMatrix();
    }
  }
}