
void setup(){
  size(800, 800);
}

float angle = 0;
int numLines = 20;

void draw(){
  translate(width/2, height/2);
  background(0);
  stroke(255);
  
  float offSet = PI / numLines;
  for (int i = 0; i < numLines; i++){
    drawPoint(i*offSet);
    rotate(offSet);
  }
   
  angle += .01;
}

void drawPoint(float offSet){
  int mag = 300;
  float co = mag*cos(angle + offSet);
  
  strokeWeight(20);
  point(0, co);
  strokeWeight(1);
  line(0, -mag, 0 , mag);
}
