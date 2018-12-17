final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;
int state = GO_RIGHT;
int ufoX, ufoY;
int speed = 3;
PImage ufo;

void setup() {
  size(800, 800);
  ufo = loadImage("ufo.png");
  ufoX = ufo.width/2;
  ufoY = ufo.height/2;
}

void draw() {
  background(255);
  switch (state) {
    case GO_RIGHT:
      ufoX += speed;
      if (ufoX + ufo.width/2 > width) {
        ufoX = width - ufo.width/2;
        state = GO_DOWN;
      }
    break;
    case GO_DOWN:
      ufoY += speed;
      if (ufoY + ufo.height/2 > height) {
        ufoY = height - ufo.height/2;
        state = GO_LEFT;
      }
    break;
    case GO_LEFT:
      ufoX -= speed;
      if (ufoX - ufo.width/2 < 0) {
        ufoX = ufo.width/2;
        state = GO_UP;
      }
    break;
    case GO_UP:
      ufoY -= speed;
      if (ufoY - ufo.height/2 < 0) {
        ufoY = ufo.height/2;
        state = GO_RIGHT;
      }
    break;
  }
  imageMode(CENTER);
  image(ufo, ufoX, ufoY);
}
