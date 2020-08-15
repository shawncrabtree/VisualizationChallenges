
ChessBoard chessBoard;
int selectedI = -1;
int selectedJ = - 1;
ArrayList<ChessMove> possibleMoves;
PFont f; 
void setup() {
  size(800, 800);
  f = createFont("Arial", 16, true); 
  textFont(f, 16);
  chessBoard = new ChessBoard();
  possibleMoves = new ArrayList<ChessMove>();
}


void draw() {
  background(128);
  stroke(255);
  strokeWeight(1);
  chessBoard.draw();

  if (selectedI != -1) {
    chessBoard.drawMoves(possibleMoves);
  }
  //ArrayList<Integer[]> whiteMoves = chessBoard.getPossibleMoves(Color.White);
  //chessBoard.drawMoves(whiteMoves);
}

void mouseClicked() {
  int i = (int)8 * mouseX / width;
  int j = (int)8 * mouseY / height;
  if (hasMove(i, j)) {
    possibleMoves = new ArrayList<ChessMove>();
    chessBoard.move(selectedI, selectedJ, i, j);
    chessBoard = chessBoard.computerPlay(Color.Black);
  } else {
    possibleMoves = chessBoard.getPossibleMoves(i, j);
  }
  selectedI = i;
  selectedJ = j;
}

Boolean hasMove(int i, int j) {
  for (ChessMove move : possibleMoves) {
    if (move.toI == i && move.toJ == j) {
      return true;
    }
  }
  return false;
}
