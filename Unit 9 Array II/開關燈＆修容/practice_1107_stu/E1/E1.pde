boolean[][] grid ;

// Number of columns and rows in the grid
int cols = 10 ;
int rows = 10 ;
int cellWidth = 0 ; 
int cellHeight = 0 ;

// The grid status color
color turnOnColor = #F0F5FB ;
color turnOffColor = #022547 ;


void setup() {
  size(400,400) ;
  stroke(#95A5B5);
  cellWidth = width / cols  ;
  cellHeight = height / rows ; 
}


void draw() {
  background(0) ;

}