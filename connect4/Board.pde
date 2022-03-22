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
        println("found square " + r);
        return;
      }
    }
    println("GAVE UP");
  }
  
  // for testing purposes
  public void put(int c, int r, Square s){
    _board[c][r] = s;
  }

  public Square winner() {
    // check for 4 in a row
    for (int r = 0; r < numRows; r++) {
      Square w = rowHasWinner(r);
      if (w != null) {
        return w;
      }
    }
    return null;
  }
  

  private Square rowHasWinner(int r) {
    for (int c = 0; c < numCols - FOUR + 1; c++) {
      Square s = row4HasWinner(r, c);
      if (s != null) {
        return s;
      }
    }
    return null;
  }

  private Square row4HasWinner(int r, int c) {
    Square s = _board[r][c];
    if (s == null) {
      return null;
    }
    for (int i = 1; i < FOUR; i++) {
      if (s != _board[r][c+i]) {
        return null;
      }
    }
    return s;
  }
}
