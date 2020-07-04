


public class ChessBoard {

  private ChessPiece[][] board;

  public ChessBoard() {
    initialize();
  }

  void draw() {
    // draw lines
    for (int i = 1; i < 8; i ++) {
      line(0, height * i / 8, width, height * i / 8);
      line(width * i / 8, 0, width * i / 8, height);
    }
    /// draw pieces
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        ChessPiece p = board[i][j];
        if (p != null) {
          p.draw(i, j+1);
        }
      }
    }
    ArrayList<Integer[]> possibleMoves = board[2][1].getPossibleMoves(2, 1);
    for (Integer[] move : possibleMoves) {
      circle((move[0] * width / 8) + 20, (move[1] * height / 8) + 20, 20);
    }
  }
  void initialize() {
    board = new ChessPiece[8][8];
    board[0][1] = new Pawn(Color.Black);
    board[1][1] = new Pawn(Color.Black);
    board[2][1] = new Pawn(Color.Black);
    board[3][1] = new Pawn(Color.Black);
    board[4][1] = new Pawn(Color.Black);
    board[5][1] = new Pawn(Color.Black);
    board[6][1] = new Pawn(Color.Black);
    board[7][1] = new Pawn(Color.Black);
    board[0][6] = new Pawn(Color.White);
    board[1][6] = new Pawn(Color.White);
    board[2][6] = new Pawn(Color.White);
    board[3][6] = new Pawn(Color.White);
    board[4][6] = new Pawn(Color.White);
    board[5][6] = new Pawn(Color.White);
    board[6][6] = new Pawn(Color.White);
    board[7][6] = new Pawn(Color.White);
    board[0][0] = new Bishop(Color.Black);
    board[1][0] = new Knight(Color.Black);
    board[2][0] = new Rook(Color.Black);
    board[3][0] = new King(Color.Black);
    board[4][0] = new Queen(Color.Black);
    board[5][0] = new Rook(Color.Black);
    board[6][0] = new Knight(Color.Black);
    board[7][0] = new Bishop(Color.Black);
    board[0][7] = new Bishop(Color.White);
    board[1][7] = new Knight(Color.White);
    board[2][7] = new Rook(Color.White);
    board[3][7] = new King(Color.White);
    board[4][7] = new Queen(Color.White);
    board[5][7] = new Rook(Color.White);
    board[6][7] = new Knight(Color.White);
    board[7][7] = new Bishop(Color.White);
  }
}
