class Board {
  public Board() {
    _board = new Square[numRows][numCols];
  }

  private Board(Square[][] board) {
    _board = board;
  }

  public void draw() {
    for (int i = 1; i <= numRows; i++) {
      line(0, i * squareSize, squareSize * numCols, i * squareSize);
    }
    for (int i = 1; i <= numCols; i++) {
      line(i * squareSize, 0, i * squareSize, squareSize * numRows);
    }
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        Square square = _board[r][c];
        if (square != null) {
          int centerOffset = squareSize / 2;
          color col = square == Square.Red ? color(255, 0, 0) : color(0, 0, 0);
          fill(col);
          circle(c * squareSize + centerOffset, r * squareSize + centerOffset, squareSize);
        }
      }
    }
  }

  public int getSquareCount() {
    int coloredSquares = 0;
    for (int i = 0; i< _board.length; i++) {
      for (int j = 0; j < _board[i].length; j++) {
        if (_board[i][j] != null) {
          coloredSquares++;
        }
      }
    }
    return coloredSquares;
  }

  public Board clone() {
    Square [][] squares = new Square[numRows][numCols];
    for (int i = 0; i< _board.length; i++) {
      for (int j = 0; j < _board[i].length; j++) {
        squares[i][j] = _board[i][j];
      }
    }
    return new Board(squares);
  }

  private Square[][] _board;
  public boolean drop(int c, Square s) {
    for (int r = 0; r < numRows; r++) {
      if (_board[numRows-1-r][c] == null) {
        _board[numRows-1-r][c] = s;
        return true;
      }
    }
    return false;
  }

  // for testing purposes
  public void put(int r, int c, Square s) {
    _board[r][c] = s;
  }

  public Square winner() {
    return new WinChecker(_board).winner();
  }
}
