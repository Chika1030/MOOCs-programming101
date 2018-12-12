final int N = 0;          // NONE
final int L = LEFT;       // Left
final int U = UP;         // Up
final int R = RIGHT;      // Right
final int D = DOWN;       // Down
final int X = -1;
final int BEAT_X = 100;
final int BEAT_Y = 150;
final int NOTE_W = 100;

PImage imgLeft, imgUp, imgRight, imgDown, imgCircle;
int [] notes = {D, R, D, N, D, L, R, N, D, R, N, N, D, R, R, D, R, D, N, D, L, R, N, D, N, D, L, L, N, R, N, N, D, R, R, N, N, N, N, N, N, N, N};
float firstNoteX;
int nowPressedNote;
float onBeatNoteX;
int onBeatNoteIndex;

int score = 0;
String message = "";
boolean keyDown = false;

void setup() {
  size(600,300);
  fill(0);
  textFont(createFont("arialBlack.ttf", 20));
  textAlign(CENTER);
  imageMode(CENTER);
  imgLeft = loadImage("left.png");
  imgUp = loadImage("up.png");
  imgRight = loadImage("right.png");
  imgDown = loadImage("down.png");
  imgCircle = loadImage("circle.png");
  firstNoteX = 0; 
}

void draw() { 
    background(255);
    
    float noteX;
    float noteY = BEAT_Y;
    float spacing = NOTE_W;
    PImage noteImg = null;
    for (int i=0; i<notes.length; i++){
        noteX = firstNoteX + i * spacing;
        
        if ((noteX < BEAT_X +15) && (noteX >BEAT_X -15)){
          onBeatNoteIndex = i;
          onBeatNoteX = noteX;
        }
        
        switch (notes[i]){
          case U:    noteImg = imgUp;      break;
          case D:    noteImg = imgDown;    break;
          case L:    noteImg = imgLeft;    break;
          case R:    noteImg = imgRight;   break;
          default:   noteImg = null;       break;
        }
        if (noteImg != null && 
           (noteX <width+NOTE_W) && 
           (noteX >0-NOTE_W)){
          image (noteImg, noteX, noteY);
        }
    }
    
    image(imgCircle, BEAT_X, BEAT_Y);
    
    switch (nowPressedNote){
      case U:  noteImg = imgUp;     break;
      case D:  noteImg = imgDown;   break;
      case L:  noteImg = imgLeft;   break;
      case R:  noteImg = imgRight;  break;
      default: noteImg = null;      break;
    }
    if (noteImg != null){
      tint(255,126);
      image (noteImg, BEAT_X, BEAT_Y);
    }
    tint(255,255);
    
    text(score, 545, 45);
    text(message, 100, 45);
    
    firstNoteX --;
}

void keyPressed(){
  if (!keyDown){
    keyDown = true;
    switch(keyCode){
      case UP:     nowPressedNote = U;    break;
      case DOWN:   nowPressedNote = D;    break;
      case LEFT:   nowPressedNote = L;    break;
      case RIGHT:  nowPressedNote = R;    break;
      default:     nowPressedNote = X;    break;
    }

    if (nowPressedNote == notes[onBeatNoteIndex]){
      int accuracy = int(map(abs(onBeatNoteX - BEAT_X),0,15, 3,1));
      switch (accuracy){
        case 3:
          score += 10;
          message = "Perfect!";
          break;
        case 2:
          score += 5;
          message = "Cool!";
          break;
        case 1:
          score += 2;
          message = "Good!";
          break;
      }
      notes[onBeatNoteIndex] = N;
    }
  }
}

void keyReleased(){
  keyDown = false;
  nowPressedNote = X;
}