
public abstract class ChessPiece implements Cloneable {

  public Color c;
  public Boolean hasMoved;
  public ChessPiece(Color c) {
    this.c = c;
    this.hasMoved = false;
  }

  @Override
    protected Object clone() throws CloneNotSupportedException {
    return super.clone();
  }
  public ChessPiece cloneMe() {
    try {
      return (ChessPiece)this.clone();
    } 
    catch (CloneNotSupportedException e) {
      e.printStackTrace();
      return null;
    }
  }

  public void draw(int x, int y) {
    fill(c == Color.White ? 255 : 0);
    text(this.toString(), (x * width / 8) + 20, (y * height / 8) - 50);
  }
  public String toString() {
    String className = this.getClass().getName();
    return className.substring(6, className.length());
  }

  protected abstract int getValue();
  public abstract ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board);

  protected Boolean pointOnBoard(int i, int j) {
    return i < 8 && j < 8 && i >= 0 && j >= 0;
  }
  protected void tryAddMove(ArrayList<ChessMove> arr, int fromI, int fromJ, int i, int j, ChessBoard board) {
    if (pointOnBoard(i, j)) {
      ChessPiece piece = board.getPiece(i, j);
      if (piece == null || piece.c != this.c) {
        arr.add(new ChessMove(this, fromI, fromJ, i, j));
      }
    }
  }
}


public class Pawn extends ChessPiece {
  public Pawn(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 1;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    int factor = this.c == Color.Black ? 1 : -1;



    ChessPiece piece = board.getPiece(i+1, (j + factor));
    if (piece != null && piece.c != this.c) {
      tryAddMove(rv, i, j, i+1, j+factor, board);
    }
    piece = board.getPiece(i-1, (j + factor));
    if (piece != null  && piece.c != this.c) {
      tryAddMove(rv, i, j, i-1, j+factor, board);
    }
    piece = board.getPiece(i, (j + factor));
    if (piece == null) {
      tryAddMove(rv, i, j, i, j+factor, board);
      piece = board.getPiece(i, (j + factor*2));
      if (!this.hasMoved && piece == null) {
        tryAddMove(rv, i, j, i, j+(2*factor), board);
      }
    }
    return rv;
  }
}
public class Rook extends ChessPiece {
  public Rook(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 3;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    int ind = 1;
    for (int tempI = i-1; tempI >= 0; tempI--) {
      ChessPiece piece = board.getPiece(tempI, j+ind);
      if (piece != null) {
        if (piece.c != this.c) {
          tryAddMove(rv, i, j, tempI, j+ind, board);
        }
        break;
      }
      tryAddMove(rv, i, j, tempI, j+ind, board);
      ind++;
    }
    ind = 1;
    for (int tempI = i+1; tempI < 8; tempI++) {
      ChessPiece piece = board.getPiece(tempI, j-ind);
      if (piece != null) {
        if (piece.c != this.c) {
          tryAddMove(rv, i, j, tempI, j-ind, board);
        }
        break;
      }
      tryAddMove(rv, i, j, tempI, j-ind, board);
      ind++;
    }
    ind = 1;
    for (int tempJ = j-1; tempJ >= 0; tempJ--) {
      ChessPiece piece = board.getPiece(i-ind, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          tryAddMove(rv, i, j, i - ind, tempJ, board);
        }
        break;
      }
      tryAddMove(rv, i, j, i - ind, tempJ, board);
      ind++;
    }
    ind = 1;
    for (int tempJ = j+1; tempJ < 8; tempJ++) {
      ChessPiece piece = board.getPiece(i+ind, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          tryAddMove(rv, i, j, i + ind, tempJ, board);
        }
        break;
      }
      tryAddMove(rv, i, j, i + ind, tempJ, board);
      ind++;
    }
    return rv;
  }
}
public class Knight extends ChessPiece {
  public Knight(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 3;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    tryAddMove(rv, i, j, i+1, j+2, board);
    tryAddMove(rv, i, j, i-1, j+2, board);
    tryAddMove(rv, i, j, i+1, j-2, board);
    tryAddMove(rv, i, j, i-1, j-2, board);
    tryAddMove(rv, i, j, i+2, j+1, board);
    tryAddMove(rv, i, j, i-2, j+1, board);
    tryAddMove(rv, i, j, i+2, j-1, board);
    tryAddMove(rv, i, j, i-2, j-1, board);
    return rv;
  }
}
public class Bishop extends ChessPiece {
  public Bishop(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 5;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    for (int tempI = i-1; tempI >= 0; tempI--) {
      ChessPiece piece = board.getPiece(tempI, j);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new ChessMove(this, i, j, tempI, j));
        }
        break;
      }
      rv.add(new ChessMove(this, i, j, tempI, j));
    }
    for (int tempI = i+1; tempI < 8; tempI++) {
      ChessPiece piece = board.getPiece(tempI, j);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new ChessMove(this, i, j, tempI, j));
        }
        break;
      }
      rv.add(new ChessMove(this, i, j, tempI, j));
    }
    for (int tempJ = j-1; tempJ >= 0; tempJ--) {
      ChessPiece piece = board.getPiece(i, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new ChessMove(this, i, j, i, tempJ));
        }
        break;
      }
      rv.add(new ChessMove(this, i, j, i, tempJ));
    }
    for (int tempJ = j+1; tempJ < 8; tempJ++) {
      ChessPiece piece = board.getPiece(i, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new ChessMove(this, i, j, i, tempJ));
        }
        break;
      }
      rv.add(new ChessMove(this, i, j, i, tempJ));
    }
    return rv;
  }
}
public class Queen extends ChessPiece {
  public Queen(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 9;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    rv.addAll(new Bishop(this.c).getPossibleMoves(i, j, board));
    rv.addAll(new Rook(this.c).getPossibleMoves(i, j, board));
    return rv;
  }
}
public class King extends ChessPiece {
  public King(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 1000;
  }
  public ArrayList<ChessMove> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<ChessMove> rv = new ArrayList<ChessMove>();
    tryAddMove(rv, i, j, i+1, j+1, board);
    tryAddMove(rv, i, j, i-1, j+1, board);
    tryAddMove(rv, i, j, i, j+1, board);
    tryAddMove(rv, i, j, i+1, j, board);
    tryAddMove(rv, i, j, i-1, j, board);
    tryAddMove(rv, i, j, i+1, j-1, board);
    tryAddMove(rv, i, j, i, j-1, board);
    tryAddMove(rv, i, j, i-1, j-1, board);
    return rv;
  }
}

public enum Color {
  Black, 
    White
}
