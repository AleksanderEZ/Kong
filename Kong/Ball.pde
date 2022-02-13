class Ball implements Figure {
 int radius;
 float horizontalPos;
 float verticalPos;
 
 Ball(int radius){
   this.radius = radius;
   this.horizontalPos = 0;
   this.verticalPos = 0;
 }
 
 Ball(int radius, int horizontalPos, int verticalPos){
   this.radius = radius;
   this.horizontalPos = horizontalPos;
   this.verticalPos = verticalPos;
 }
 
 void show() {
   circle(horizontalPos, verticalPos, radius);
 }
 
 void move(int newVerticalPosition){
    this.verticalPos = newVerticalPosition;
 }
  
 void move(int newHorizontalPos, int newVerticalPos){
   horizontalPos = newHorizontalPos;
   verticalPos = newVerticalPos;
 }
 
 void move(float newVerticalPosition){
    this.verticalPos = newVerticalPosition;
 }
  
 void move(float newHorizontalPos, float newVerticalPos){
   horizontalPos = newHorizontalPos;
   verticalPos = newVerticalPos;
 }
 
 float getHorizontalPosition(){
   return horizontalPos;
 }
 
 float getVerticalPosition(){
   return verticalPos;
 }
}
