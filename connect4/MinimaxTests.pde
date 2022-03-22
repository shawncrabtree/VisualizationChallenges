public class MinimaxTests {
  public boolean run() {
    println("MinimaxTests");
    return test1();
  }
  
  private boolean test1(){
    Board testBoard = new Board();
    testBoard.drop(2, Square.Red);
    testBoard.drop(2, Square.Red);
    testBoard.drop(2, Square.Red);
    MinimaxStrategy minimaxStrat = new MinimaxStrategy();
    int pickedCol = minimaxStrat.pickMove(testBoard, Square.Black);
    return pickedCol == 2;
  }
}
