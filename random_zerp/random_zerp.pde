
PVector p1, p2, p3, current;

void setup(){
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(1);
  p1 = new PVector(width/2, 100);
  p2 = new PVector(100, height-100);
  p3 = new PVector(width-100, height-100);  
  current = new PVector(int(random(width)), int(random(height)));
  drawPoint(p1);
  drawPoint(p2);
  drawPoint(p3);
}

void draw(){
  
  for (int i = 0; i < 100; i++){
    PVector movePoint = pickMovePoint();
    current = new PVector((current.x + movePoint.x) / 2, ((current.y + movePoint.y) / 2));
    drawPoint(current);
  }
}

PVector pickMovePoint(){
  int choice = int(random(3));
  if (choice == 0){
    return p1;
  }
  else if (choice == 1){
     return p2;
  }
  return p3;
}

void drawPoint(PVector p){
  point(p.x, p.y);
}
