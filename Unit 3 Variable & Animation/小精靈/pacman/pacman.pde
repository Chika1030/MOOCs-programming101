PImage bg ;
int bgX = 0 ;

int y = 100 ;
int dotX = 0, dotW = 10, dotH = 10 ; 
int space = 50;

int mouthAngle = 0 ;
int mouthMaxAngle = 40;

void setup() {
  size(300, 200);
  bg = loadImage("pacman.png");
}

void draw() {
  
  //background
  bgX--;
  bgX %= width;
  image(bg, bgX      , 0, width, height);
  image(bg, bgX+width, 0, width, height);
  
  //dot
  fill(random(256), random(256), random(256));
  dotX -= 2;
  dotX %= space;
  ellipse(dotX + space*2, y, dotW, dotH);
  ellipse(dotX + space*3, y, dotW, dotH);
  ellipse(dotX + space*4, y, dotW, dotH);
  ellipse(dotX + space*5, y, dotW, dotH);
  ellipse(dotX + space*6, y, dotW, dotH);
  
  //pacman
  fill(255, 255, 0);
  mouthAngle++;
  mouthAngle %= mouthMaxAngle+1;
  arc(50, y, 30, 30, radians(40-mouthAngle), radians(320+mouthAngle), PIE);

}
