final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int block=80;
int groundhogIdleX = block*4;
int groundhogIdleY = block ;

float groundhogSpeed = 4;
float groundhogX; 
float groundhogY;
float groundhogWidth = 80;
float groundhogHeight = 80;

int down = 0;
int right = 0;
int left = 0;
float step = 80.0;
int frames = 15;
int floorSpeed = 0;
float downMove = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, groundhogIdle, groundhogDown, groundhogLeft, groundhogRight, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, life, soil0, soil1, soil2, soil3, soil4, soil5, stone1, stone2;

int button_L = 248, button_R = 248+144;
int button_T = 360, button_D = 360+60;

boolean downPressed  = false;
boolean leftPressed  = false;
boolean rightPressed  = false;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
  playerHealth = 2;
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
  life = loadImage ("img/life.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");

  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  //groundhogPosition
  groundhogX = groundhogIdleX;
  groundhogY = groundhogIdleY;
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

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
     //1-4 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil0, x*block, y*block + downMove + block*2);
      }}
     //5-8 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil1, x*block,  y*block + downMove + block*6);
      }}
     //9-12 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil2, x*block,  y*block + downMove + block*10);
      }}
     //13-16 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil3, x*block,  y*block + downMove + block*14);
      }}
     //17-20 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil4, x*block,  y*block + downMove + block*18);
      }}
     //21-24 soil
    for (int x = 0; x < 8; x++){  
      for (int y = 0; y < 4; y++){
      image(soil5, x*block,  y*block + downMove + block*22);
      }}
      
    //stone 1-8
    for (int i = 0; i < 8; i++){
      image(stone1, i*block, i*block + downMove + block*2);
    }
    //stone 9-16
    //case1
    for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==0 || x==3 || x==4 || x==7 ) && ( y==1 || y==2 || y==5 || y==6 )) {
      image(stone1, x*block, y*block + block*2 + downMove + 4*2*block);
    }}}
    //case2
    for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==1 || x==2 || x==5 || x==6 ) && ( y==0 || y==3 || y==4 || y==7 )) {
      image(stone1, x*block, y*block + block*2 + downMove + 4*2*block);
    }}}
    //stone 17-24
      //stone1_case1
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==1 || x==2 || x==4 || x==5 || x==7 ) && ( y==0 || y==3 || y==6 )) {
      image(stone1, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
    //stone1_case2
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==0 || x==1 || x==3 || x==4 || x==6 || x==7 ) && ( y==1 || y==4 || y==7 )) {
      image(stone1, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
    //stone1_case3
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==0 || x==2 || x==3 || x==5 || x==6 ) && ( y==2 || y==5 )) {
      image(stone1, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
    
    //stone2_case1
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==2 || x==5 ) && ( y==0 || y==3 || y==6 )) {
      image(stone2, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
     //stone2_case2
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==1 || x==4 || x==7 ) && ( y==1 || y==4 || y==7 )) {
      image(stone2, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
     //stone2_case3
      for (int x = 0; x < 8; x++){
      for(int y=0; y<8; y++){
      if(( x==0 || x==3 || x==6 ) && ( y==2 || y==5 )) {
      image(stone2, x*block, y*block + block*2 + downMove + 4*2*2*block);
    }}}
   
		// Player
//groundhog move
    //down
    if (down > 0 && downMove > -1600) {
      floorSpeed -=1;
      if (down == 1) {
        downMove = round(step/frames*floorSpeed);
        image(groundhogIdle, groundhogX, groundhogY);
      } else {
        downMove = step/frames*floorSpeed;
        image(groundhogDown, groundhogX, groundhogY);
      }
      down -=1;
    }

    if (down > 0 && downMove == -1600) {
      if (down == 1) {
        groundhogY = round(groundhogY + step/frames);
        image(groundhogIdle, groundhogX, groundhogY);
      } else {
        groundhogY = groundhogY + step/frames;
        image(groundhogDown, groundhogX, groundhogY);
      }
      down -=1;
    }

    //left
    if (left > 0) {
      if (left == 1) {
        groundhogX = round(groundhogX - step/frames);
        image(groundhogIdle, groundhogX, groundhogY);
      } else {
        groundhogX = groundhogX - step/frames;
        image(groundhogLeft, groundhogX, groundhogY);
      }
      left -=1;
    }

    //right
    if (right > 0) {
      if (right == 1) {
        groundhogX = round(groundhogX + step/frames);
        image(groundhogIdle, groundhogX, groundhogY);
      } else {
        groundhogX = groundhogX + step/frames;
        image(groundhogRight, groundhogX, groundhogY);
      }
      right -=1;
    }

    //no move
    if (down == 0 && left == 0 && right == 0 ) {
      image(groundhogIdle, groundhogX, groundhogY);
    }

		// Health UI
    for(int i=0 ;  i< playerHealth; i++){
     image(life, i*70 + 10, 10); 
    }
    if(playerHealth <= 0){
      gameState = GAME_OVER;
     }

		break;

		case GAME_OVER:
      image(gameover, 0, 0);
      image(restartNormal, 248, 360);
      if( mouseX > button_L && mouseX < button_R && 
           mouseY > button_T && mouseY < button_D){
           image( restartHovered, 248, 360); 
           if(mousePressed){
             gameState = GAME_RUN;
                   //initial life and groundhog
        mousePressed = false;        
        down = 0;
        left = 0;
        right = 0;
        playerHealth=2;
      }
    } else {
      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
    }
    break;
  }
           
     

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
if (down>0 || left>0 || right>0) {
    return;
  }
  if (key == CODED) {
    switch(keyCode) {
    case DOWN:
      if (groundhogY < 400) {
        downPressed = true;
        down = 15;
      }
      break;
    case LEFT:
      if (groundhogX > 0) {
        leftPressed = true;
        left = 15;
      }
      break;
    case RIGHT:
      if (groundhogX < 560) {
        rightPressed = true;
        right = 15;
      }
      break;
    }
  }

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
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
    }
}

void keyReleased(){
}
