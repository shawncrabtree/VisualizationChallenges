
ChessBoard chessBoard;
PFont f; 
void setup(){
  size(800, 800);
  f = createFont("Arial",16,true); 
  textFont(f,16);
  chessBoard = new ChessBoard();
}


void draw(){
  background(128);
  stroke(255);
  strokeWeight(1);
  chessBoard.draw();
}
