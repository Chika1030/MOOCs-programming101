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
int [] notes = {N, N, N, N, N, N, N, D, R, D, N, D, L, R, N, D, R, N, N, D, R, R, D, R, D, N, D, L, R, N, D, N, D, L, L, N, R, N, N, D, R, R, N, N, N, N, N, N, N, N};
int [] tracks = new int[9];
int count, speed, performace, score;

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
  for(int i = 0; i < 8; i++) {tracks[i] = notes[i];}
  keydown = false;
  count =  0;
  speed = 2;
  performace = MISS;
}

void draw() {
if(count/-100 < notes.length-7){  
    background(255);
    PImage [] images = { imgLeft, imgUp, imgRight, imgDown } ;


    // show the move arraw
    if(count%100==0){ tracks[8] = notes[(count/-100)+8]; }
    
    for(int i = 0; i < 8; i++) {
      if(count%100==0) { tracks[i] = tracks[i+1]; }
      if(tracks[i]>N) { image(images[tracks[i]-1], 100*i+count%100, 150); }
    }
 
    count -= speed;
        
        
    // beat circle
    image(imgCircle, 75, 150);
        
        
    // show the pressed arrow & check whether on the beat 
    int trackX1 = 100+count%100;
    int nowPressed = N;
    int beatAccuracy = floor(map(dist(trackX1, 150, 75, 150), 0, 10, 0, 3));
        
    if(keyPressed){
      if (key == CODED) {
        
        switch(keyCode) {
          case LEFT:  nowPressed = L;  break;
          case UP:    nowPressed = U;  break;
          case RIGHT: nowPressed = R;  break;
          case DOWN:  nowPressed = D;  break;
        }
            
        if(nowPressed != N) {
          tint(255, 100);
          image(images[nowPressed-1], 75, 150);
          tint(255, 255);
        }  
        
        if(!keydown) { performace = MISS; keydown = true; }
        
        if(tracks[1]==nowPressed &&  beatAccuracy<3) {
          tracks[1] = N;
          performace = beatAccuracy;
          switch(performace){
            case P:  score += 10;    break;
            case C:  score += 5;     break;
            case G:  score += 2;     break;
            default: break;
          }
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