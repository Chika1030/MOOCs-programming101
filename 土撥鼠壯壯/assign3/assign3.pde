PImage home, gameover, start1, start2, restart1, restart2;
PImage groundhogIdle, groundhogLeft, groundhogRight, groundhogDown;
PImage bg, life, soldier, cabbage, stone1, stone2;
PImage soil0, soil1, soil2, soil3, soil4, soil5;
int gameState = 0;
boolean leftState = false;
boolean rightState = false;
boolean downState = false;

final int grassHeight = 15;
final int gridSize = 80;
final int gridWidth = 8;
final int gridHeight = 6;

final int startButtonWidth = 144;
final int startButtonHeight = 60;
final int startButtonX = 248;
final int startButtonY = 360;

final int playerInitGridX = 4;
final int playerInitGridY = -1;

float playerX, playerY;
int playerHealth = 2;
int playerGridX, playerGridY;
int digDirection = 0;
int digTimer = 0;
int digDuration = 15;
float cabbageX, cabbageY, soldierX, soldierY;
float soldierSpeed = 4f;

float cameraOffsetY = 0;
float cameraFollowY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
	home = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	start1 = loadImage("img/startNormal.png");
	start2 = loadImage("img/startHovered.png");
	restart1 = loadImage("img/restartNormal.png");
	restart2 = loadImage("img/restartHovered.png");
	soil0 = loadImage("img/soil0.png");
	soil1 = loadImage("img/soil1.png");
	soil2 = loadImage("img/soil2.png");
	soil3 = loadImage("img/soil3.png");
	soil4 = loadImage("img/soil4.png");
	soil5 = loadImage("img/soil5.png");
	stone1 = loadImage("img/stone1.png");
	stone2 = loadImage("img/stone2.png");
	groundhogIdle = loadImage("img/groundhogIdle.png");
	groundhogLeft = loadImage("img/groundhogLeft.png");
	groundhogRight = loadImage("img/groundhogRight.png");
	groundhogDown = loadImage("img/groundhogDown.png");
	life = loadImage("img/life.png");
	soldier = loadImage("img/soldier.png");
	cabbage = loadImage("img/cabbage.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */
    
    
	switch (gameState) {

		case 0: // Start Screen
		image(home, 0, 0);

		if(startButtonX + startButtonWidth > mouseX    // r1 right edge past r2 left
	    && startButtonX < mouseX    // r1 left edge past r2 right
	    && startButtonY + startButtonHeight > mouseY    // r1 top edge past r2 bottom
	    && startButtonY < mouseY) { // r1 bottom edge past r2 top

			image(start2, startButtonX, startButtonY);
			if(mousePressed){
				gameState = 1;
				mousePressed = false;
				playerHealth = 2;
				playerGridX = 4;
				playerGridY = -1;
				cabbageX = gridSize * floor(random(8));
				cabbageY = gridSize * floor(random(2, 4));
				playerX = gridSize * playerGridX;
				playerY = gridSize * playerGridY;
				digTimer = 0;
				soldierX = -gridSize;
				soldierY = gridSize * floor(random(2, 4));
			}

		}else{

			image(start1, startButtonX, startButtonY);

		}

		break;

		case 1: // In-Game
		// Background
		image(bg, 0, 0);

		//sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120); 

		pushMatrix();

		cameraFollowY = max(gridSize * -18, gridSize * 1 - playerY); // <--- change this to groundhog's position!

		translate(0, cameraFollowY);

		// Ground

		fill(124, 204, 25);
		noStroke();
		rect(0, -grassHeight, width, grassHeight);
		for(int i = 0; i < gridWidth; i++){
			for(int j = 0; j < 24; j++){

				int areaIndex = floor(j / 4);
				switch (areaIndex) {
					case 0 :
					image(soil0, i * gridSize, j * gridSize);
					break;
					case 1 :
					image(soil1, i * gridSize, j * gridSize);
					break;
					case 2 :
					image(soil2, i * gridSize, j * gridSize);
					break;
					case 3 :
					image(soil3, i * gridSize, j * gridSize);
					break;
					case 4 :
					image(soil4, i * gridSize, j * gridSize);
					break;
					case 5 :
					image(soil5, i * gridSize, j * gridSize);
					break;
				}

				if(j < 8){

					if(j == i) image(stone1, i * gridSize, j * gridSize);

				}else if(j < 16){

					int offsetJ = j - 8;
					if(offsetJ == 0 || offsetJ == 3 || offsetJ == 4 || offsetJ == 7){
						if(i == 1 || i == 2 || i == 5 || i == 6){
							image(stone1, i * gridSize, j * gridSize);
						}
					}else{
						if(i == 0 || i == 3 || i == 4 || i == 7){
							image(stone1, i * gridSize, j * gridSize);
						}
					}

				}else{

					int offsetJ = j - 16;
					int stoneCount = (offsetJ + i) % 3;
					if(stoneCount >= 1){
						image(stone1, i * gridSize, j * gridSize);
					}
					if(stoneCount == 2){
						image(stone2, i * gridSize, j * gridSize);
					}

				}
			}
		}

		// Cabbage

		image(cabbage, cabbageX, cabbageY);
		if(playerHealth < 3
		&& cabbageX + gridSize > playerX    // r1 right edge past r2 left
	    && cabbageX < playerX + gridSize    // r1 left edge past r2 right
	    && cabbageY + gridSize > playerY    // r1 top edge past r2 bottom
	    && cabbageY < playerY + gridSize) { // r1 bottom edge past r2 top

			playerHealth ++;
			cabbageX = cabbageY = -gridSize;

		}

		// Player

		PImage groundHogDisplay = groundhogIdle;

		if(digTimer == 0 && keyPressed && key == CODED){

			switch(keyCode){
				case LEFT:
				if(playerX > 0){
					digDirection = LEFT;
					digTimer = digDuration;
					groundHogDisplay = groundhogLeft;
				}
				break;

				case RIGHT:
				if(playerX < width - gridSize){
					digDirection = RIGHT;
					digTimer = digDuration;
					groundHogDisplay = groundhogRight;
				}
				break;

				case DOWN:
				if(playerY < gridSize * 23){
					digDirection = DOWN;
					digTimer = digDuration;
					groundHogDisplay = groundhogDown;
				}
				break;
			}

		}

		if(digTimer > 0){

			digTimer --;
			switch(digDirection){

				case LEFT:
				groundHogDisplay = groundhogLeft;
				if(digTimer == 0){
					playerGridX --;
					playerX = gridSize * playerGridX;
				}else{
					playerX = (float(digTimer) / digDuration + playerGridX - 1) * gridSize;
				}
				break;

				case RIGHT:
				groundHogDisplay = groundhogRight;
				if(digTimer == 0){
					playerGridX ++;
					playerX = gridSize * playerGridX;
				}else{
					playerX = (1f - float(digTimer) / digDuration + playerGridX) * gridSize;
				}
				break;

				case DOWN:
				groundHogDisplay = groundhogDown;
				if(digTimer == 0){
					playerGridY ++;
					playerY = gridSize * playerGridY;
				}else{
					playerY = (1f - float(digTimer) / digDuration + playerGridY) * gridSize;
				}
				break;
			}

		}

		image(groundHogDisplay, playerX, playerY);

		// Soldier

		image(soldier, soldierX, soldierY);
		soldierX += soldierSpeed;

		if(soldierX > width){
			soldierX = -gridSize;
		}

		if(soldierX + gridSize > playerX    // r1 right edge past r2 left
	    && soldierX < playerX + gridSize    // r1 left edge past r2 right
	    && soldierY + gridSize > playerY    // r1 top edge past r2 bottom
	    && soldierY < playerY + gridSize) { // r1 bottom edge past r2 top

			playerHealth --;

			if(playerHealth == 0){

				gameState = 2;

			}else{

				playerGridX = playerInitGridX;
				playerGridY = playerInitGridY;
				playerX = gridSize * playerGridX;
				playerY = gridSize * playerGridY;

			}

		}

		popMatrix();

		// UI
		for(int i = 0; i < playerHealth; i++){
			image(life, 10 + i * 70, 10);
		}

		break;

		case 2: // Gameover Screen
		image(gameover, 0, 0);
		
		if(startButtonX + startButtonWidth > mouseX    // r1 right edge past r2 left
	    && startButtonX < mouseX    // r1 left edge past r2 right
	    && startButtonY + startButtonHeight > mouseY    // r1 top edge past r2 bottom
	    && startButtonY < mouseY) { // r1 bottom edge past r2 top

			image(restart2, startButtonX, startButtonY);
			if(mousePressed){
				gameState = 0;
				mousePressed = false;
			}
		}else{

			image(restart1, startButtonX, startButtonY);

		}
		break;
		
	}
    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;

      case 'r':
      debugMode = false;
      cameraOffsetY = 0;
      playerHealth = 2;
		playerGridX = 4;
		playerGridY = -1;
		cabbageX = gridSize * floor(random(8));
		cabbageY = gridSize * floor(random(2, 4));
		playerX = gridSize * playerGridX;
		playerY = gridSize * playerGridY;
		digTimer = 0;
		soldierX = -gridSize;
		soldierY = gridSize * floor(random(2, 4));
    }
    
	if(key==CODED){
		switch(keyCode){
			case LEFT:
			leftState = true;
			break;
			case RIGHT:
			rightState = true;
			break;
			case DOWN:
			downState = true;
			break;
		}
	}
}

void keyReleased(){
	if(key==CODED){
		switch(keyCode){
			case LEFT:
			leftState = false;
			break;
			case RIGHT:
			rightState = false;
			break;
			case DOWN:
			downState = false;
			break;
		}
	}else if(key == 's'){
		//saveFrame("cap/cap####.png");
	}
}