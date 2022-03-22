class UpRightWinnerTests {

  public boolean run() {
    println("UpRightWinnerTests");
    return run1() && run2() && run3() && run4();
  }

  private boolean run1() {
    Board testBoard = new Board();
    testBoard.put(0, 0, Square.Black);
    testBoard.put(1, 1, Square.Black);
    testBoard.put(2, 2, Square.Black);
    testBoard.put(3, 3, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run2() {
    Board testBoard = new Board();
    testBoard.put(2, 0, Square.Black);
    testBoard.put(3, 1, Square.Black);
    testBoard.put(4, 2, Square.Black);
    testBoard.put(5, 3, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run3() {
    Board testBoard = new Board();
    testBoard.put(2, 3, Square.Black);
    testBoard.put(3, 4, Square.Black);
    testBoard.put(4, 5, Square.Black);
    testBoard.put(5, 6, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run4() {
    Board testBoard = new Board();
    testBoard.put(0, 3, Square.Black);
    testBoard.put(1, 4, Square.Black);
    testBoard.put(2, 5, Square.Black);
    testBoard.put(3, 6, Square.Black);
    return testBoard.winner() == Square.Black;
  }
}
