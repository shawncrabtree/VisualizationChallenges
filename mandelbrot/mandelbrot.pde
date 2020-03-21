
int[] pixs;
int maxIterations = 100;
float xMin = -2, xMax = 1, yMin = -1, yMax = 1;

void setup() {
  fullScreen();
  xMax = (yMax - yMin) * width /height + xMin;
  pixs = calculatePixels();
}

void mouseClicked() {
  float scl = .5;
  float xZoomPoint = map(mouseX, 0, width, xMin, xMax);
  float xSize = xMax - xMin;
  float newXSize = xSize * scl;
  float xD = newXSize / 2;
  xMax = xZoomPoint + xD;
  xMin = xZoomPoint - xD;
  
  float yZoomPoint = map(mouseY, 0, height, yMin, yMax);
  float ySize = yMax - yMin;
  float newYSize = ySize * scl;
  float yD = newYSize / 2;
  yMax = yZoomPoint + yD;
  yMin = yZoomPoint - yD;
 
  println("clicked");
  pixs = calculatePixels();
  println("calculated");
}

void draw() {
  background(0);
  noStroke();
  loadPixels();
  for (int i = 0 ; i < width * height; i++){
    pixels[i] = pixs[i];
  }
  updatePixels();
}

int[] calculatePixels(){
  int[] pixs = new int[width*height];
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float x = map(i, 0, width, xMin, xMax);
      float y = map(j, 0, height, yMin, yMax);
      int loc = i + j * width;
      if (dist(-.25, 0, x, y) < .5){
        pixs[loc] = color(0);
      }
      else if (dist(-1, 0, x, y) < .25){
        pixs[loc] = color(0);
      }
      else {
        int mandelbrotVal = calcMandelbrot(x, y);
        float colorInt = map(mandelbrotVal, 0, maxIterations, 0, 255);
        pixs[loc] = color(colorInt);
      }
    }
  }
  return pixs;
}

int calcMandelbrot(float cRe, float cIm) {
  float nx = 0;
  float ny = 0;
  int count = 0;
  while (nx * nx + ny * ny < 4) {
    float tempNx = nx;
    nx = nx * nx - ny * ny + cRe;
    ny = tempNx * ny + ny * tempNx + cIm;
    count++;
    if (count > maxIterations) {
      return 0;
    }
  }
  return count;
}
