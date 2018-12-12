PImage home, gameover, start1, start2, restart1, restart2;
PImage groundhogIdle, groundhogLeft, groundhogRight, groundhogDown;
PImage bg, life, cabbage, stone1, stone2, soilEmpty;
PImage arrowLeft, arrowRight, arrowDown;
PImage soldier;
PImage[][] soils, stones;
int gameState = 0;
boolean leftState = false;
boolean rightState = false;
boolean downState = false;
boolean mouseReleaseState = true;

final int grassHeight = 15;
final int gridSize = 80;
final int gridWidth = 8;
final int gridHeight = 24;

int[][] gridState;

final int startButtonWidth = 144;
final int startButtonHeight = 60;
final int startButtonX = 248;
final int startButtonY = 360;

final int playerInitGridX = 4;
final int playerInitGridY = -1;

float playerX, playerY;
int playerHealth = 2;
final int PLAYER_MAX_HEALTH = 5;
int playerGridX, playerGridY;
int playerActionDirection = 0;
int playerActionTimer = 0;
int playerMoveDuration = 15;
int playerDigDuration = 15;

final int cabbageSpawnInterval = 4;
int[] cabbageGridX, cabbageGridY;

final int soldierSpawnInterval = 4;
final int soldierCountPerInterval = 2;
float[] soldierX, soldierY;
float soldierSpeed = 2f;

void setup() {
	size(640, 480, P2D);
	frameRate(60);
	bg = loadImage("img/bg.jpg");
	home = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	start1 = loadImage("img/startNormal.png");
	start2 = loadImage("img/startHovered.png");
	restart1 = loadImage("img/restartNormal.png");
	restart2 = loadImage("img/restartHovered.png");
	groundhogIdle = loadImage("img/groundhogIdle.png");
	groundhogLeft = loadImage("img/groundhogLeft.png");
	groundhogRight = loadImage("img/groundhogRight.png");
	groundhogDown = loadImage("img/groundhogDown.png");
	life = loadImage("img/life.png");
	soldier = loadImage("img/soldier.png");
	cabbage = loadImage("img/cabbage.png");

	soilEmpty = loadImage("img/soils/soilEmpty.png");
	soils = new PImage[6][5];
	for(int i = 0; i < soils.length; i++){
		for(int j = 0; j < soils[i].length; j++){
			soils[i][j] = loadImage("img/soils/soil" + i + "/soil" + i + "_" + j + ".png");
			println("img/soils/soil" + i + "/soil" + i + "_" + j + ".png");
		}
	}

	stones = new PImage[2][5];
	for(int i = 0; i < stones.length; i++){
		for(int j = 0; j < stones[i].length; j++){
			stones[i][j] = loadImage("img/stones/stone" + (i+1) + "/stone" + (i+1) + "_" + j + ".png");
			println("img/stones/stone" + i + "/stone" + i + "_" + j + ".png");
		}
	}

	arrowLeft = loadImage("img/arrowkeys/arrow_left.png");
	arrowRight = loadImage("img/arrowkeys/arrow_right.png");
	arrowDown = loadImage("img/arrowkeys/arrow_down.png");
}

