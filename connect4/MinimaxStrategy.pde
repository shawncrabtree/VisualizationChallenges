class MinimaxStrategy {

  public int pickMove(Board b, Square currentPlayer) {
    return minimax(b, currentPlayer, true, 5).colChoice;
  }

  private MinimaxResult minimax(Board board, Square currentPlayer, boolean isMaximizing, int depth) {
    println("Minimax root for " + currentPlayer + " on board with " + board.getSquareCount() + " taken squares");
    Square winner = board.winner();
    if (winner != null) {
      println("POTENTIAL BOARD HAS A WINNER");
      return new MinimaxResult(board, isMaximizing ? -1 : 1, -1) ;
    }
    if (depth == 0) {
      println("Depth limit. No result");
      return new MinimaxResult(board, 0, -1) ;
    }
    // If is maximizing player
    if (isMaximizing) {
      MinimaxResult r = null;
      for (int c = 0; c < numCols; c++) {
        Board moveBoard = board.clone();
        if (moveBoard.drop(c, currentPlayer)) {
          println("Recrusing (isMaximizing) after drop a c: " + c);
          MinimaxResult moveResult = minimax(moveBoard, otherPlayer(currentPlayer), false, depth-1);
          println("Result score: " + moveResult.score + " c:" + c);
          if (r == null || moveResult.score > r.score) {
            r = new MinimaxResult(moveBoard, moveResult.score, c);
          }
          // If we have a win then no need to check other moves
          if (moveResult.score == 1) {
            return r;
          }
        }
      }
      return r;
    }
    // else minimizing player
    MinimaxResult r = null;
    for (int c = 0; c < numCols; c++) {
      Board moveBoard = board.clone();
      if (moveBoard.drop(c, currentPlayer)) {
        println("Recrusing (not max) after drop a c: " + c);
        MinimaxResult moveResult = minimax(moveBoard, otherPlayer(currentPlayer), true, depth-1);
        if (r == null || moveResult.score < r.score) {
          r = new MinimaxResult(moveBoard, moveResult.score, c);
        }
      }
    }
    return r;
  }


  class MinimaxResult {
    Board board;
    int score;
    int colChoice;
    public MinimaxResult(Board b, int s, int c) {
      board = b;
      score = s;
      colChoice = c;
    }
  }
}
