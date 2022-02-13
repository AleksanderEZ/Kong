import java.awt.image.BufferedImage;
import javax.imageio.*;
import java.util.Map;
import java.util.HashMap;
import processing.sound.*;


void settings(){
  size(width, height); 
}

void setup() {
  commands = new HashMap<String, Command>();
  configureWindow();
  configureScreen();
  configureCelebration();
  configureBall();
  configurePlayer1();
  configurePlayer2();
  configureSound();
  configureStart();
  throwBall();
}

void throwBall() {
  ball.move(width/2, height/2);
  ballHorizontalMovement = initialBallHorizontalMovement;
  ballArch = random(0, atan2(height/2, width/2)) * 180/PI;
  ballVerticalMovement = ballPower * sin(ballArch);
  if(random(1) < 0.5){
    ballHorizontalMovement *= -1;
  }
  if(random(1) < 0.5){
    ballVerticalMovement *= -1;
  }
}

void draw() {
  processInput();
  repaint();
}

void repaint() {
  background(black);
  if (celebrating) {
    scoreCelebrationAnimation.display(0, 0);
    if(frameCount >= celebrationFrame + (celebrationFrames * 3)){
      celebrating = false;
    }
  }
  if (play && !celebrating) {
    playing();
  } else if (!celebrating){
    startMenu();
  }
}

void drawCenterLine() {
  stroke(white);
  for (int i = 0; i < height; i += centerLineGap) {
    line(width/2, i, width/2, i+centerLineSize);
  }
  noStroke();
}

void checkBounce(){
  if (ball.getHorizontalPosition() >= width - ballRadius/2)
  {
    player1Scores();
  }
  if (ball.getHorizontalPosition() <= 0 + ballRadius/2) {
    player2Scores();
  }
  if (ball.getVerticalPosition() >= height - ballRadius/2 || ball.getVerticalPosition() <= 0 + ballRadius/2)
  {
    playBounceSound();
    ballVerticalMovement = -ballVerticalMovement;
  }
  if (player1Stick.getVerticalPosition()<=ball.getVerticalPosition()+ballRadius/2 && ball.getVerticalPosition()-ballRadius/2<=player1Stick.getVerticalPosition()+playerHeight && player1Stick.getHorizontalPosition()<=ball.getHorizontalPosition()+ballRadius/2 && ball.getHorizontalPosition()-ballRadius/2<=player1Stick.getHorizontalPosition()+playerWidth) {
    playBounceSound();
    ballHorizontalMovement -= 0.3;
    ballHorizontalMovement = -ballHorizontalMovement;
  }
  if (player2Stick.getVerticalPosition()<=ball.getVerticalPosition()+ballRadius/2 && ball.getVerticalPosition()-ballRadius/2<=player2Stick.getVerticalPosition()+playerHeight && player2Stick.getHorizontalPosition()<=ball.getHorizontalPosition()+ballRadius/2 && ball.getHorizontalPosition()-ballRadius/2<=player2Stick.getHorizontalPosition()+playerWidth){
    playBounceSound();
    ballHorizontalMovement += 0.3;
    ballHorizontalMovement = -ballHorizontalMovement;
  }
  if (player1Stick.getVerticalPosition() >= height - playerHeight) {
    player1Stick.move(player1Stick.getHorizontalPosition(), height - playerHeight);
  }
  if (player1Stick.getVerticalPosition() <= 0) {
    player1Stick.move(player1Stick.getHorizontalPosition(), 0);
  }
  if (player2Stick.getVerticalPosition() >= height - playerHeight) {
    player2Stick.move(player2Stick.getHorizontalPosition(), height - playerHeight);
  }
  if (player2Stick.getVerticalPosition() <= 0) {
    player2Stick.move(player2Stick.getHorizontalPosition(), 0);
  }
}

void player1Scores() {
  player1Score++;
  throwBall();
  coolDown = wantedCoolDown;
  showCelebration();
}

void player2Scores() {
  player2Score++;
  throwBall();
  coolDown = wantedCoolDown;
  showCelebration();
}

void showCelebration() {
  celebrationFrame = frameCount;
  celebrating = true;
  playCelebrationSound();
}

void drawScore() {
  drawText(""+player1Score, 48, (int) (width*0.2), 40);
  drawText(""+player2Score, 48, (int) (width - (width*0.2)), 40);
}

void drawWASD() {
  image(WASD, 30, 30);
}

void drawARROWS() {
  image(ARROWS, width - ARROWS.width - 30, 30);
}

void drawText(String text, int size, int pos1, int pos2) {
  fill(white);
  textSize(size);
  text(text, pos1, pos2);
  fill(yellow[0], yellow[1], yellow[2], yellow[3]);
}

void playing() {
  drawCenterLine();
  player1Stick.show();
  player2Stick.show();
  ball.show();
  if (coolDown > 0) {
    coolDown--;
    return;
  }
  ball.move(ball.getHorizontalPosition() + ballHorizontalMovement, ball.getVerticalPosition() + ballVerticalMovement);  
  checkBounce();
  drawScore();
}

void startMenu() {
  drawText(startText, startTextSize, (int) (0.05 * width), height - height/4);
  if (frameCount % 30 == 0) {
    blink = !blink;
  }
  if (blink) {
    drawText(blinkingText, blinkingTextSize, (int) (0.2 * width), height - height/8);
  }
  drawWASD();
  drawARROWS();
  if (keyPressed) {
    play = true;
    playInteractionSound();
    coolDown = wantedCoolDown;
  }
}

void playBounceSound(){
  float roll = random(1);
  if (roll > 0.66){
    bounceSound1.play();
  } else if (roll > 0.33) {
    bounceSound2.play();
  } else if (roll > 0.01){
    bounceSound3.play();
  } else { 
    uhSound.play();
  }
}

void playCelebrationSound() {
  float roll = random(1);
  if (roll > 0.5){
    celebrationSound.play();
  } else {
    uhSound.play();
  }
}

void playInteractionSound() {
  float roll = random(1);
  if (roll > 0.75){
    interactionSound1.play();
  } else if (roll > 0.50) {
    interactionSound2.play();
  } else if (roll > 0.25){
    interactionSound3.play();
  } else {
    uhSound.play();
  }
}
