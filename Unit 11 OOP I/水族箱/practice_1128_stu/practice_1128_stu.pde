//Declare fish size 
final float S = 80;
final float M = 130;
final float L = 200;

Fish fish[] = new Fish[10];

//Declare button size, text position & contents 
float btnW = 200;
float btnH = 40;
float txtInitX = 100;
float txtY = 25;
String[] txt = {"Random-sized", "Small-sized", "Medium-sized", "Large-sized"}; 

int fishCounter;


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
  text("Fish Amount : " + fishCounter, txtInitX, height-txtY);

   // move and display a fish
   for(int i=0; i<fishCounter; i++) {
     fish[i].move();
     fish[i].display();
   }
}


void mouseClicked() {
  if(mouseY > 0 && mouseY < 50 && fishCounter<10) {
    if(mouseX > 0 && mouseX < btnW*1) {
      // press random button
      // setup a fish
      fish[fishCounter++] = new Fish();
    } else if(mouseX > btnW*1 && mouseX < btnW*2) {
      // press small button
      fish[fishCounter++] = new Fish();
    } else if(mouseX > btnW*2 && mouseX < btnW*3) {
      // press medium button
      fish[fishCounter++] = new Fish();
    } else if(mouseX > btnW*3 && mouseX < btnW*4) {
      // press large button
      fish[fishCounter++] = new Fish();
    } 
  }  
}