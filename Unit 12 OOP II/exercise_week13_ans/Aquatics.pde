class Aquatics {
  PImage img ;
  float w, h, x, y, xSpeed, ySpeed ;

  Aquatics (String filename) {
    img = loadImage("img/" + filename + ".png") ;
    float ratio = random(0.5, 0.7) ;
    w = img.width * ratio ;
    h = img.height * ratio ;
    x = random(width - w) ;
    y = 0 ;
  }

  void swim () {
    x += xSpeed ;
    y += ySpeed ;
    
    if (x < 0 || x > width - w) { 
      xSpeed *= -1 ;
    }
    if (y < 0) {
      ySpeed *= -1 ;
    }
  } 

  void display() {
    int direction = (xSpeed > 0) ? RIGHT : LEFT;
    
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(img, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(img, -w, 0, w, h); 
    }
    popMatrix();
  }
}