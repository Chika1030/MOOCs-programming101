//Declare fish object
Fish[] fish = new Fish[10];
Panel[] btn = new Panel[4];
Panel account = new Panel();

//Declare fish size 
final int S = 80;
final int M = 130;
final int L = 200;

//Declare button text and size
String[] btnTxt = {"Random-sized", "Small-sized", "Medium-sized", "Large-sized"}; 
float btnW = 200;
float btnH = 40;


void setup() {
  size(800, 600);
  fish[account.getFishAccount()] = new Fish(btnH);
  for(int i=0; i<4; i++){ btn[i] = new Panel(i, btnTxt[i], btnW, btnH); }
}


void draw() {
  background(0, 255, 255);
  for(int i=0; i<4; i++) { btn[i].showButton(); }  
  for(int i=0; i<10; i++) {
    if(fish[i] != null) {
      fish[i].move();
      fish[i].display();
    }
  }
  account.showFishAccount();
}

void mouseClicked() {
  if( mouseY > 0 && mouseY < btnH && account.getFishAccount() < 10) {
    if(mouseX > btn[0].getLeftBound() && mouseX < btn[0].getRightBound()){
      fish[account.getFishAccount()] = new Fish(btnH);
      account.addFish();
    } else if(mouseX > btn[1].getLeftBound() && mouseX < btn[1].getRightBound()){
      fish[account.getFishAccount()] = new Fish(btnH, S);
      account.addFish();
    } else if(mouseX > btn[2].getLeftBound() && mouseX < btn[2].getRightBound()){
      fish[account.getFishAccount()] = new Fish(btnH, M);
      account.addFish();
    } else if(mouseX > btn[3].getLeftBound() && mouseX < btn[3].getRightBound()){
      fish[account.getFishAccount()] = new Fish(btnH, L);
      account.addFish();
    } else {}
  }
}