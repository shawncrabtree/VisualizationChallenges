public class WinChecker {

  private Square[][] _board;
  public WinChecker(Square[][] board) {
    _board = board;
  }

  public Square winner() {
    // check for 4 in a row
    for (int r = 0; r < numRows; r++) {
      Square w = rowHasWinner(r);
      if (w != null) {
        return w;
      }
    }
    // check for 4 in a column
    for (int c = 0; c < numCols; c++) {
      Square w = colHasWinner(c);
      if (w != null) {
        return w;
      }
    }
    // check for 4 going up-right
    for (int r = 0; r < numRows - FOUR + 1; r++) {
      for (int c = 0; c < numCols - FOUR + 1; c++) {
        Square w = upRightHasWinner(r, c);
        if (w != null) {
          return w;
        }
      }
    }
    // check for 4 going up-left
    for (int r = 0; r < numRows - FOUR + 1; r++) {
      for (int c = FOUR-1; c < numCols; c++) {
        Square w = upLeftHasWinner(r, c);
        if (w != null) {
          return w;
        }
      }
    }
    return null;
  }

  private Square upRightHasWinner(int r, int c) {
    Square s = _board[r][c];
    if (s == null) {
      return null;
    }
    for (int i = 1; i < FOUR; i++) {
      if (s != _board[r+i][c+i]) {
        return null;
      }
    }
    return s;
  }

  private Square upLeftHasWinner(int r, int c) {
    Square s = _board[r][c];
    if (s == null) {
      return null;
    }
    for (int i = 1; i < FOUR; i++) {
      if (s != _board[r+i][c-i]) {
        return null;
      }
    }
    return s;
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

  private Square colHasWinner(int c) {
    for (int r = 0; r < numRows - FOUR + 1; r++) {
      Square s = col4HasWinner(r, c);
      if (s != null) {
        return s;
      }
    }
    return null;
  }

  private Square col4HasWinner(int r, int c) {
    Square s = _board[r][c];
    if (s == null) {
      return null;
    }
    for (int i = 1; i < FOUR; i++) {
      if (s != _board[r+i][c]) {
        return null;
      }
    }
    return s;
  }
}
