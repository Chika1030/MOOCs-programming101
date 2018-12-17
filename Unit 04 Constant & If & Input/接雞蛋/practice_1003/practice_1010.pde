final int EGG_W = 35;
final int EGG_H = 45;
final int EGG_MIN_X = 25;
final int EGG_MAX_X = 225; 
final int BASKET_W = 100;
final int BASKET_H = 100;
final int BASKET_Y = 310;
final int BASKET_BOUND = 10;
final int BREAKEGG_W = 70;
final int BREAKEGG_H = 70;
final int GROUND_Y = 430;

PImage bgImg, basket, egg, breakEgg;
int eggX1, eggY1, eggX2, eggY2, basketX, eggSpeed1, eggSpeed2;
boolean hasBrokenEgg1, hasBrokenEgg2, isPlaying;

void setup(){
  size(350, 500);
  bgImg = loadImage("bgImg.png");
  basket = loadImage("basket.png");
  egg = loadImage("egg.png");
  breakEgg = loadImage("breakEgg.png");
  eggX1 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
  eggX2 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
  eggY1 = 0;
  eggY2 = -200;
  eggSpeed1 = floor(random(2)+2);
  eggSpeed2 = floor(random(2)+2);
  hasBrokenEgg1 = false;
  hasBrokenEgg2 = false;
  isPlaying = true;
}

void draw() {
  
  if(isPlaying){
    
    image(bgImg, 0, 0, 350, 500);   
        
    //Eggs Drop
    eggY1 += eggSpeed1;
    eggY2 += eggSpeed2;
    image(egg, eggX1, eggY1, EGG_W , EGG_H);
    image(egg, eggX2, eggY2, EGG_W , EGG_H);
     
    //Control Basket Movement
    basketX = mouseX - BASKET_W/2;
    if(mouseX > 500-(BASKET_W/2)){
       basketX = 500-BASKET_W;
    }else if(mouseX < BASKET_W/2){
       basketX = 0;
    }
    image(basket, basketX, BASKET_Y, BASKET_W, BASKET_H);   
    
    //Condition: Egg1 is Catched or Not
    if(eggY1 >= BASKET_Y+EGG_H) {
      if(eggX1 > basketX+BASKET_BOUND && eggX1 < basketX+BASKET_W-BASKET_BOUND && !hasBrokenEgg1) {
        eggX1 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
        eggY1 = 0;
        eggSpeed1 = floor(random(2)+2);
      } else{
        eggY1 = 600;
        eggSpeed1 = 0;
        hasBrokenEgg1 = true;
        image(breakEgg, eggX1, GROUND_Y, BREAKEGG_W, BREAKEGG_H);
      }
    }
        
    //Condition: Egg2 is Catched or Not
    if(eggY2 >= BASKET_Y+EGG_H) { 
      if (eggX2 > basketX+BASKET_BOUND && eggX2 < basketX+BASKET_W-BASKET_BOUND && !hasBrokenEgg2) {
        eggX2 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
        eggY2 = 0;
        eggSpeed2 = floor(random(2)+2);
      } else {
        eggY2 = 600;
        eggSpeed2 = 0;
        hasBrokenEgg2 = true;
        image(breakEgg, eggX2, GROUND_Y, BREAKEGG_W, BREAKEGG_H);
      }
    }
    
    //Game Over
    if(hasBrokenEgg1 && hasBrokenEgg2){
      isPlaying = false;
    } 
  }
}

void mouseClicked(){
  if(!isPlaying){
    eggX1 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
    eggX2 = floor(random(EGG_MAX_X-EGG_MIN_X))+EGG_MIN_X;
    eggY1 = 0;
    eggY2 = -200;
    eggSpeed1 = floor(random(2)+2);
    eggSpeed2 = floor(random(2)+2);
    hasBrokenEgg1 = false;
    hasBrokenEgg2 = false;
    isPlaying = true;
  }
}