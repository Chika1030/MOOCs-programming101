//Declare button size, text position & contents 
float btnW = 200;
float btnH = 40;
float txtInitX = 100;
float txtY = 25;
String[] txt = {"Creat a Fish", "Creat a Turtle", "Feed", "Clear"}; 

Animal animal[] = new Animal[10];
Feed feed;
int aniCounter;


void setup() {
  size(800, 600);
  textFont(createFont("AppleGothic", 15));
  textAlign(CENTER);
}


void draw() {
  background(0, 255, 255);
  
  // draw buttons
  fill(240);
  stroke(100);
  strokeWeight(1); 
  for(int i=0; i<4; i++){ rect(btnW*i, 0, btnW, btnH); }
  fill(0);      
  for(int i=0; i<4; i++){ text(txt[i], i*btnW+txtInitX, txtY); }
  text("Animal Amount : " + aniCounter, txtInitX, height-txtY);

   // move and display animals
   for(int i=0; i<aniCounter; i++) {
     animal[i].move();
     animal[i].display();
   }
   
   if(feed != null) {
     // move and display feed
     feed.move();
     feed.display();
     
     // animals move to feed 
     
   }
}


void mouseClicked() {
  if(mouseY > 0 && mouseY < 50) {
    if(mouseX > 0 && mouseX < btnW*1 && aniCounter<10) {
      // setup a fish
      animal[aniCounter++] = new Fish();
    } else if(mouseX > btnW*1 && mouseX < btnW*2 && aniCounter<10) {
      // setup a turtle
      animal[aniCounter++] = new Turtle();
    } else if(mouseX > btnW*2 && mouseX < btnW*3) {
      // feed animal 
      feed = new Feed();
    } else if(mouseX > btnW*3 && mouseX < btnW*4) {
      // clear the fishbowl    
      for(int i=0; i<aniCounter; i++){        
        animal[i] = null;
      }
      aniCounter = 0;
    } 
  }  
}