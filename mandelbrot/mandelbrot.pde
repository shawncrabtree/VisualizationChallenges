

void setup() {
  size(800, 533);
}
int count = 0;
void draw() {
  background(0);
  noStroke();
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      float x = map(i, 0, width, -2, 1);
      float y = map(j, 0, height, -1, 1);
      int loc = i + j * width;
      if (mandelbrot(x, y) == 0) {
        pixels[loc] = color(0);
      } else {
        pixels[loc] = color(255);
      }
    }
  }
  updatePixels();
  count++;
}

int mandelbrot(float cRe, float cIm) {
  float nx = 0;
  float ny = 0;
  int count = 0;
  while (Math.hypot(nx, ny) < 2) {
    float tempNx = nx;
    nx = nx * nx - ny * ny + cRe;
    ny = tempNx * ny + ny * tempNx + cIm;
    count++;
    if (count > 100) {
      return 0;
    }
  }
  return count;
}
