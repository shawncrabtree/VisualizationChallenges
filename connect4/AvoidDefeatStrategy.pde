public class AvoidDefeatStrategy{
  public int pickMove(Board board, Square s){
    for (int c = 0; c < numCols; c++){
      Board clonedBoard = board.clone();
      clonedBoard.drop(c, otherPlayer(s));
      Square w = clonedBoard.winner();
      if (w != null){
        return c;
      }
    }
    return 0;
  }
}
