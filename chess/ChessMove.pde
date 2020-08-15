
public class ChessMove {

  public ChessPiece piece;
  public int fromI;
  public int fromJ;
  public int toI;
  public int toJ;

  public ChessMove(ChessPiece _p, int _fromI, int _fromJ, int _toI, int _toJ) {
    piece = _p;
    fromI = _fromI;
    fromJ = _fromJ;
    toI = _toI;
    toJ = _toJ;
  }
}
