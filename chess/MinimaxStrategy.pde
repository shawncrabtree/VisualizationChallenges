
public class MinimaxStrategy implements IMoveStrategy{
  
    public ChessMove chooseMove(ChessBoard current, Color c){
    ArrayList<ChessMove> possibleMoves = current.getPossibleMoves(c);
    // IMPLEMENT
    
    // recurse for each possible next game state
    ArrayList<ChessBoard> possibleBoards = new ArrayList<ChessBoard>();
    for (ChessMove move : possibleMoves) {
      ChessBoard cloneBoard = new ChessBoard(current);
      cloneBoard.move(move);
      possibleBoards.add(cloneBoard);
      //this.chooseMove(cloneBoard, 
      //cloneBoard.miniMax(otherC, depth+1);
    }
    //return getBest(c, possibleBoards);
    
    
    
    
    return possibleMoves.get(0);
  }
  /*
  
  private ChessBoard miniMax(Color c, int depth) {
    // endstate
    if (this.wins(c)) {
      return this;
    }
    if (depth == 3) {
      return this;
    }
    Color otherC = c == Color.White ? Color.Black : Color.White;
    // recurse for each possible next game state
    ArrayList<ChessMove> moves = getPossibleMoves(c);
    ArrayList<ChessBoard> possibleBoards = new ArrayList<ChessBoard>();
    for (ChessMove move : moves) {
      ChessBoard cloneBoard = new ChessBoard(this);
      cloneBoard.move(move);
      possibleBoards.add(cloneBoard);
      cloneBoard.miniMax(otherC, depth+1);
    }
    return getBest(c, possibleBoards);
  }
  */
}
