Square player = Square.Red;

int numRows = 6;
int numCols = 7;
int squareSize = 120;
int FOUR = 4;
Board board = new Board();

private Square otherPlayer(Square s) {
  return s == Square.Red ? Square.Black : Square.Red;
}

void setup() {
  size(1200, 1200);
  background(255);
  println("TESTS: " + new Tests().run());

  // board.put(0, 3, Square.Black);
  //board.put(1, 2, Square.Black);
  //board.put(2, 1, Square.Black);
  //board.put(3, 0, Square.Black);
  //println("WINNER: "+ board.winner());
}

void draw() {
  stroke(0);
  board.draw();
}

void mouseClicked() {
  int colClicked = mouseX / squareSize;
  if (colClicked < numCols) {
    board.drop(colClicked, player);

    Square winner = board.winner();
    if (winner == player) {
      println("PLAYER WINNNNS");
    }

    Square computerPlayer = otherPlayer(player);
    int computerPlay = new MinimaxStrategy().pickMove(board, computerPlayer);
    board.drop(computerPlay, computerPlayer);

    winner = board.winner();
    if (winner == computerPlayer) {
      println("COMPUTER WINNNNNNS");
    }
  }
}
