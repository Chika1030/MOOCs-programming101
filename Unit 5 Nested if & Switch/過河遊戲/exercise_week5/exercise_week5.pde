PImage bg, start1, start2, lose, win, restart, ghost;
int W1X = 100, W2X = 250, W3X = 300;
int SpeedW1 = 1;
int SpeedW2 = 2;
int SpeedW3 = 3;
float ghostX, ghostY;
int ghostSpeed = 5;
final int GAME_START = 0, GAME_RUN = 1, GAME_WIN = 2, GAME_LOSE = 3;
int gameState = 0;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup() {
  size(600,500);
  bg = loadImage("img/bg.jpg");
  start1 = loadImage("img/start1.jpg");
  start2 = loadImage("img/start2.jpg");
  lose = loadImage("img/lose.jpg");
  win = loadImage("img/win.jpg");
  restart = loadImage("img/restart.jpg");
  ghost = loadImage("img/ghost.jpg");
  //start location for ghost
  ghostX = (width / 2) - 25;
  ghostY = 0; 
  
  gameState = 0;
}

void draw() {
  image(bg, 0, 0, width, height);
  
  switch (gameState) {
  
  case GAME_START:
      if(mouseX > 150 && mouseX < 450 && mouseY > 210 && mouseY < 285){
        image(start2, 0, 0, width, height);
        if(mousePressed) {
          gameState = 1;
        }
      } else {
        image(start1, 0, 0, width, height);
      }
      break;
      
  case GAME_RUN:
  
      //wall
      fill(135, 200, 155);
      noStroke();
      
      //wall1
      rect(0,100,600,5);
        
      //wall2
      rect(0,200,600,5);
        
      //wall3
      rect(0,300,600,5);
       
      fill(255, 255, 255);
      
      //wall1 - space
      if(W1X < 0 || W1X + 300 > width){ SpeedW1 *= -1; }
      W1X += SpeedW1;
      rect(W1X,100,300,6);
        
      //wall2 - space
      if(W2X < 0 || W2X + 200 > width){ SpeedW2 *= -1; }
      W2X += SpeedW2;
      rect(W2X,200,200,6);
        
      //wall3 - space
      if(W3X < 0 || W3X + 100 > width){ SpeedW3 *= -1; }
      W3X += SpeedW3;
      rect(W3X,300,100,6);
    
      //ghost 
      //draw      
      image(ghost, ghostX, ghostY, 50, 50);
      
      //move & boundary    
      if(upPressed && ghostY > 0) {
          ghostY -= ghostSpeed;
      }
      
      if(downPressed && ghostY < height - ghost.height) {
          ghostY += ghostSpeed;
      }
    
      if(rightPressed && ghostX < width - ghost.width) {
          ghostX += ghostSpeed;
      }
         
      if(leftPressed && ghostX > 0) {
          ghostX -= ghostSpeed;
      }
      
      //change state
      //lose
      //wall1
      if(ghostY + ghost.height > 100 && ghostY < 105 && !(ghostX > W1X && ghostX + ghost.width < W1X+300) ){
        gameState = 3;
      }
      
      //wall2
      if(ghostY + ghost.height > 200 && ghostY < 205 && !(ghostX > W2X && ghostX + ghost.width < W2X+200) ){
        gameState = 3;
      }  
      //wall3
      if(ghostY + ghost.height > 300 && ghostY < 305 && !(ghostX > W3X && ghostX + ghost.width < W3X+100) ){
        gameState = 3;
      }
      
      //win
      if(ghostY >= 400){
        gameState = 2;
      }
      break;
      
  case GAME_WIN:
      if(mouseX > 150 && mouseX < 450 && mouseY > 210 && mouseY < 285){
        image(restart, 0, 0, width, height);
        if(mousePressed) {
          ghostX = (width / 2) - 25;
          ghostY = 0; 
          gameState = 1;
        }
      } else {
        image(win, 0, 0, width, height);
      }
      break;
  
  case GAME_LOSE:
      if(mouseX > 150 && mouseX < 450 && mouseY > 210 && mouseY < 285){
        image(restart, 0, 0, width, height);
        if(mousePressed) {
          ghostX = (width / 2) - 25;
          ghostY = 0; 
          gameState = 1;
        }
      } else {
        image(lose, 0, 0, width, height);
      }
      break;

  } 
}

void keyPressed() {
  if (key == CODED) {
     switch( keyCode ) {
     case UP:
         upPressed = true;
         break;
  
     case DOWN:
         downPressed = true;
         break;
         
     case RIGHT:
         rightPressed = true;
         break;
  
     case LEFT:
         leftPressed = true;
         break;
     }
  }
}

void keyReleased() {
  if (key == CODED) {
     switch( keyCode ) {
     case UP:
         upPressed = false;
         break;
  
     case DOWN:
         downPressed = false;
         break;
         
     case RIGHT:
         rightPressed = false;
         break;
  
     case LEFT:
         leftPressed = false;
         break;
     }
  }
}