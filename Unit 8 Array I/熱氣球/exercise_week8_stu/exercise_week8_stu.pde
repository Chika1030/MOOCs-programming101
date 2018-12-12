final int GAME_STOP = 0, GAME_RUN = 1;
int gameState;
int balloonX = 35, balloonY, balloonW = 60, balloonH = 86;
int fireW = 15, fireH = 20; 
int cameraOffsetX = 0;
boolean debugMode = false;
PImage bg, balloon, fire, sHill, mHill, lHill;


void setup() {
  size(800,300);
  noCursor();  //隱藏鼠標
  
  bg = loadImage("img/bg.png"); 
  balloon = loadImage("img/balloon.png"); 
  fire = loadImage("img/fire.png"); 
  sHill = loadImage("img/sHill.png"); 
  mHill = loadImage("img/mHill.png"); 
  lHill = loadImage("img/lHill.png");

  gameState = GAME_RUN;
  balloonY = 0;
  
  
}

void draw() {
  
  /* ------ Debug Function ------ 
    Please DO NOT edit the code here.
    It's for reviewing other requirements when you fail to complete the camera moving requirement.
  */
  if (debugMode) {
    pushMatrix();
    translate(cameraOffsetX, 0);
  }
  /* ------ End of Debug Function ------ */
    
    
  switch(gameState) {
    case GAME_RUN:
    
    // 背景
    image(bg, -cameraOffsetX, 0, width, height);
    
    // 熱氣球
    if(balloonY < 0) { 
      balloonY = 0;
    } else if(balloonY + balloonH > height) {
      balloonY = height - balloonH;
    }   
    image(balloon, balloonX, balloonY, balloonW, balloonH);   
    balloonY++; 
    
    // 山坡
   
   
    // 顯示越過山坡數
  
  
    // 滑鼠圖示
    imageMode(CENTER);
    image(fire, mouseX, mouseY, fireW, fireH);
    imageMode(CORNER);
    
    break;
    
    case GAME_STOP:
      // 點擊滑鼠重啟遊戲
      if(mousePressed) {
        gameState = GAME_RUN;
        balloonY = 0;      


      }
      
    break;
    }
    
    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void mouseClicked() {
  // 點擊滑鼠熱氣球上升 50px
  balloonY -= 50; 
}

void keyPressed() {
  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  switch(key) {
    case 'a':  
    if(cameraOffsetX < 0) {
      debugMode = true;
      cameraOffsetX += 25;
    }
    break;

    case 'd':
    if(cameraOffsetX > -width) {
      debugMode = true;
      cameraOffsetX -= 25;
    }
    break;
  }
}