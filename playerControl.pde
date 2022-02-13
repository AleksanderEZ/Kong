void processInput(){
  if (player2Up){
    commands.get("movePlayer2Up").execute();
  }
  if (player2Down) {
    commands.get("movePlayer2Down").execute();
  }
  if (player1Up) {
    commands.get("movePlayer1Up").execute();
  }
  if (player1Down) {
    commands.get("movePlayer1Down").execute();
  }
}

void keyPressed(){
  if (keyCode == UP){
    player2Up = true;
  }
  if (keyCode == DOWN) {
    player2Down = true;
  }
  if (key == 'W' || key == 'w') {
    player1Up = true;
  }
  if (key == 'S' || key == 's') {
    player1Down = true;
  }
}

void keyReleased(){
  if (keyCode == UP){
    player2Up = false;
  }
  if (keyCode == DOWN) {
    player2Down = false;
  }
  if (key == 'W' || key == 'w') {
    player1Up = false;
  }
  if (key == 'S' || key == 's') {
    player1Down = false;
  }
}
