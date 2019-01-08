Ball b;

void setup(){
  size(300,300);
  b = new Ball();
}

void draw(){
  background(255);
  b.move();
  b.display();
}
