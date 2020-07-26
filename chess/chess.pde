
ChessBoard chessBoard;
int selectedI = -1;
int selectedJ = - 1;
ArrayList<Integer[]> possibleMoves;
PFont f; 
void setup() {
  size(800, 800);
  f = createFont("Arial", 16, true); 
  textFont(f, 16);
  chessBoard = new ChessBoard();
  possibleMoves = new ArrayList<Integer[]>();
}


void draw() {
  background(128);
  stroke(255);
  strokeWeight(1);
  chessBoard.draw();

  if (selectedI != -1) {
    chessBoard.drawMoves(possibleMoves);
  }
}

void mouseClicked() {
  int i = (int)8 * mouseX / width;
  int j = (int)8 * mouseY / height;
  if (hasMove(i, j)) {
    possibleMoves = new ArrayList<Integer[]>();
    chessBoard.move(selectedI, selectedJ, i, j);
  } else {
    possibleMoves = chessBoard.getPossibleMoves(i, j);
  }
  selectedI = i;
  selectedJ = j;
}

Boolean hasMove(int i, int j) {
  for (Integer[] arr : possibleMoves) {
    if (arr[0] == i && arr[1] == j) {
      return true;
    }
  }
  return false;
}
