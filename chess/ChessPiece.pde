
public abstract class ChessPiece {

  public Color c;

  public ChessPiece(Color c) {
    this.c = c;
  }

  public void draw(int x, int y) {
    fill(c == Color.White ? 255 : 0);
    text(this.toString(), (x * width / 8) + 20, (y * height / 8) - 20);
  }
  public String toString() {
    String className = this.getClass().getName();
    return className.substring(6, className.length());
  }

  protected abstract int getValue();

  public ArrayList<Integer[]> getPossibleMoves(int i, int j) {
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
  public ArrayList<Integer[]> getPossibleMoves(int i, int j) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    int factor = this.c == Color.Black ? 1 : -1;
    rv.add(new Integer[] {i,  (j + factor*1)});
    rv.add(new Integer[] {i, (j + factor*2)});
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
  public ArrayList<Integer[]> getPossibleMoves(int i, int j) {
    ArrayList<Integer[]> rv = new ArrayList<Integer[]>();
    for (int tempI = 0; tempI < 8; tempI++){
      rv.add(new Integer[] {tempI, j});
    }
      for (int tempJ = 0; tempJ < 8; tempJ++){
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
    return 200;
  }
}



public enum Color {
  Black, 
    White
}
