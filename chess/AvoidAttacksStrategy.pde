
public class AvoidAttacksStrategy implements IMoveStrategy {
  
  private Boolean isAttackingMove(ChessBoard current, ChessMove move){
    ChessPiece attackedPiece = current.getPiece(move.toI, move.toJ);
    return attackedPiece != null;
  }
  
  private ArrayList<ChessMove> getAttackingMoves(ChessBoard current, Color c){
        ArrayList<ChessMove> moves = current.getPossibleMoves(c);
        ArrayList<ChessMove> attackingMoves = new ArrayList<ChessMove>();
        for (ChessMove move : moves){
          if (isAttackingMove(current, move)){
            attackingMoves.add(move);
          }
        }
        return attackingMoves;
  }
  
  public ChessMove chooseMove(ChessBoard current, Color c){
    println("HERE");
    ArrayList<ChessMove> oponentMoves = current.getPossibleMoves(c.oposite());
    ArrayList<ChessMove> myMoves = current.getPossibleMoves(c);
    for (ChessMove oponentMove : oponentMoves){
      // If the oponent can take a piece then return a move that moves the threatened piece.
      ChessPiece takenPiece = current.getPiece(oponentMove.toI, oponentMove.toJ);
      if (takenPiece != null) {
        println("OPONENT (HUMAM) CAN TAKE PIECE AT: " + current.getDisplayString(oponentMove));
        for (ChessMove myMove : myMoves){
          println("CHECKING: " + current.getDisplayString(myMove));
          println(String.valueOf(myMove.fromI) + String.valueOf(oponentMove.toI));
          if (myMove.fromI == oponentMove.toI && myMove.fromJ == oponentMove.toJ){
            // DON't DO THE MOVE IF BEING ACTIVELY ATTACKED
            for(ChessMove oponentMove2 : this.getAttackingMoves(current, c)){
              if (oponentMove2.toI == myMove.toI && oponentMove2.toJ == myMove.toJ){
                
              }
            }
            println("AVOIDING " + current.getDisplayString(myMove.fromI, myMove.fromJ));
            return myMove;
          }
        }
      };
    }
    println("No attacks found. Defaulting to random stragy");
    return new RandomStrategy().chooseMove(current, c);
  }
}
