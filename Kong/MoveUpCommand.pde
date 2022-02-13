class MoveUpCommand implements Command {
  Figure figure;
  int pixelsPerUnit = -3;
  
  MoveUpCommand(Figure figure, int playerSpeed) {
    this.figure = figure;
    pixelsPerUnit = -playerSpeed;
  }
  
  @Override
  void execute() {
    figure.move(figure.getVerticalPosition() + pixelsPerUnit);
  }
}
