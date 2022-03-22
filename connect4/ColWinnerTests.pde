public class ColWinnerTests {
  public boolean run() {
    println("ColWinnerTests");
    return boardWinnerBottomLeftCol() &&
      boardWinnerBottomRightCol() &&
      boardWinnerBottomLeftColPut() &&
      boardWinnerBottomRightColPut() &&
      boardWinnerTopLeftCol() &&
      boardWinnerTopRightCol();
  }

  public boolean boardWinnerBottomLeftCol() {
    Board testBoard = new Board();
    testBoard.drop(0, Square.Red);
    testBoard.drop(0, Square.Red);
    testBoard.drop(0, Square.Red);
    testBoard.drop(0, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerBottomRightCol() {
    Board testBoard = new Board();
    testBoard.drop(numCols-1, Square.Red);
    testBoard.drop(numCols-1, Square.Red);
    testBoard.drop(numCols-1, Square.Red);
    testBoard.drop(numCols-1, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerBottomLeftColPut() {
    Board testBoard = new Board();
    testBoard.put(numRows - 1, 0, Square.Red);
    testBoard.put(numRows - 1, 1, Square.Red);
    testBoard.put(numRows - 1, 2, Square.Red);
    testBoard.put(numRows - 1, 3, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerBottomRightColPut() {
    Board testBoard = new Board();
    testBoard.put(numRows - 1, 3, Square.Red);
    testBoard.put(numRows - 1, 4, Square.Red);
    testBoard.put(numRows - 1, 5, Square.Red);
    testBoard.put(numRows - 1, 6, Square.Red);
    return testBoard.winner() == Square.Red;
  }

  public boolean boardWinnerTopLeftCol() {
    Board testBoard = new Board();
    testBoard.put(0, 0, Square.Black);
    testBoard.put(1, 0, Square.Black);
    testBoard.put(2, 0, Square.Black);
    testBoard.put(3, 0, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  public boolean boardWinnerTopRightCol() {
    Board testBoard = new Board();
    testBoard.put(2, 0, Square.Black);
    testBoard.put(3, 0, Square.Black);
    testBoard.put(4, 0, Square.Black);
    testBoard.put(5, 0, Square.Black);
    return testBoard.winner() == Square.Black;
  }
}
