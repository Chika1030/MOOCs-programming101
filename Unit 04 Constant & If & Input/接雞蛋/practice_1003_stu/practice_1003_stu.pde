PImage bgImg, basket, egg, breakEgg;
boolean isPlaying;
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


void setup(){
  size(350, 500);
  bgImg = loadImage("bgImg.png");
  basket = loadImage("basket.png");
  egg = loadImage("egg.png");
  breakEgg = loadImage("breakEgg.png");
}

void draw() {
  
  if(isPlaying) {
    
    image(bgImg, 0, 0, 350, 500);
    
    //Egg1 Has Broken
    
    
    //Egg2 Has Broken

    
    //Game Over
    

    //Eggs Drop

   
    //Control Basket Movement
  
    
    //Condition: Egg1 is Catched or Not
   

    //Condition: Egg2 is Catched or Not
    
    
  }
}

void mouseClicked(){
  if(!isPlaying){
  
  }
}