PImage bg, fish, upBadCat, underBadCat, myCat, lose, win, restart;
final int FISH_W = 130;
final int FISH_H = 130;
final int BADCAT_INIT_X = 160;
final int BADCAT_INIT_Y = -140;
final int BADCAT_W = 150;
final int BADCAT_H = 430;
final int SPACE = 220;
final int MYCAT_X = 1080;
final int MYCAT_Y = 280;
final int MYCAT_W = 220;
final int MYCAT_H = 150;
final int RESTART_W = 150;
final int RESTART_H = 150;


int gameState = 0; 
/**************************
*    0: game is playing   *
*    1: game is lose      *
*    2: game is win       *
***************************/

int fishX, fishY;
float badCatY;
float x_inc = PI/15.0;
float k = 0.0;
float k_inc = PI/15.0;
final float A = 50.0; 


void setup()
{
  size(1280,755);
  bg = loadImage("img/bg.png");
  fish = loadImage("img/fish.png");
  upBadCat = loadImage("img/upBadCat.png");
  underBadCat = loadImage("img/underBadCat.png");  
  myCat = loadImage("img/myCat.png");
  lose = loadImage("img/lose.png");
  win = loadImage("img/win.png");
  restart = loadImage("img/restart.png");
}

void draw()
{
  switch(gameState) {
    case 0:
        image(bg, 0, 0, 1280, 755);
        
        //move the fish by mouse 
        fishX = mouseX-FISH_W/2;
        fishY = mouseY-FISH_H/2;
        if(fishX < 0 ){
          fishX = 0;
        } else if(fishX > 1280-FISH_W) {
          fishX = 1280-FISH_W;
        }
        if(fishY < 0) {
          fishY = 0;
        } else if(fishY > 755-FISH_H) {
          fishY = 755-FISH_H;
        }
        image(fish, fishX, fishY,FISH_W, FISH_H);
     
             
        //the badCat robs fish
        for(int i = 0; i < 6; i++) {
          badCatY =  A * sin(x_inc*i) + BADCAT_INIT_Y ;
      
           
         /* ... Part I  : badCats line up in sin wave " ...*/                
      

         /* ... Part II : how to tell "badCats rob fish" ...*/
             
          
        }
        
        
        /* ... Part III: badCats move in sin wave  ...*/    
        
        
        //success to feed myCat
        image(myCat, MYCAT_X, MYCAT_Y);
            
      
        /* ... Part II : how to tell "myCat has been fed fish" ...*/
      
            
        break;
  
      case 1:
        image(lose, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          
          
        /* ... Part II : After pressing restart image, game will restart ...*/
          
          
        }
        break;
        
      case 2:
        image(win, 0, 0);
        image(restart, 0, 0);
        if(mousePressed == true) {
          
          
        /* ... Part II : After pressing restart image, game will restart ...*/
          
          
        }
        break;
        
     default:
        print("error");
        break;
  }
}