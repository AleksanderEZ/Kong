class PlayerStick implements Figure {
  int stickWidth;
  int stickHeight;
  float verticalPosition;
  float horizontalPosition;
  
  PlayerStick(int stickWidth, int stickHeight){
    this.stickWidth = stickWidth;
    this.stickHeight = stickHeight;
    this.verticalPosition = 0;
    this.horizontalPosition = 0;
  }
  
  PlayerStick(int stickWidth, int stickHeight, int horizontalPosition, int verticalPosition){
    this.stickWidth = stickWidth;
    this.stickHeight = stickHeight;
    this.verticalPosition = verticalPosition;
    this.horizontalPosition = horizontalPosition;
  }
  
  void show(){
    rect(horizontalPosition, verticalPosition, stickWidth, stickHeight);
    fill(green[0], green[1], green[2], green[3]);
    rect(horizontalPosition + 2, verticalPosition - 6, stickWidth-4, 6);
    fill(yellow[0], yellow[1], yellow[2], yellow[3]);
  }
  
  void move(float newVerticalPosition){
    this.verticalPosition = newVerticalPosition;
  }
  
  void move(float newHorizontalPosition, float newVerticalPosition){
    this.horizontalPosition = newHorizontalPosition;
    this.verticalPosition = newVerticalPosition;
  }
  
  float getHorizontalPosition(){
   return horizontalPosition;
  }
  
  float getVerticalPosition(){
   return verticalPosition;
  }
}
