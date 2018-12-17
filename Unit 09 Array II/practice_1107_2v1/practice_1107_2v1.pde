final int N = 0;                // Null
final color T = color(200);     // Topic
final color A = color(255);     // Answer
final color TR = color(255,0,0); // Topic-Repeat
final color AR = color(255,0,0); // Answer-Repeat


int[][] numbers = { 
{N, 2, N, N, N, 4, N, N, 8},
{4, N, N, N, 8, N, 9, 6, N},
{N, 7, N, N, N, 6, N, 2, 4},
{N, 4, N, N, N, N, 8, N, N},
{3, N, N, 8, 1, 7, N, 4, N},
{N, N, 2, N, N, 3, 5, N, 6},
{N, 1, N, 4, N, N, N, 9, N},
{8, N, N, 5, N, N, 7, N, N},
{7, N, 6, 3, N, N, N, 8, N}};

color[][] status = { 
{A, T, A, A, A, T, A, A, T},
{T, A, A, A, T, A, T, T, A},
{A, T, A, A, A, T, A, T, T},
{A, T, A, A, A, A, T, A, A},
{T, A, A, T, T, T, A, T, A},
{A, A, T, A, A, T, T, A, T},
{A, T, A, T, A, A, A, T, A},
{T, A, A, T, A, A, T, A, A},
{T, A, T, T, A, A, A, T, A}};



void setup() {
  size(450, 450);
  textFont(createFont("arialBlack.ttf", 20));
  textAlign(CENTER);
  rectMode(CORNER);
}

void draw() {
  background(255);
  
  for(int cols=0; cols<9; cols++){
    for(int rows=0; rows<9; rows++) {
      
      
      fill(status[cols][rows]);
      rect(rows*50, cols*50, 50, 50);
      
      if(numbers[cols][rows] != N) {
        fill(0);      
        text(numbers[cols][rows], (rows)*50+25, (cols)*50+30);
      }
    }
  }
}

void keyPressed() {
  int keyNum = 0;
  int X = mouseX;
  int Y = mouseY;
  
  switch(key){
    case '1': keyNum=1; break;
    case '2': keyNum=2; break;
    case '3': keyNum=3; break;
    case '4': keyNum=4; break;
    case '5': keyNum=5; break;
    case '6': keyNum=6; break;
    case '7': keyNum=7; break;
    case '8': keyNum=8; break;
    case '9': keyNum=9; break;
    default : break;
  }
    
  //for(int i=0; i<9; i++){
    
  //  if(keyNum == numbers[Y/50][i]) {
  //    status[Y/50][X/50] = AR;
  //    status[Y/50][i] = (status[Y/50][i]==T) ? TR : AR ;
  //  } else if(keyNum == numbers[i][X/50]) {
  //    status[Y/50][X/50] = AR;
  //    status[i][X/50] = (status[i][X/50]==T) ? TR : AR ;
  //  } else {
  //    numbers[Y/50][X/50] = keyNum;
  //  }
  //}
}