class Board {
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

  private Square[][] _board = new Square[numRows][numCols];
  public void drop(int c, Square s) {
    for (int r = 0; r < numRows; r++) {
      if (_board[numRows-1-r][c] == null) {
        _board[numRows-1-r][c] = s;
        return;
      }
    }
    println("GAVE UP");
  }

  // for testing purposes
  public void put(int r, int c, Square s) {
    _board[r][c] = s;
  }

  public Square winner() {
    return new WinChecker(_board).winner();
  }
}
