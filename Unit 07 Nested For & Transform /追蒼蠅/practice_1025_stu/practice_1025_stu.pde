final int EYE_X_L = 160;  // left eye center X-position 
final int EYE_X_R = 440;  // right eye center X-position
final int EYE_Y = 250;    // eyes center Y-position
final int SCARF_W = 60;

PImage pumpkin, eye, bat;


void setup() {  
  size(600 ,720);
  pumpkin = loadImage("pumpkin.png");
  eye = loadImage("eye.png");
  bat = loadImage("bat.png");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  noCursor(); // make mouse disappear
}

void draw(){  
  //background
  image(pumpkin, width/2, height/2);
  // draw eyes
  imageMode(CENTER);
  // draw scarf
  colorMode(HSB, 360, 100, 100); 
  
  
  
  
  
  image(bat, mouseX, mouseY,60,60);
}