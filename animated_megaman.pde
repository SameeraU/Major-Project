PImage[] manRight= new PImage[10];
PImage[] manUp = new PImage[4];
PImage[] manJump = new PImage[5];
int imageCounter, upImageCounter, jumpImageCounter;
float megaManX, megaManY, DX, DY;
boolean movingUp, movingDown, movingRight, movingLeft;
boolean flip, up, jump;

void setup() {
  size(800, 600);
  
  imageCounter = 0;
  upImageCounter = 0;
   jumpImageCounter = 0;

  
  megaManX = 200;
  megaManY = 300;
  
  movingUp = false;
  movingDown = false;
  movingRight = false;
  movingLeft = false;
  flip = false;
  up = false;
  jump = false;
  
  DX = 5;
  DY = 5;

   for (int i=0; i<manRight.length; i++) {
      manRight[i] = loadImage( i + ".png");
    }
    for (int i=0; i<manUp.length; i++) {
      manUp[i] = loadImage( i + "up.png");
    }
    for (int i=0; i<manJump.length; i++) {
      manJump[i] = loadImage( i + "jump.png");
    }
  
  
  
  
}

void draw() {
  background(255);
  if (!up){
  
    if(flip==false){
      translate(megaManX, megaManY);
      image(manRight[imageCounter], 0,0);
    }
    else{
      pushMatrix();
      translate(megaManX, megaManY);
      scale(-1, 1);
      image(manRight[imageCounter], 0,0);
      popMatrix();
    }
  }
  else{
    image(manUp[upImageCounter], megaManX,megaManY);
  }
  if (jump){
     image(manJump[jumpImageCounter], megaManX,megaManY);
  }
 
  
  
    moveRight();
 
  
}
void moveRight(){
  if (keyPressed){
    if (frameCount%3 ==0){
      if (key == 'A' || key == 'a'||key == 'D' || key == 'd'){
      
        move();
        imageCounter++;
        imageCounter = imageCounter % manRight.length;  //don't fall off the end of the array
      }
      if (key == 'W' || key == 'w' && up == true){
      
        move();
        upImageCounter++;
        upImageCounter = upImageCounter % manUp.length;  //don't fall off the end of the array
      }
      if (jump){
      
        
        jumpImageCounter++;
        jumpImageCounter = jumpImageCounter % manJump.length;  //don't fall off the end of the array
      }
    }
  }
}

void move() {
  if (movingUp == true) {
    megaManY -= DY;
  }
  if (movingDown == true) {
    megaManY += DY;
  }
  if (movingLeft == true) {
    megaManX -= DX;
    
  }
  if (movingRight == true) {
    megaManX += DX;
  }
  
}
void keyPressed() {
  if (key == 'W' || key == 'w') {
    movingUp = true;
    up = true;
     jump = false;
  }
  if (key == 'S' || key == 's') {
    movingDown = true;
  }
  if (key == 'A' || key == 'a') {
    movingLeft = true;
    flip = true;
    up= false;
     jump = false;
    
  }
  if (key == 'D' || key == 'd') {
    movingRight = true;
    flip = false;
    up = false;
    jump = false;
  }
  if (key == ' ') {
    jump = true;
  }
}

void keyReleased() {
  imageCounter = 0;
  if (key == 'W' || key == 'w') {
    movingUp = false;
  }
  if (key == 'S' || key == 's') {
    movingDown = false;
  }
  if (key == 'A' || key == 'a') {
    movingLeft = false;
  }
  if (key == 'D' || key == 'd') {
    movingRight = false;
  }
  if (key == ' ') {
    jump = false;
  }
}