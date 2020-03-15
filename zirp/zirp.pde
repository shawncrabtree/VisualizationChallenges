
int count = 0;

void setup(){
  size(800, 693); //<>//
}


void draw(){
  if (count < 8){
    background(0);
    stroke(255);
    drawTriangles(0);
    count++;
    delay(1000);
  }
}

void drawTriangles(int i){
  float h = funFunc(width); //<>//
  if (i != count){
    scale(.5);
    translate(width/2, 0);
    drawTriangles(i+1);
    translate(width/2, h);
    drawTriangles(i+1);
    translate(-width, 0);
    drawTriangles(i+1);
    translate(0, -h);
    scale(2);
  }
  else{
    drawTriangle(0, 0, width, h);
  }
}

void drawTriangle(float x1, float y1, float x2, float y2){
  triangle(x1, y1+y2, x1 + (x2/2), y1, x1+x2, y1+y2);
}


float funFunc(float x){
  return sqrt(3 * x * x / 4 );
}
