PImage soil = loadImage("img/soil.png"); //<>//
PImage stone = loadImage("img/stone.png");

final int GRID_SIZE = 80;

size(640,640);
image(soil,0, 0);
image(soil,0, soil.height);

for (int x=0; x<8; x++){
  image(stone, x*GRID_SIZE ,x*GRID_SIZE);
  image(stone, (x+2)%8*GRID_SIZE ,x*GRID_SIZE);
  image(stone, (x+4)%8*GRID_SIZE ,x*GRID_SIZE);
  image(stone, (x+6)%8*GRID_SIZE ,x*GRID_SIZE);

} 
