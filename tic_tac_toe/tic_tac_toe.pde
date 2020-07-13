

PFont f;
TBoard board;
void setup(){
  size(400, 400);
  f = createFont("Arial",16,true); 
  textFont(f,48);
  board = new TBoard();
  //board = board.miniMax('O');
}

void mouseClicked() {
  Point p = getPoint(mouseX, mouseY);
  board.play('X', p);
  if (board.score == -1){
    println("USER WINS");
  }
  board = board.miniMax('O');
  if (board.score == 1){
     println("COMPUTER WINNER"); 
  }
}

Point getPoint(int mx, int my){
  return new Point(getIJ(width, mx), getIJ(height, my));
}

public int getIJ(int fullW, int w){
  if (w < fullW / 3){
    return 0;
  }
  else if (w < 2*fullW/3){
   return 1; 
  }
  return 2;
}

void draw(){
  
  background(0);
  stroke(255);
  
  board.draw();
}
