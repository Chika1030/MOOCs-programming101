boolean[][] grid ;

// Number of columns and rows in the grid
int cols = 10 ;
int rows = 10 ;
int cellWidth = 0 ; 
int cellHeight = 0 ;

// Color present grid status
color turnOnColor = #F0F5FB ;
color turnOffColor = #022547 ;

void setup() {
  size(400,400) ;
  stroke(#95A5B5);
  cellWidth = width / cols  ;
  cellHeight = height / rows ; 
  grid = new boolean[cols][rows] ;
}

void draw() {
  background(0) ;

  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      color statusColor = (grid[i][j]) ? turnOnColor : turnOffColor ;
      fill(statusColor) ;
      rect(cellWidth*i, cellHeight*j, cellWidth, cellHeight) ;
    }
  }
}

void mouseClicked (){
   int i = mouseX / cellWidth ; 
   int j = mouseY / cellHeight ; 
   
   grid[i][j] = !grid[i][j] ;
   if ( i + 1  < cols){grid[i+1][j] = !grid[i+1][j] ; }
   if ( j + 1  < rows){ grid[i][j+1] = !grid[i][j+1] ; }
   if ( i - 1  >= 0 ){ grid[i-1][j] = !grid[i-1][j] ; }
   if ( j - 1  >= 0 ){ grid[i][j-1] = !grid[i][j-1] ; }  
}