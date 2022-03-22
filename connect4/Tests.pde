class Tests {

  public boolean run() {
    println("RUNNING TESTS");
    return boardWinnerBottomLeftRow() &&
      boardWinnerBottomRightRow() &&
      boardWinnerBottomLeftRowPut() &&
      boardWinnerBottomRightRowPut() &&
      boardWinnerTopLeftRow() &&
      boardWinnerTopRightRow();
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

  public boolean boardWinnerBottomLeftRowPut() {
    Board testBoard = new Board();
    testBoard.put(numRows - 1, 0, Square.Red);
    testBoard.put(numRows - 1, 1, Square.Red);
    testBoard.put(numRows - 1, 2, Square.Red);
    testBoard.put(numRows - 1, 3, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerBottomRightRowPut() {
    Board testBoard = new Board();
    testBoard.drop(3, Square.Red);
    testBoard.drop(4, Square.Red);
    testBoard.drop(5, Square.Red);
    testBoard.drop(6, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerTopLeftRow() {
    Board testBoard = new Board();
    testBoard.put(0, 0, Square.Black);
    testBoard.put(0, 1, Square.Black);
    testBoard.put(0, 2, Square.Black);
    testBoard.put(0, 3, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  public boolean boardWinnerTopRightRow() {
    Board testBoard = new Board();
    testBoard.put(0, 3, Square.Black);
    testBoard.put(0, 4, Square.Black);
    testBoard.put(0, 5, Square.Black);
    testBoard.put(0, 6, Square.Black);
    return testBoard.winner() == Square.Black;
  }
}
