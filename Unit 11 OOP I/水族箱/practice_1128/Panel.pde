class Panel {
  
  // properties
  int index;
  String txt;
  float btnX, btnW, btnH, txtX;
  float txtInitX = 100;
  float txtY = 25;
  int fishCounter;
  
  
  //method - Button
  void showButton() {
    fill(240);
    stroke(100);
    strokeWeight(1); 
    rect(btnX, 0, btnW, btnH);
    fill(0);
    text(txt, txtX, txtY);
  }
  
  float getUpBound()    {  return 0;          }
  float getDownBound()  {  return btnH;       }
  float getLeftBound()  {  return btnX;       }
  float getRightBound() {  return btnX+btnW;  }
  
  
  //method - Fish account
  void showFishAccount() {
    fill(0);
    text("Fish Amount : " + fishCounter, txtInitX, height-txtY);
  }
  
  void addFish() { 
    fishCounter += 1; 
  }
  
  int getFishAccount() {
    return fishCounter;
  }
  
  
  // constructor - Button
  Panel(int index, String txt, float btnW, float btnH){
    textFont(createFont("AppleGothic", 15));
    textAlign(CENTER);
    btnX = index*btnW;
    this.btnW = btnW;
    this.btnH = btnH;
    this.txt = txt;
    txtX = txtInitX+btnW*index;  
  }
  
  
  // constructor overloading - Fish account
  Panel() {
    fishCounter = 0;
  }
}