class Board {
  public void draw() {
    for (int i = 1; i <= numCols; i++) {
      line(0, i * squareSize, squareSize * numRows, i * squareSize);
    }
    for (int i = 1; i <= numRows; i++) {
      line(i * squareSize, 0, i * squareSize, squareSize * numCols);
    }
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        Square square = _board[i][j];
        if (square != null) {
          int centerOffset = squareSize / 2;
          color c = square == Square.Red ? color(255, 0, 0) : color(0, 0, 0);
          fill(c);
          circle(i * squareSize + centerOffset, j * squareSize + centerOffset, squareSize);
        }
      }
    }
  }


  private Square[][] _board = new Square[numRows][numCols];
  public void drop(int r, Square s) {
    for (int c = 0; c < numCols; c++){
      if (_board[r][numCols-1-c] == null){
        _board[r][numCols-1-c] = s;
        return;
      }
    }
  }
}
