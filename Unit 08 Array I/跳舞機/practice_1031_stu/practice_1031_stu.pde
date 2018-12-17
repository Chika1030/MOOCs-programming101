final int N = 0;       // NONE
final int L = 1;       // Left
final int U = 2;       // Up
final int R = 3;       // Right
final int D = 4;       // Down
final int MISS = -1;   // Missing
final int P = 0;       // Perfect
final int C = 1;       // Cool
final int G = 2;       // Good

PImage imgLeft, imgUp, imgRight, imgDown, imgCircle;
boolean keydown;
int firstNoteX, currentNoteIndex, performace, score;
int [] notes = {N, N, N, N, N, N, N, D, R, D, N, D, L, R, N, D, R, N, N, D, R, R, D, R, D, N, D, L, R, N, D, N, D, L, L, N, R, N, N, D, R, R, N, N, N, N, N, N, N, N};

void setup() {
  size(600,300);
  fill(0);
  textFont(createFont("arialBlack.ttf", 20));
  textAlign(LEFT);
  imageMode(CENTER);
  imgLeft = loadImage("left.png");
  imgUp = loadImage("up.png");
  imgRight = loadImage("right.png");
  imgDown = loadImage("down.png");
  imgCircle = loadImage("circle.png");
  firstNoteX = 0;  
  performace= MISS;
  keydown = false;
}

void draw() {
  if(currentNoteIndex<notes.length-7){
    
    background(255);
    firstNoteX -= 2;
    currentNoteIndex = firstNoteX/(-100)+1;
    
    
    
    /*** 1. show the moving notes ***/
    
    
        
    // beat circle
    image(imgCircle, 100, 150);
    
              
    // show the pressed arrow & check whether on the beat    
    int nowPressed = N;
    int beatAccuracy;
    
    if(keyPressed) {
      tint(255, 126);
      switch(keyCode) {        /*** 2. show the pressed arrow ***/
        case LEFT:    break;
        case UP:      break;
        case RIGHT:   break;
        case DOWN:    break;
        default:      break;
      }
      tint(255, 255);
      
      if(!keydown) { performace = MISS; keydown = true; }
      
      
      
      /*** 3. check whether on the beat && decide score ***/   
    
    
    
    }
                 
                   
    // show comment
    String comment; 
    switch(performace){
      case P:  comment = "Perfect!";  break;
      case C:  comment = "Cool!";     break;
      case G:  comment = "Good!";     break;
      default: comment = "";          break;
    }
    text(comment, 30, 30);
    
    /*** 3. show the score ***/ 
    
  }
}

void keyReleased(){ keydown = false; }