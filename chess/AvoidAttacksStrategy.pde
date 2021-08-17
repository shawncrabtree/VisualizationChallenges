
public class AvoidAttacksStrategy implements IMoveStrategy {
  
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
