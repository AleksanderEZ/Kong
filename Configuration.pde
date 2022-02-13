int width = 800;
int height = 600;

int player1Horizontal = 50;
int player2Horizontal = 750;
int playerWidth = 10;
int playerHeight = 60;
int playerSpeed = 5;
PlayerStick player1Stick;
PlayerStick player2Stick;
Map<String, Command> commands;
boolean player1Up, player1Down, player2Up, player2Down;
int player1Score = 0;
int player2Score = 0;

int black = 0;
int white = 255;
int [] yellow = new int [] {255, 233, 0, 255};
int [] green = new int [] {126, 155, 57, 255};

String title = "Kong";

String windowIconPath = "resources/icon.png";
PImage windowIcon;

int celebrationFrames = 30;
String scoreCelebrationPath = "resources/scoreAnimation/frame_";
Animation scoreCelebrationAnimation;
boolean celebrating = false;
int celebrationFrame;

Ball ball;
int ballRadius = 20;
float ballPower = 2;
float initialBallHorizontalMovement = 3;
float ballHorizontalMovement = initialBallHorizontalMovement;
float ballArch = random(0, atan2(height/2, width/2)) * 180/PI;
float ballVerticalMovement = ballPower * sin(ballArch);
int coolDown;
int wantedCoolDown = 100;

String soundPath = "resources/Sound/";
SoundFile bounceSound1, bounceSound2, bounceSound3, interactionSound1, interactionSound2, interactionSound3, celebrationSound, uhSound;

boolean play = false;
PImage WASD, ARROWS;
String WASDpath = "resources/wasd.png";
String ARROWSpath = "resources/arrowKeys.png";

String startText = "Use these keys to move your banana";
String blinkingText = "Press a key to start";
int startTextSize = 40;
int blinkingTextSize = 52;
boolean blink = false;

int centerLineSize = 20;
int centerLineGap = 40;

void configureWindow(){
  windowIcon = loadImage(windowIconPath);
  surface.setTitle(title);
  //surface.setResizable(true);
  surface.setIcon(windowIcon);
}

void configureScreen() {
  background(black);
  noStroke();
  fill(yellow[0], yellow[1], yellow[2], yellow[3]);
  frameRate(120);
  //smooth();
}

void configureCelebration(){
  scoreCelebrationAnimation = new Animation(scoreCelebrationPath, ".png", celebrationFrames, 0);
}

void configureBall() {
  ball = new Ball(ballRadius, width/2, height/2);
}

void configurePlayer1() {
  player1Stick = new PlayerStick(playerWidth, playerHeight, player1Horizontal, height/2 - playerHeight/2);
  commands.put("movePlayer1Up", new MoveUpCommand(player1Stick, playerSpeed));
  commands.put("movePlayer1Down", new MoveDownCommand(player1Stick, playerSpeed));
}

void configurePlayer2() {
  player2Stick = new PlayerStick(playerWidth, playerHeight, player2Horizontal, height/2 - playerHeight/2);
  commands.put("movePlayer2Up", new MoveUpCommand(player2Stick, playerSpeed));
  commands.put("movePlayer2Down", new MoveDownCommand(player2Stick, playerSpeed));
}

void configureSound() {
  bounceSound1 = new SoundFile(this, soundPath + "Bounce1.wav");
  bounceSound2 = new SoundFile(this, soundPath + "Bounce2.wav");
  bounceSound3 = new SoundFile(this, soundPath + "Bounce3.wav");
  interactionSound1 = new SoundFile(this, soundPath + "Interaction1.wav");
  interactionSound2 = new SoundFile(this, soundPath + "Interaction2.wav");
  interactionSound3 = new SoundFile(this, soundPath + "Interaction3.wav");
  celebrationSound = new SoundFile(this, soundPath + "Celebration.wav");
  uhSound = new SoundFile(this, soundPath + "Uh.mp3");
}

void configureStart() {
  WASD = loadImage(WASDpath);
  ARROWS = loadImage(ARROWSpath);
  WASD.resize((int) width/3, (int) height/2);
  ARROWS.resize((int) width/3, (int) height/2);
}
