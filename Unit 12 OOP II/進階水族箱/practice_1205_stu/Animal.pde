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
  
  void move() {
    
  }
  
  void display() { 
    
  }
  
  /********* Part II *********
  void moveToFeed() {
        
    // if animal ate the feed
      
  }
  
  void fed() {
    
    // feed will disappear 
    // animal will grow up
    
  }
  ********* Part II *********/
}