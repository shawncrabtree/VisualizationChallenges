
public abstract class ChessPiece {

  public Color c;
  public Boolean hasMoved;
  public ChessPiece(Color c) {
    this.c = c;
    this.hasMoved = false;
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

  public ArrayList<Integer[]> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    rv.add(new Integer[] {1, 1});
    return rv;
  }
}


public class Pawn extends ChessPiece {
  public Pawn(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 1;
  }
  public ArrayList<Integer[]> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    int factor = this.c == Color.Black ? 1 : -1;

    ChessPiece piece = board.getPiece(i+1, (j + factor));
    if (piece != null && piece.c != this.c) {
      rv.add(new Integer[] {i+1, (j + factor)});
    }
    piece = board.getPiece(i-1, (j + factor));
    if (piece != null  && piece.c != this.c) {
      rv.add(new Integer[] {i-1, (j + factor)});
    }
    piece = board.getPiece(i, (j + factor));
    if (piece == null) {
      rv.add(new Integer[] {i, (j + factor)});
      piece = board.getPiece(i, (j + factor*2));
      if (!this.hasMoved && piece == null) {
        rv.add(new Integer[] {i, (j + factor*2)});
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
  public ArrayList<Integer[]> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    int ind = 1;
    for (int tempI = i-1; tempI >= 0; tempI--) {
      ChessPiece piece = board.getPiece(tempI, j+ind);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new Integer[] {tempI, j+ind});
        }
        break;
      }
      rv.add(new Integer[] {tempI, j+ind});
      ind++;
    }
    ind = 1;
    for (int tempI = i+1; tempI < 8; tempI++) {
      ChessPiece piece = board.getPiece(tempI, j-ind);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new Integer[] {tempI, j-ind});
        }
        break;
      }
      rv.add(new Integer[] {tempI, j-ind});
      ind++;
    }
    ind = 1;
    for (int tempJ = j-1; tempJ >= 0; tempJ--) {
      ChessPiece piece = board.getPiece(i-ind, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new Integer[] {i - ind, tempJ});
        }
        break;
      }
      rv.add(new Integer[] {i - ind, tempJ});
      ind++;
    }
    ind = 1;
    for (int tempJ = j+1; tempJ < 8; tempJ++) {
      ChessPiece piece = board.getPiece(i+ind, tempJ);
      if (piece != null) {
        if (piece.c != this.c) {
          rv.add(new Integer[] {i + ind, tempJ});
        }
        break;
      }
      rv.add(new Integer[] {i + ind, tempJ});
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
}
public class Bishop extends ChessPiece {
  public Bishop(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 5;
  }
  public ArrayList<Integer[]> getPossibleMoves(int i, int j, ChessBoard board) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    for (int tempI = i-1; tempI >= 0; tempI--) {
      ChessPiece piece = board.getPiece(tempI, j);
      if (piece != null) {
        if (piece.c != this.c){
          rv.add(new Integer[] {tempI, j});
        }
        break;
      }
      rv.add(new Integer[] {tempI, j});
    }
    for (int tempI = i+1; tempI < 8; tempI++) {
      ChessPiece piece = board.getPiece(tempI, j);
      if (piece != null) {
        if (piece.c != this.c){
          rv.add(new Integer[] {tempI, j});
        }
        break;
      }
      rv.add(new Integer[] {tempI, j});
    }
    for (int tempJ = j-1; tempJ >= 0; tempJ--) {
      ChessPiece piece = board.getPiece(i, tempJ);
      if (piece != null) {
        if (piece.c != this.c){
          rv.add(new Integer[] {i, tempJ});
        }
        break;
      }
      rv.add(new Integer[] {i, tempJ});
    }
    for (int tempJ = j+1; tempJ < 8; tempJ++) {
      ChessPiece piece = board.getPiece(i, tempJ);
      if (piece != null) {
        if (piece.c != this.c){
          rv.add(new Integer[] {i, tempJ});
        }
        break;
      }
      rv.add(new Integer[] {i, tempJ});
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
}
public class King extends ChessPiece {
  public King(Color c) { 
    super(c);
  }
  public int getValue() { 
    return 1000;
  }
}

public enum Color {
  Black, 
    White
}