void draw() {

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
				playerX = gridSize * playerGridX;
				playerY = gridSize * playerGridY;
				playerActionTimer = 0;
				gridState = new int[gridWidth][gridHeight];

				int[] emptyGridCount = new int[gridHeight];

				for(int j = 0; j < gridHeight; j++){
					emptyGridCount[j] = (j == 0) ? 0 : floor(random(1, 3));
				}

				for(int i = 0; i < gridWidth; i++){
					for(int j = 0; j < gridHeight; j++){

						if(random(gridWidth - i) < emptyGridCount[j]){

							gridState[i][j] = 0;
							emptyGridCount[j] --;

						}else{

							gridState[i][j] = playerDigDuration;

							if(j < 8){

								if(j == i) gridState[i][j] = 2 * playerDigDuration;

							}else if(j < 16){

								int offsetJ = j - 8;
								if(offsetJ == 0 || offsetJ == 3 || offsetJ == 4 || offsetJ == 7){
									if(i == 1 || i == 2 || i == 5 || i == 6){
										gridState[i][j] = 2 * playerDigDuration;
									}
								}else{
									if(i == 0 || i == 3 || i == 4 || i == 7){
										gridState[i][j] = 2 * playerDigDuration;
									}
								}

							}else{

								int offsetJ = j - 16;
								int stoneCount = (offsetJ + i) % 3;
								gridState[i][j] = (stoneCount + 1) * playerDigDuration;

							}
						}
					}
				}

				int cabbageCount = gridHeight / cabbageSpawnInterval;

				cabbageGridX = new int[cabbageCount];
				cabbageGridY = new int[cabbageCount];

				for(int i = 0; i < cabbageCount; i++){
					cabbageGridX[i] = floor(random(gridWidth));
					cabbageGridY[i] = cabbageSpawnInterval * i + floor(random(cabbageSpawnInterval));
				}

				int soldierCount = gridHeight / soldierSpawnInterval;

				soldierX = new float[soldierCount];
				soldierY = new float[soldierCount];

				for(int i = 0; i < soldierCount; i++){

					int soldierGridX, soldierGridY;

					soldierGridX = floor(random(gridWidth));
					soldierGridY = soldierSpawnInterval * i + floor(random(soldierSpawnInterval));

					soldierX[i] = soldierGridX * gridSize;
					soldierY[i] = soldierGridY * gridSize;

				}

			}

		}else{

			image(start1, startButtonX, startButtonY);

		}

		break;

		case 1: // In-Game
		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

	    // CAREFUL!
	    // Because of this translate value, the Y value of the ground level is actually 0
		pushMatrix();
		translate(0, max(gridSize * -18, gridSize * 1 - playerY));

		// Ground

		fill(124, 204, 25);
		noStroke();
		rect(0, -grassHeight, width, grassHeight);
		for(int i = 0; i < gridWidth; i++){
			for(int j = 0; j < gridHeight; j++){

				if(gridState[i][j] > 0){

					int soilColor = (int) j / 4;
					int soilAlpha = (int) min(5, ceil((float)gridState[i][j] / (playerDigDuration / 5))) - 1;

					image(soils[soilColor][soilAlpha], i * gridSize, j * gridSize);

					if(gridState[i][j] > playerDigDuration){
						int stoneSize = (int) min(5, ceil(((float)gridState[i][j] - playerDigDuration) / (playerDigDuration / 5))) - 1;
						image(stones[0][stoneSize], i * gridSize, j * gridSize);
					}

					if(gridState[i][j] > playerDigDuration * 2){
						int stoneSize = (int) min(5, ceil(((float)gridState[i][j] - playerDigDuration * 2) / (playerDigDuration / 5))) - 1;
						image(stones[1][stoneSize], i * gridSize, j * gridSize);
					}

				}else{
					image(soilEmpty, i * gridSize, j * gridSize);
				}

				noTint();
			}
		}

		// Debug Grid
		// noFill();
		// strokeWeight(1);
		// stroke(255, 0, 0);
		// for(int i = 0; i < gridWidth; i++){
		// 	for(int j = 0; j < 24; j++){
		// 		rect(i * gridSize, j * gridSize, gridSize, gridSize);
		// 	}
		// }

		// Cabbage

		for(int i = 0; i < cabbageGridX.length; i++){

			int cabbageX = cabbageGridX[i] * gridSize;
			int cabbageY = cabbageGridY[i] * gridSize;

			image(cabbage, cabbageX, cabbageY);

			if(playerHealth < PLAYER_MAX_HEALTH
			&& cabbageX + gridSize > playerX    // r1 right edge past r2 left
		    && cabbageX < playerX + gridSize    // r1 left edge past r2 right
		    && cabbageY + gridSize > playerY    // r1 top edge past r2 bottom
		    && cabbageY < playerY + gridSize) { // r1 bottom edge past r2 top

				playerHealth ++;
				cabbageGridX[i] = cabbageGridY[i] = -1;

			}

		}

		// Player

		PImage groundhogDisplay = groundhogIdle;

		if(playerActionTimer == 0){

			// If the grid under the player is empty, then force falling
			if(playerGridY + 1 < gridState[playerGridX].length && gridState[playerGridX][playerGridY + 1] == 0){

				playerActionDirection = DOWN;
				playerActionTimer = playerMoveDuration;
				groundhogDisplay = groundhogDown;

			}else{
			// If not, then capture input state

				if(leftState){

					if(playerX > 0){

						playerActionDirection = LEFT;

						// Check if there's soil on the left
						if(playerGridY >= 0 && gridState[playerGridX - 1][playerGridY] > 0){

							// If so, dig it and decrease its state
							gridState[playerGridX - 1][playerGridY] --;

						}else{

							// If not then start moving
							playerActionTimer = playerMoveDuration;

						}

						groundhogDisplay = groundhogLeft;

					}

				}else if(rightState){

					if(playerX < width - gridSize){

						playerActionDirection = RIGHT;

						if(playerGridY >= 0 && gridState[playerGridX + 1][playerGridY] > 0){

							gridState[playerGridX + 1][playerGridY] --;

						}else{

							playerActionTimer = playerMoveDuration;

						}

						groundhogDisplay = groundhogRight;

					}
				}else if(downState){

					playerActionDirection = DOWN;

					// Note that you don't have to define how to move down as the player will fall automatically
					if(playerGridY + 1 < gridState[playerGridX].length){

						gridState[playerGridX][playerGridY + 1] --;

					}

					groundhogDisplay = groundhogDown;
				}

			}

		}

		// Separated if-else so the player can actually move on the first frame of moving
		if(playerActionTimer > 0){

			playerActionTimer --;
			switch(playerActionDirection){

				case LEFT:
				groundhogDisplay = groundhogLeft;
				if(playerActionTimer == 0){
					playerGridX --;
					playerX = gridSize * playerGridX;
				}else{
					playerX = (float(playerActionTimer) / playerMoveDuration + playerGridX - 1) * gridSize;
				}
				break;

				case RIGHT:
				groundhogDisplay = groundhogRight;
				if(playerActionTimer == 0){
					playerGridX ++;
					playerX = gridSize * playerGridX;
				}else{
					playerX = (1f - float(playerActionTimer) / playerMoveDuration + playerGridX) * gridSize;
				}
				break;

				case DOWN:
				groundhogDisplay = groundhogDown;
				if(playerActionTimer == 0){
					playerGridY ++;
					playerY = gridSize * playerGridY;
				}else{
					playerY = (1f - float(playerActionTimer) / playerMoveDuration + playerGridY) * gridSize;
				}
				break;
			}

		}

		image(groundhogDisplay, playerX, playerY);

		// Soldier

		for(int i = 0; i < soldierX.length; i++){

			soldierX[i] += soldierSpeed;
			if(soldierX[i] >= width) soldierX[i] = -gridSize;

			image(soldier, soldierX[i], soldierY[i]);

			if(soldierX[i] + gridSize > playerX    // r1 right edge past r2 left
		    && soldierX[i] < playerX + gridSize    // r1 left edge past r2 right
		    && soldierY[i] + gridSize > playerY    // r1 top edge past r2 bottom
		    && soldierY[i] < playerY + gridSize) { // r1 bottom edge past r2 top

				playerHealth --;

				if(playerHealth == 0){

					gameState = 2;

				}else{

					playerGridX = playerInitGridX;
					playerGridY = playerInitGridY;
					gridState[playerInitGridX][playerInitGridY + 1] = playerDigDuration;
					playerX = gridSize * playerGridX;
					playerY = gridSize * playerGridY;
					playerActionTimer = 0;

				}

			}
		}


		color tC;
		tC = (leftState) ? #00ff00 : #ffffff;
		tint(tC, (leftState) ? 255f : 60f);
		image(arrowLeft, playerX - 45, playerY - 60, 50, 50);

		tC = (downState) ? #00ff00 : #ffffff;
		tint(tC, (downState) ? 255f : 60f);
		image(arrowDown, playerX + 15, playerY - 60, 50, 50);

		tC = (rightState) ? #00ff00 : #ffffff;
		tint(tC, (rightState) ? 255f : 60f);
		image(arrowRight, playerX + 75, playerY - 60, 50, 50);
		noTint();

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
	}else{
		saveFrame("cap.png");
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
	}
}