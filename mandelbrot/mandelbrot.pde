

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
      Complex c = new Complex(x, y);
      int loc = i + j * width;
      if (mandelbrot(c) == 0) {
        pixels[loc] = color(128);
      } else {
        pixels[loc] = color(255);
      }
    }
  }
  updatePixels();
  count++;
}

int mandelbrot(Complex c) {
  float nx = 0;
  float ny = 0;
  int count = 0;
  while (Math.hypot(nx, ny) < 2) {
    float tempNx = nx;
    nx = nx * nx - ny * ny + (float)c.re();
    ny = tempNx * ny + ny * tempNx + (float)c.im();
    count++;
    if (count > 100) {
      return 0;
    }
  }
  return count;
}
