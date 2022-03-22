Square nextMove = Square.Red;
int numRows = 6;
int numCols = 7;
int squareSize = 120;
int FOUR = 4;
Board board = new Board();

void setup() {
  size(1200, 1200);
  background(255);
  println("TESTS: " + new Tests().run());
  board.drop(0, Square.Red);
  board.drop(numCols-1, Square.Black);
}

void draw() {
  stroke(0);
  board.draw();
}

void mouseClicked() {
  int colClicked = mouseX / squareSize;
  if (colClicked < numCols) {
    board.drop(colClicked, nextMove);

    Square winner = board.winner();
    if (winner != null) {
      println("WINNNNERENRENRENR");
    }
  }
  nextMove = nextMove == Square.Red ? Square.Black : Square.Red;
}
