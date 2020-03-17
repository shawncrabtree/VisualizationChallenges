

void setup() {
  size(800, 533);
}
int count = 0;
void draw() {
  background(0);
  noStroke();
  int N = 800;
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      float x = map(i, 0, N, -2, 1);
      float y = map(j, 0, 2*N/3, -1, 1);
      Complex c = new Complex(x, y);
      if (mandelbrot(c) == 0) {
        fill(color(255, 204, 0));  // Use color variable 'c' as fill color
      } else {
        fill(255);
      }
      ellipse(i, j, 1, 1);
    }
  }
  
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
