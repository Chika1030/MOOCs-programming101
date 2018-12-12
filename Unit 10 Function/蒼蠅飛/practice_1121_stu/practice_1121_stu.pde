PImage face, eye, fly;
float eyeX_l = 160 ;
float eyeX_r = 440 ;
float eyeY = 250 ;

int scarfSize = 30 ;

color[] colorArr = new color[3] ;
color[] colorArr2 = new color[5] ;

void setup() {  
  size(600, 600);
  face =  loadImage("face.png");
  eye =  loadImage("eye.png");
  fly =  loadImage("fly.png");
  noCursor();

  colorMode(HSB, 360, 100, 100);  
  colorArr[0] = color(32, 70, 100) ; 
  colorArr[1] = color(218, 80, 100) ;
  colorArr[2] = color(216, 60, 100);

  colorArr2[0] = color(216, 60, 100);
  colorArr2[1] = color(218, 80, 100) ;

  imageMode(CENTER);
}

void draw() {

  image(face, width/2, height/2);

  // eye1
  pushMatrix();
  translate(eyeX_l, eyeY);
  rotate( atan2(mouseY - eyeY, mouseX - eyeX_l));
  image(eye, 0, 0);   
  popMatrix();
  // eye2
  pushMatrix();
  translate(eyeX_r, eyeY);
  rotate( atan2(mouseY - eyeY, mouseX - eyeX_r));
  image(eye, 0, 0);   
  popMatrix();

  for (int i = 0; i < 600/scarfSize; i++) { // 600 -> scarfWidth
    for (int j = 0; j < 60/scarfSize; j++) { // 60 -> scarfHeight
      int colorIndex = (i + j) % 3 ;

      int startX = 0   ;
      int startY = 540 ;
      strokeWeight(0);
      fill (colorArr[colorIndex]) ;
      rect( startX + i*scarfSize, startY + j *scarfSize, scarfSize, scarfSize);
    }
  }
  image(fly, mouseX, mouseY);
}