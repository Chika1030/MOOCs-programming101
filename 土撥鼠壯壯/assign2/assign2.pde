PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage groundhogIdle, groundhogLeft, groundhogRight, groundhogDown;
PImage bg, soil, life, soldier, cabbage;
int gameState = 0;
boolean leftState = false;
boolean rightState = false;
boolean downState = false;

boolean smoothMove = false;

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

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil = loadImage("img/soil.png");
	groundhogIdle = loadImage("img/groundhogIdle.png");
	groundhogLeft = loadImage("img/groundhogLeft.png");
	groundhogRight = loadImage("img/groundhogRight.png");
	groundhogDown = loadImage("img/groundhogDown.png");
	life = loadImage("img/life.png");
	soldier = loadImage("img/soldier.png");
	cabbage = loadImage("img/cabbage.png");

	// init
	playerHealth = 2;
	playerGridX = playerInitGridX;
	playerGridY = playerInitGridY;
	cabbageX = gridSize * floor(random(8));
	cabbageY = gridSize * floor(random(2, 6));
	playerX = gridSize * playerGridX;
	playerY = gridSize * (playerGridY + 2);
	digTimer = 0;
	soldierX = -gridSize;
	soldierY = gridSize * floor(random(2, 6));
}

void draw() {

	switch (gameState) {

		case 0: // Start Screen
		image(title, 0, 0);

		if(startButtonX + startButtonWidth > mouseX    // r1 right edge past r2 left
	    && startButtonX < mouseX    // r1 left edge past r2 right
	    && startButtonY + startButtonHeight > mouseY    // r1 top edge past r2 bottom
	    && startButtonY < mouseY) { // r1 bottom edge past r2 top

			image(startHovered, startButtonX, startButtonY);
			if(mousePressed){
				gameState = 1;
				mousePressed = false;
			}

		}else{

			image(startNormal, startButtonX, startButtonY);

		}

		break;

		case 1: // In-Game
		// Background
		image(bg, 0, 0);

		// Sun
		strokeWeight(5);
		stroke(255, 255, 0);
		fill(253, 184, 19);
		ellipse(width - 50, 50, 120, 120);

		// Ground

		fill(124, 204, 25);
		noStroke();
		rect(0, gridSize * 2 - grassHeight, width, grassHeight);
		image(soil, 0, gridSize * 2);

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

		if(smoothMove){

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
					if(playerY < height - gridSize){
						digDirection = DOWN;
						digTimer = digDuration;
						groundHogDisplay = groundhogDown;
					}
					break;
				}

			}else if(digTimer > 0){

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
						playerY = gridSize * (playerGridY + 2);
					}else{
						playerY = (1f - float(digTimer) / digDuration + playerGridY + 2) * gridSize;
					}
					break;
				}

			}
		}else{
			if(playerX > 0 && leftState){
				playerGridX --;
				playerX = gridSize * playerGridX;
				leftState = false;
			}else if(playerX < width - gridSize && rightState){
				playerGridX ++;
				playerX = gridSize * playerGridX;
				rightState = false;
			}else if(playerY < height - gridSize && downState){
				playerGridY ++;
				playerY = gridSize * (playerGridY + 2);
				downState = false;
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
				mousePressed = false;

			}else{

				digTimer = 0;
				playerGridX = playerInitGridX;
				playerGridY = playerInitGridY;
				playerX = gridSize * playerGridX;
				playerY = gridSize * (playerGridY + 2);

			}

		}

		// UI
		if(playerHealth >= 1){
			image(life, 10, 10);
		}
		if(playerHealth >= 2){
			image(life, 80, 10);
		}
		if(playerHealth >= 3){
			image(life, 150, 10);
		}

		break;

		case 2: // Gameover Screen
		image(gameover, 0, 0);
		
		if(startButtonX + startButtonWidth > mouseX    // r1 right edge past r2 left
	    && startButtonX < mouseX    // r1 left edge past r2 right
	    && startButtonY + startButtonHeight > mouseY    // r1 top edge past r2 bottom
	    && startButtonY < mouseY) { // r1 bottom edge past r2 top

			image(restartHovered, startButtonX, startButtonY);
			if(mousePressed){
				gameState = 1;
				mousePressed = false;

				// init
				playerHealth = 2;
				playerGridX = playerInitGridX;
				playerGridY = playerInitGridY;
				cabbageX = gridSize * floor(random(8));
				cabbageY = gridSize * floor(random(2, 6));
				playerX = gridSize * playerGridX;
				playerY = gridSize * (playerGridY + 2);
				digTimer = 0;
				soldierX = -gridSize;
				soldierY = gridSize * floor(random(2, 6));
			}

		}else{

			image(restartNormal, startButtonX, startButtonY);

		}
		break;
		
	}
}

void keyPressed(){
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
	}else if(key=='s'){
		smoothMove = !smoothMove;
	}else if(key=='r'){
		gameState = 2;
	}else if(key=='a'){
		gameState = 0;
		// init
		playerHealth = 2;
		playerGridX = playerInitGridX;
		playerGridY = playerInitGridY;
		cabbageX = gridSize * floor(random(8));
		cabbageY = gridSize * floor(random(2, 6));
		playerX = gridSize * playerGridX;
		playerY = gridSize * (playerGridY + 2);
		digTimer = 0;
		soldierX = -gridSize;
		soldierY = gridSize * floor(random(2, 6));
	}
}