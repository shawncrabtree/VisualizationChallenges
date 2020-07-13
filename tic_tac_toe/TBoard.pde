

public class TBoard {

  private char[][] board;
  private int score;

  public TBoard() {
    board = new char[3][3];
  }
  private TBoard(char[][] b) {
    this.board = b;
  }

  public void play(char c, int i, int j) {
    board[i][j] = c;
  }
  
  public void play(char c, Point p) {
    board[p.i][p.j] = c;
  }

  public TBoard miniMax(char c) {
    Boolean isComputer = c == 'O';
    // win endstate
    if (this.wins(c)) {
      this.score = isComputer ? 1 : -1;
      return this;
    }
    TBoard[] possibleNodes = this.getPossibleMoves(c);
    // draw endstate;
    if (possibleNodes.length == 0) {
      this.score = 0;
      return this;
    }
    // Reccursively set the score.
    for (int i = 0; i < possibleNodes.length; i++) {
      TBoard node = possibleNodes[i];
      char otherPlayer = isComputer ? 'X' : 'O';
      node.miniMax(otherPlayer);
    }
    int index = isComputer ? this.getIndexOfLargest(possibleNodes) : this.getIndexOfSmallest(possibleNodes);
    this.score = possibleNodes[index].score;
    return possibleNodes[index];
  }

  private Boolean wins(char c) {
    // rows/columns
    for (int i = 0; i < 3; i++) {
      if (c == board[i][0] && c == board[i][1] && c == board[i][2]) {
        return true;
      }
      if (c == board[0][i] && c == board[1][i] && c == board[2][i]) {
        return true;
      }
    }
    // diags
    if (c == board[0][0] && c == board[1][1] && c == board[2][2]) {
      return true;
    }
    if (c == board[2][0] && c == board[1][1] && c == board[0][2]) {
      return true;
    }
    return false;
  }

  private char[][] cloneBoard() {
    char [][] myClone = new char[board.length][];
    for (int i = 0; i < board.length; i++) {
      myClone[i] = board[i].clone();
    }
    return myClone;
  }

  public TBoard[] getPossibleMoves(char c) {
    ArrayList<TBoard> boards = new ArrayList<TBoard>();
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        char currC = board[i][j];
        if (currC == '\u0000') {
          TBoard tBoard = new TBoard(this.cloneBoard());
          tBoard.play(c, i, j);
          boards.add(tBoard);
        }
      }
    }
    return boards.toArray(new TBoard[0]);
  }

  public void draw() {

    line(width/3, 0, width/3, height);
    line(2*width/3, 0, 2*width/3, height);

    line(0, height/3, width, height/3);
    line(0, 2*height/3, width, 2*height/3);


    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        char c = board[i][j];
        if (c != '\u0000') {
          drawChar(c, i, j);
        }
      }
    }
  }

  public void drawChar(char c, int i, int j) {
    float offSet = width/6;
    text(c, (i)*width/3+offSet, (j)*height/3+offSet);
  }

  public int getIndexOfLargest( TBoard[] nodes )
  {
    int largest = 0;
    for ( int i = 1; i < nodes.length; i++ )
    {
      if ( nodes[i].score > nodes[largest].score ) largest = i;
    }
    return largest; // position of the first largest found
  }

  public int getIndexOfSmallest( TBoard[] nodes )
  {
    int smallest = 0;
    for ( int i = 0; i < nodes.length; i++ )
    {
      if ( nodes[i].score < nodes[smallest].score ) smallest = i;
    }
    return smallest; // position of the first smallest found
  }
}

public class Point {
  public int i;
  public int j;
  public Point(int _i, int _j) {
    this.i = _i;
    this.j = _j;
  }
}
