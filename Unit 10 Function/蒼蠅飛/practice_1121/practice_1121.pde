PImage face, eye, fly;
float eyeX_l = 160 ;
float eyeX_r = 440 ;
float eyeY = 250 ;

int scarfSize = 30 ; 

color[] colorArr = new color[3] ;
color[] colorArr2 = new color[2] ;

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

  showEyeLookingAtPoint(160, 250, mouseX, mouseY);
  showEyeLookingAtPoint(440, 250, mouseX, mouseY);

  //showScarf(0, 500, 10, 2, colorArr);
  

  showScarf(0, 0, 600, 60, colorArr2);
  showScarf(0, 540, 600, 60, colorArr2);
  showScarf(0, 0, 60, 600, colorArr);
  showScarf(540, 0, 60, 640, colorArr);
  image(fly, mouseX, mouseY);
}

float radiusTowardTarget (float originCX, float originCY, float targetCX, float targetCY) {
  return atan2(targetCY - originCY, targetCX - originCX) ;
}

// 後來覺得這個函式可以拿掉
void showDegreeAt (float raduius, float showX, float showY) {
  float deg = degrees(raduius) ;
  fill(0);
  text(-deg, showX, showY);
}
void showEyeLookingAtPoint (float eyeCX, float eyeCY, float lookingCX, float lookingCY ) {
  pushMatrix();
  translate(eyeCX, eyeCY);
  rotate( radiusTowardTarget (eyeCX, eyeCY, lookingCX, lookingCY) );
  image(eye, 0, 0);   
  popMatrix();
  showDegreeAt( radiusTowardTarget (eyeCX, eyeCY, lookingCX, lookingCY), eyeCX, eyeCY);
}
void showScarf (float x, float y, float w, float h, color[] colorArr ) { //
  for (int i = 0; i < w/scarfSize; i++) { // w
    for (int j = 0; j < h/scarfSize; j++) { // h 
      int colorIndex = (i + j) % colorArr.length ;
      println( colorIndex+ " "+(y + i *scarfSize));
      strokeWeight(0);
      fill (colorArr[colorIndex]) ;
      rect( x + i*scarfSize, y + j *scarfSize, scarfSize, scarfSize);
    }
  }
}