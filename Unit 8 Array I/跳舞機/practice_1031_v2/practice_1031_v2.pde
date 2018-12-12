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
  keydown = false;
  firstNoteX = 0;  
  performace= MISS;
}

void draw() {
  if(currentNoteIndex<notes.length-7){
    
    background(255);
    firstNoteX -= 2;
    currentNoteIndex = firstNoteX/(-100)+1;
    
    
    // show the move arraw
    for(int i =  currentNoteIndex-1; i<currentNoteIndex+7; i++) {
      switch(notes[i]){
        case 0:  break;
        case 1:  image(imgLeft, firstNoteX+i*100, 150);     break;
        case 2:  image(imgUp, firstNoteX+i*100, 150);       break;
        case 3:  image(imgRight, firstNoteX+i*100, 150);    break;
        case 4:  image(imgDown, firstNoteX+i*100, 150);     break;
        default: break;
      }
    }
    
        
    // beat circle
    image(imgCircle, 100, 150);
    
           
    // show the pressed arrow & check whether on the beat   
    int nowPressed = N;
    int beatAccuracy = floor(map(dist(firstNoteX+(currentNoteIndex)*100, 150, 100, 150), 0, 30, 0, 3));
    
    if(keyPressed){
      tint(255, 126);
      switch(keyCode) {
        case LEFT:  image(imgLeft, 100, 150);     nowPressed = L;     break;
        case UP:    image(imgUp, 100, 150);       nowPressed = U;     break;
        case RIGHT: image(imgRight, 100, 150);    nowPressed = R;     break;
        case DOWN:  image(imgDown, 100, 150);     nowPressed = D;     break;
        default:    nowPressed = N;            break;
      }
      tint(255, 255);
      
      if(!keydown) { performace = MISS; keydown = true; }
      
      if(notes[currentNoteIndex]==nowPressed &&  beatAccuracy<3) {
        notes[currentNoteIndex] = 0;
        performace = beatAccuracy;
        switch(performace){
          case P:  score += 10;    break;
          case C:  score += 5;     break;
          case G:  score += 2;     break;
          default: break;
        }
      }
    }
                 
                   
    // show comment & score
    String comment; 

    switch(performace){
      case P:  comment = "Perfect!";  break;
      case C:  comment = "Cool!";     break;
      case G:  comment = "Good!";     break;
      default: comment = "";          break;
    }
    
    text(comment, 30, 30);
    text(score, 500, 30);

  }
}

void keyReleased(){ keydown = false; }