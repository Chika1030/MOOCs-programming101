//
//  Created by Rosali Chang on 2016/12/08
//  Updated by Rosali Chang on 2017/11/20
//  Special thanks to Radian Jheng.
//  Photo credit to Youga Chang.
//  Advising Prof. Jones Yu.
//


// background, control button
PImage bgImg ;
PImage btn[]  =  new PImage[2] ;    // 2 button: input turtle, input fish
int btnX[]    =  { 15, 80 } ;
int btnY      =  15 ;
int btnR      =  25 ;               // the radius of button


// management of aquatics
Aquatics aquatics[] = new Aquatics[10] ;     
int aquCounter ;                    


void setup() {
  size(800, 600) ;

  // loading bg, control button
  bgImg = loadImage("img/bgImage.png") ;
  for (int i = 0; i < btn.length; i++ ) { 
    btn[i] = loadImage("img/btn_" + i + ".png") ;
  }
}


void draw() {

  // show the bg, control button
  image(bgImg, 0, 0, width, height) ;
  for (int i = 0; i < btn.length; i++) { 
    image(btn[i], btnX[i], btnY, btnR*2, btnR*2) ;
  }

 
  // move the animal and show those up.
  for (int i = 0; i < aquCounter; i++) {
    aquatics[i].swim() ;
    aquatics[i].display() ;
  }
}


void mouseClicked() {
  if(aquCounter < 10){
    // create a new turtle
    if (dist(mouseX, mouseY, btnX[0] + btnR, btnY + btnR) < btnR) {
  
      aquatics[aquCounter++] = new Turtle() ;
      
    // create a new fish 
    } else if (dist(mouseX, mouseY, btnX[1] + btnR, btnY + btnR) < btnR) {
  
      aquatics[aquCounter++] = new Fish() ;
      
    }
  } 
}