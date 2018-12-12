final boolean R = true;               // right side
final boolean B = false;              // back  side
final color Red = color(255, 0, 0);   // right side
final color Black = color(0);         // back  side

boolean[][] taco2dArray = {
{B, B, B, B, B},
{B, R, B, B, R},
{R, B, R, B, B},
{B, B, R, B, R},
{B, B, R, R, B}
};

color c;

void setup() {
  size(250, 250);
  noStroke();
  ellipseMode(CORNER);
}

void draw() {
  background(255);
  for(int cols=0; cols<5; cols++){
    for(int rows=0; rows<5; rows++) {  
      fill(c = taco2dArray[cols][rows] ? Red : Black);
      ellipse(rows*50, cols*50, 48, 48);
    }
  }
}

void mouseClicked() {
  int X = mouseX/50;
  int Y = mouseY/50;  
  
  taco2dArray[Y][X] = !taco2dArray[Y][X];
  if(X-1>-1){ taco2dArray[Y][X-1] = !taco2dArray[Y][X-1]; }
  if(X+1<5){ taco2dArray[Y][X+1] = !taco2dArray[Y][X+1]; }
  if(Y-1>-1){ taco2dArray[Y-1][X] = !taco2dArray[Y-1][X]; }
  if(Y+1<5){ taco2dArray[Y+1][X] = !taco2dArray[Y+1][X]; }
}