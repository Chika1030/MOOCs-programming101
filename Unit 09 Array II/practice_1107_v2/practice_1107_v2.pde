int[] numbers = new int[25];
int[] washedNumbers = new int[25];
int[][] game2dArray = new int[5][5];
//color[] fill1dArray = new color[25];
color[][] fill2dArray = new color[5][5];
color correctColor = color(165, 344, 245);
int counter = 1;

void setup() {
  size(500, 500);
  textFont(createFont("arialBlack.ttf", 20));
  textAlign(CENTER);
  rectMode(CORNER);
  for(int i=0; i<numbers.length; i++){ numbers[i] = i+1; }
  //for(int i=0; i<numbers.length; i++){ fill1dArray[i] = 255; }
  for(int i=0; i<numbers.length; i++){ fill2dArray[i/5][i%5] = 255; }
  
  /*** Mission 1: wash 1 to 25 numbers ***/
  for(int i=0; i < numbers.length; i++) {
    int randomIndex = floor(random(numbers.length-i));
    
    /*** Mission 2 [sol.3]: put numbers in game2dArray ***
    game2dArray[i/5][i%5] = numbers[randomIndex];
    numbers[randomIndex] = numbers[numbers.length-1-i];
    /*****************************************************/
    
    washedNumbers[i] = numbers[randomIndex];
    numbers[randomIndex] = numbers[numbers.length-1-i];
  }
}

void draw() {
  background(255);
 
  
  /***  Mission 2 [sol.1]: put washedNumbers in game2dArray by nested loop ***/
  for(int cols=0; cols<5; cols++){
    for(int rows=0; rows<5; rows++) {
      fill(fill2dArray[cols][rows]);
      rect((cols)*100, (rows)*100, 100, 100);
      
      /*** Mission 2: show the numbers in the 5*5 matrix ***/
      fill(0);
      game2dArray[cols][rows] = washedNumbers[cols*5+rows];
      text(game2dArray[cols][rows], (cols)*100+50, (rows)*100+50);
    }
  }
  /*****************************************************************************/

  
  
  /***  Mission 2 [sol.2]:  put washednumbers in game2dArray by loop ***
  for(int i=0; i<washedNumbers.length; i++) {
    fill(fill2dArray[i/5][i%5]);
    rect((i/5)*100, (i%5)*100, 100, 100);
    fill(0);
    game2dArray[i/5][i%5] = washedNumbers[i];
    text(game2dArray[i/5][i%5], (i/5)*100+50, (i%5)*100+50);
  }
  /*********************************************************************/
  
 
 
  /*** Mission 2 [sol.3]: put numbers in game2dArray ***
  for(int i=0; i<numbers.length; i++) {
    fill(fill2dArray[i/5][i%5]);
    rect((i/5)*100, (i%5)*100, 100, 100);
    fill(0);
    text(game2dArray[i/5][i%5], (i/5)*100+50, (i%5)*100+50);
  }
  /*****************************************************/
  
  
   /*** Mission 2 [sol.4]: show washedNumber by 1dArray ***
   for(int i=0; i<washedNumbers.length; i++) {
     fill(fill1dArray[i]);
     rect((i/5)*100, (i%5)*100, 100, 100);
     fill(0);
     text(washedNumbers[i], (i/5)*100+50, (i%5)*100+50);
   }
  /********************************************************/
}

/*** Mission 3: change the matrix color when clicking the correct number ***/
void mousePressed() {
  fill(165);
  rect((mouseX)/100*100, (mouseY)/100*100, 100, 100);
  
  /*** Mission 3 [sol.1]: change the matrix color by 2dArray ***/
  if( counter == game2dArray[(mouseX)/100][(mouseY)/100] ){
    counter ++;
    fill2dArray[(mouseX)/100][(mouseY)/100] = correctColor;
  }
  /**************************************************************/
  
   /*** Mission 3 [sol.2]: change the matrix color by 1dArray ***
   if( counter == washedNumbers[((mouseX)/100)*5+(mouseY)/100] ){
    counter ++;
    fill1dArray[((mouseX)/100)*5+(mouseY)/100] = correctColor;
  }
  /**************************************************************/
}