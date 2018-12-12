class Fish {
  
  // properties
  float x, startY, y, xSpeed, ySpeed, size;
  int fishSpecies;
  PImage fishImg;


  // method
  void move() {
    x += xSpeed;
    y += ySpeed;
    if(x<0 || x>width-size){ 
      xSpeed *= -1;
      fishSpecies *= -1;
      fishImg = loadImage("img/" + fishSpecies + ".png");
      }
    if(y<startY || y>height-size){ 
      ySpeed *=-1; 
    }
  }
  
  void display() {
    image(fishImg, x, y, size, size);
  }
  
  
  // constructor
  Fish(float startY) {
    fishSpecies = (floor(random(4))+1);
    fishImg = loadImage("img/" + fishSpecies + ".png");
    size = (random(1)+1)*100;
    x = random(width-size);
    y = startY;
    this.startY = startY;
    xSpeed = random(3)+1;
    ySpeed = random(3)+1;    
  }
  
  
  // constructor overloading
  Fish(float startY, float size) {
    fishSpecies = (floor(random(4))+1);
    fishImg = loadImage("img/" + fishSpecies + ".png");
    this.size = size;
    x = random(width-size);
    y = startY;
    this.startY = startY;
    xSpeed = random(3)+1;
    ySpeed = random(3)+1;   
  }
}