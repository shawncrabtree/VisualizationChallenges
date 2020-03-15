int numPoints = 800;
int i = 0;
float pointSize = 5;
int factor = 2;
int state = 0; // drawing dots

void setup(){
  size(800, 800);
  background(0);
}

void draw(){
  fill(255);
  stroke(255);
  translate(width / 2, height / 2);
  int mult = width / 2 - 50;
  float phase = TWO_PI / numPoints;
  if (state == 0){ //drawing dots
    // draw ellipse at point
    ellipse(cos(phase*i) * mult, sin(phase*i) * mult, pointSize, pointSize);
    if (i == numPoints){
     i = 0;
     state = 1;
    }
  }
  else if(state == 1){
    int newI = i * factor;
    line(cos(phase*i) * mult, sin(phase*i) * mult, cos(phase*newI) * mult, sin(phase*newI) * mult);
    if (i == numPoints){
     i = 0;
     state = 2; //done;
    }
  }
 i++;
 delay(10);
}
