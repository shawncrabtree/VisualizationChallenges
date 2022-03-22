

void setup() {
  size(1200, 1200);
  background(255);
}

Square nextMove = Square.Red;
int numRows = 7;
int numCols = 6;
int squareSize = 120;
Board board = new Board();

void draw() {
  stroke(0);
  board.draw();
}

void mouseClicked() {
  int colClicked = mouseX / squareSize;
  if (colClicked <= numRows) {
    println(colClicked);
    board.drop(colClicked, nextMove);
  }
  nextMove = nextMove == Square.Red ? Square.Black : Square.Red;
}
