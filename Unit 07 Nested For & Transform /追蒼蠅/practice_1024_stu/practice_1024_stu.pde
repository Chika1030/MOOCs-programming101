final int EYE_X_L = 160;  // left eye center X-position 
final int EYE_X_R = 440;  // right eye center X-position
final int EYE_Y = 250;    // eyes center Y-position
final int SCARF_W = 60;

PImage face, eye, fly;


void setup() {  
  size(600 ,720);
  face = loadImage("face.png");
  eye = loadImage("eye.png");
  fly = loadImage("fly.png");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noCursor(); // make mouse disappear
}

void draw(){  
  image(face, width/2, height/2);
    
  
  
  // draw eyes
  
  
  
  // draw scarf
  
  
    
  image(fly, mouseX, mouseY);
}