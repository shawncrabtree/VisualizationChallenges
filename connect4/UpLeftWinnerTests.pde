class UpLeftWinnerTests {

  public boolean run() {
    println("UpLeftWinnerTests");
    return run1() && run2() && run3() && run4();
  }

  private boolean run1() {
    Board testBoard = new Board();
    testBoard.put(0, 3, Square.Black);
    testBoard.put(1, 2, Square.Black);
    testBoard.put(2, 1, Square.Black);
    testBoard.put(3, 0, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run2() {
    Board testBoard = new Board();
    testBoard.put(2, 3, Square.Black);
    testBoard.put(3, 2, Square.Black);
    testBoard.put(4, 1, Square.Black);
    testBoard.put(5, 0, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run3() {
    Board testBoard = new Board();
    testBoard.put(0, 6, Square.Black);
    testBoard.put(1, 5, Square.Black);
    testBoard.put(2, 4, Square.Black);
    testBoard.put(3, 3, Square.Black);
    return testBoard.winner() == Square.Black;
  }

  private boolean run4() {
    Board testBoard = new Board();
    testBoard.put(2, 6, Square.Black);
    testBoard.put(3, 5, Square.Black);
    testBoard.put(4, 4, Square.Black);
    testBoard.put(5, 3, Square.Black);
    return testBoard.winner() == Square.Black;
  }
}
