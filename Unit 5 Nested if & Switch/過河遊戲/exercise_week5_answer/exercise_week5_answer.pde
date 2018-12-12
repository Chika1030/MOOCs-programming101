PImage bg,start1,start2,lose,win,restart,ghost;
float wall1, wall2, wall3;
float SpeedW1=1;
float SpeedW2=2;
float SpeedW3=3;
float ghostX, ghostY;
float ghostSpeed=5;
final int GAME_START = 0, GAME_RUN = 1, GAME_WIN = 2, GAME_LOSE = 3;
int gameState=0;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup(){
  size(600,500);
  bg=loadImage("img/bg.jpg");
  start1=loadImage("img/start1.jpg");
  start2=loadImage("img/start2.jpg");
  lose=loadImage("img/lose.jpg");
  win=loadImage("img/win.jpg");
  restart=loadImage("img/restart.jpg");
  ghost=loadImage("img/ghost.jpg");
  ghostX=width/2-25;
  ghostY=0; 
  wall1=100;
  wall2=100;
  wall3=100;
}

void draw(){
  
  switch(gameState){
    
    //start
    case 0:
    image(start1,0,0);
    if(mouseX>=150 && mouseX<=450 && mouseY>=210 && mouseY<=285){
    image(start2,0,0);
      if(mousePressed){gameState=1;}
    }
    
    break;
    
    //Game
    case 1:
    image(bg,0,0,width,height);
    
    //ghost
        //draw  
        image(ghost,ghostX,ghostY,50,50);
        
        //move    
        if (upPressed) { ghostY -= ghostSpeed; }
        if (downPressed) { ghostY += ghostSpeed; }
        if (leftPressed) { ghostX -= ghostSpeed; }
        if (rightPressed) { ghostX += ghostSpeed; }
        
        //boundary  
        if (ghostX+50 > width) { ghostX = width-50; }
        if (ghostX < 0) { ghostX = 0; }
        if (ghostY+50 > height) { ghostY = height-50; }
        if (ghostY < 0) { ghostY = 0; }
    
    //wall
    fill(135,200,155);
    noStroke();
    //wall1
      rect(0,100,wall1,5);
      rect(wall1+300,100,width,5);
      wall1+=SpeedW1;
      if(wall1 <= 0) { SpeedW1*=-1; }
      if(wall1+300 >= width) { SpeedW1*=-1; }
      
    //wall2
      rect(0,200,wall2,5);
      rect(wall2+200,200,width,5);
      wall2+=SpeedW2;
      if(wall2 <= 0) { SpeedW2*=-1; }
      if(wall2+200 >= width) { SpeedW2*=-1; }
      
    //wall3
      rect(0,300,wall3,5);
      rect(wall3+100,300,width,5);
      wall3+=SpeedW3;
      if(wall3 <= 0) { SpeedW3*=-1; }
      if(wall3+100 >= width) { SpeedW3*=-1; }
    
    //win
    if(ghostY+25 >= 400) { gameState=2; }
    
    //lose
      //wall1
      if(ghostY<=105 && ghostY+50>=100 && ghostX<=wall1 && ghostX+50>=0) { gameState=3; }
      if(ghostY<=105 && ghostY+50>=100 && ghostX<=width && ghostX+50>=wall1+300) { gameState=3; }
      //wall2
      if(ghostY<=205 && ghostY+50>=200 && ghostX<=wall2 && ghostX+50>=0) { gameState=3; }
      if(ghostY<=205 && ghostY+50>=200 && ghostX<=width && ghostX+50>=wall2+200) { gameState=3; }
      //wall3
      if(ghostY<=305 && ghostY+50>=300 && ghostX<=wall3 && ghostX+50>=0) { gameState=3; }
      if(ghostY<=305 && ghostY+50>=300 && ghostX<=width && ghostX+50>=wall3+100) { gameState=3; }

      
    break;
  
    
    //win
    case 2:
    image(win,0,0);
    if(mouseX>=150 && mouseX<=450 && mouseY>=210 && mouseY<=285){
    image(restart,0,0);
      if(mousePressed){
      gameState=1;
      ghostX=width/2;
      ghostY=50;
      }
    }
    break;
    
    //lose
    case 3:
    image(lose,0,0);
    if(mouseX>=150 && mouseX<=450 && mouseY>=210 && mouseY<=285){
    image(restart,0,0);
      if(mousePressed){
      gameState=1;
      ghostX=width/2-25;
      ghostY=0;
      }
    }
    break;
    

  }  
}

void keyPressed() {
  if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}