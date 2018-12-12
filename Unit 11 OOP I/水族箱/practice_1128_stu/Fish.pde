class Fish {
  
  // properties
  float x, y, xSpeed, ySpeed, size;
  PImage fishImg;
  
  
  void move() {
    x += xSpeed;
    y += ySpeed;
    if(x<0 || x>width-size) { 
      xSpeed *=-1;
    }
    if(y<btnH || y>height-size) { 
      ySpeed *=-1; 
    }
  }
  
  
  void display() {
    boolean hDirection = (xSpeed > 0) ? true : false;
    
    if(hDirection) {
      pushMatrix();
      translate(x,y);
      scale(1, 1);
      image(fishImg, 0, 0, size, size);
      popMatrix();      
    } else {
      pushMatrix();
      translate(x,y);
      scale(-1, 1);
      image(fishImg, -size, 0, size, size);
      popMatrix();
    }
  }
  
  
  // constructor
  Fish() {
    int fishSpecies = (floor(random(4))+1);
    fishImg = loadImage("img/" + fishSpecies + ".png");
    size = (random(1)+1)*100;
    x = random(width-size);
    y = btnH;
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
    println("create a fish"); 
  }
  
  // constructor overloading
  Fish(float size) {
    int fishSpecies = (floor(random(4))+1);
    fishImg = loadImage("img/" + fishSpecies + ".png");
    this.size = size;
    x = random(width-size);
    y = btnH;
    xSpeed = random(3)+1;
    ySpeed = random(3)+1;
  } 
}