

int x, y, prevX = 0, prevY = 0;

int stepSize = 30;
int stepsPerFrame = 1;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
}

void draw() {
  translate(width/2, height/2);
  //translate(random(0, 200), random(0, 200));
  //rotate(degrees(random(0, 365)));
  //background(0);
  for (int i = 0; i < stepsPerFrame; i++) {


    x += random(-stepSize, stepSize);
    y += random(-stepSize, stepSize);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
}
