
public class ChessBoard {

  private ChessPiece[][] board;
  HashMap<Color, Integer> scores;
  public ChessBoard() {
    scores = new HashMap<Color, Integer>();
    scores.put(Color.White, 0);
    scores.put(Color.Black, 0);
    initialize();
  }

  public ChessPiece getPiece(int i, int j) {
    if (0 <= i && i < 8 && 0 <= j && j < 8) {
      return board[i][j];
    }
    return null;
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
    fill(0);
    text(this.scores.get(Color.Black).toString(), 20, 20);
    fill(255);
    text(this.scores.get(Color.White).toString(), 20, height - 20);
  }

  ArrayList<Integer[]> getPossibleMoves(int i, int j) {
    ChessPiece piece = board[i][j];
    if (piece == null) {
      return new ArrayList<Integer[]>();
    }
    return piece.getPossibleMoves(i, j, this);
  }


  void drawMoves(ArrayList<Integer[]> moves) {
    for (Integer[] move : moves) {
      circle((move[0] * width / 8) + 20, (move[1] * height / 8) + 20, 20);
    }
  }

  void move(int fromI, int fromJ, int toI, int toJ) {
    ChessPiece piece = board[fromI][fromJ];
    ChessPiece takenPiece = board[toI][toJ];
    if (takenPiece != null){
      int score = this.scores.get(takenPiece.c);
      score = score - takenPiece.getValue();
      this.scores.put(takenPiece.c, score);
    }
    board[toI][toJ] = piece;
    board[fromI][fromJ] = null;
    piece.hasMoved = true;
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
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        ChessPiece piece = this.getPiece(i, j);
        if (piece != null) {
          int score = this.scores.get(piece.c);
          score += piece.getValue();
          this.scores.put(piece.c, score);
        }
      }
    }
  }
}
