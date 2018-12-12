PImage bg, soil, groundhog, life, robot, soldier;

final int grassHeight = 15;
final int gridSize = 80;
final int gridWidth = 8;
final int gridHeight = 6;

float playerX, playerY;

float soldierX, soldierY;
float soldierSpeed = 4;

float robotX, robotY;

final float robotHandOffsetX = 25;
final float robotHandOffsetY = 37;

final float laserRange = gridSize * 2;
final float laserMaxLength = 20;
final float laserLineWeight = 10;
final float laserSpeed = 2;

float laserPosition = 0f;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
	soil = loadImage("img/soil.png");
	groundhog = loadImage("img/groundhog.png");
	life = loadImage("img/life.png");
	robot = loadImage("img/robot.png");
	soldier = loadImage("img/soldier.png");
	robotX = gridSize * floor(random(2, gridWidth));
	robotY = gridSize * floor(random(2, gridHeight));
	soldierX = -gridSize;
	soldierY = gridSize * floor(random(2, gridHeight));
}

void draw() {

	// Background
	image(bg, 0, 0, width, height);

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

	// Debug Grid
	noFill();
	stroke(255, 0, 0);
	strokeWeight(1);
	for(int i = 0; i < gridWidth; i++){
		for(int j = 2; j < gridHeight; j++){
			rect(i * gridSize, j * gridSize, gridSize, gridSize);
		}
	}

	// Player
	image(groundhog, width / 2 - 40, gridSize);

	// Soldier
	soldierX += soldierSpeed;
	soldierX %= (width + gridSize);
	image(soldier, soldierX - gridSize, soldierY);

	// Robot
	image(robot, robotX, robotY);

	// Laser
	laserPosition = ( laserPosition + laserSpeed ) % ( laserRange + robotHandOffsetX );

	strokeWeight(laserLineWeight);
	stroke(255, 0, 0);
	float robotHandX = robotX + robotHandOffsetX;
	float robotHandY = robotY + robotHandOffsetY;
	float laserHeadX = min(robotHandX, robotHandX - laserPosition);
	float laserTailX = min(robotHandX, laserHeadX + laserMaxLength);
	line(laserHeadX, robotHandY, laserTailX, robotHandY);

	// UI
	image(life, 10, 10);
	image(life, 80, 10);
	image(life, 150, 10);
}