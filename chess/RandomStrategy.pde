
public class RandomStrategy {
  
  public ChessMove chooseMove(ChessBoard current, Color c){
    ArrayList<ChessMove> possibleMoves = current.getPossibleMoves(c);
    int i = (int)random(0, possibleMoves.size());
    return possibleMoves.get(i);
  }
}
