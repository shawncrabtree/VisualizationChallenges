class Tests {

  public boolean run() {
    println("RUNNING TESTS");
    return boardWinnerBottomLeftRow() &&
      boardWinnerBottomRightRow();
  }

  public boolean boardWinnerBottomLeftRow() {
    Board testBoard = new Board();
    testBoard.drop(0, Square.Red);
    testBoard.drop(1, Square.Red);
    testBoard.drop(2, Square.Red);
    testBoard.drop(3, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerBottomRightRow() {
    Board testBoard = new Board();
    testBoard.drop(3, Square.Red);
    testBoard.drop(4, Square.Red);
    testBoard.drop(5, Square.Red);
    testBoard.drop(6, Square.Red);
    return testBoard.winner() == Square.Red;
  }
}
