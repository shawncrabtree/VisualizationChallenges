class MinimaxStrategy {

  public int pickMove(Board b, Square currentPlayer) {
    return minimax(b, currentPlayer, true, 1).colChoice;
  }

  private MinimaxResult minimax(Board board, Square currentPlayer, boolean isMaximizing, int depth) {
    Square winner = board.winner();
    if (winner != null) {
      println("POTENTIAL BOARD HAS A WINNER");
      return new MinimaxResult(board, isMaximizing ? -1 : 1, -1) ;
    }
    if (depth == 0) {
      return new MinimaxResult(board, 0, -1) ;
    }
    // If is maximizing player
    if (isMaximizing) {
      MinimaxResult r = null;
      for (int c = 0; c < numCols; c++) {
        Board moveBoard = board.clone();
        moveBoard.drop(c, currentPlayer);
        MinimaxResult moveResult = minimax(moveBoard, otherPlayer(currentPlayer), false, depth-1);
        if (r == null || moveResult.score > r.score) {
          r = new MinimaxResult(moveBoard, moveResult.score, c);
        }
      }
      return r;
    }
    // else minimizing player
    MinimaxResult r = null;
    for (int c = 0; c < numCols; c++) {
      Board moveBoard = board.clone();
        moveBoard.drop(c, currentPlayer);
      MinimaxResult moveResult = minimax(moveBoard, otherPlayer(currentPlayer), true, depth-1);
      if (r == null || moveResult.score < r.score) {
        r = new MinimaxResult(moveBoard, moveResult.score, c);
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
