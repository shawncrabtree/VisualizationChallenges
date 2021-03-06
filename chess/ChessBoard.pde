
public class ChessBoard {

  private ChessPiece[][] board;
  private int whiteScore;
  private int blackScore;
  public ChessBoard() {
    initialize();
  }

  public ChessBoard(ChessBoard b) {
    board = new ChessPiece[8][8];
    this.whiteScore = b.whiteScore;
    this.blackScore = b.blackScore;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        ChessPiece piece = b.getPiece(i, j);
        if (piece != null) {
          board[i][j] = (ChessPiece)piece.cloneMe();
        }
      }
    }
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
    text(Integer.toString(this.getScore(Color.Black)), 20, 20);
    fill(255);
    text(Integer.toString(this.getScore(Color.White)), 20, height - 20);
  }

  ArrayList<ChessMove> getPossibleMoves(int i, int j) {
    ChessPiece piece = board[i][j];
    if (piece == null) {
      return new ArrayList<ChessMove>();
    }
    return piece.getPossibleMoves(i, j, this);
  }

  ArrayList<ChessMove> getPossibleMoves(Color c) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        ChessPiece p = board[i][j];
        if (p != null && p.c == c) {
          rv.addAll(getPossibleMoves(i, j));
        }
      }
    }
    return rv;
  }


  void drawMoves(ArrayList<ChessMove> moves) {
    for (ChessMove move : moves) {
      circle((move.toI * width / 8) + 20, (move.toJ * height / 8) + 20, 20);
    }
  }

  void move(ChessMove move) {
    print("\n");
    print(move.piece.getClass().getName());
    print("to: " + move.toI + " " + move.toJ);
    move(move.fromI, move.fromJ, move.toI, move.toJ);
  }

  void move(int fromI, int fromJ, int toI, int toJ) {
    ChessPiece piece = board[fromI][fromJ];
    ChessPiece takenPiece = board[toI][toJ];
    if (takenPiece != null) {
      int score = this.getScore(takenPiece.c);
      score = score - takenPiece.getValue();
      this.setScore(takenPiece.c, score);
    }
    board[toI][toJ] = piece;
    board[fromI][fromJ] = null;
    piece.hasMoved = true;
  }

  Boolean wins(Color c) {
    Color other = c == Color.White ? Color.Black : Color.White;
    return this.getScore(other) < 999;
  }

  ChessBoard computerPlay(Color c) {
    return miniMax(c, 0);
  }

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

  ChessBoard getBest(Color c, ArrayList<ChessBoard> boards) {
    ChessBoard biggest = boards.get(0);
    int biggestDiff = -9999;
    for (int i = 0; i < boards.size(); i++) {
      ChessBoard b = boards.get(i);
      int diff = b.getScore(c) - b.getScore(c == Color.White ? Color.Black : Color.White);
      if (diff > biggestDiff){
        biggest = b;
        biggestDiff = diff;
      }
    }
    return biggest;
  }

  void setScore(Color c, int score) {
    print(c + " Score: " + score);
    if (c == Color.White) {
      whiteScore = score;
    } else {
      blackScore = score;
    }
  }

  int getScore(Color c) {
    return c == Color.White ? whiteScore : blackScore;
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
          int score = this.getScore(piece.c);
          score += piece.getValue();
          this.setScore(piece.c, score);
        }
      }
    }
  }
}
