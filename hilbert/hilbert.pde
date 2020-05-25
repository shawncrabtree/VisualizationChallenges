int minSize = 80;
void setup() {
  size(512, 512);
  background(0);
}

void draw() {
  stroke(255);
  drawHibert(512, 0, 0, 4);
}

// r: 4 is up, 1 and 3 are outsides, 2 is down
void drawHibert(int size, int x, int y, int r) {
  int newSize = size / 2;
  if (newSize < minSize) {
    // base case
    drawBasic(newSize, x, y, 4);
    drawBasic(newSize, x + newSize, y, 2);
    drawBasic(newSize, x, y + newSize, 1);
    drawBasic(newSize, x + newSize, y + newSize, 1);
    int oneEigth = size / 8;
    line(x + oneEigth, y + 3 * oneEigth, x + oneEigth, y + 5 * oneEigth);
    line(x + 7 * oneEigth, y + 3 * oneEigth, x + 7 * oneEigth, y + 5 * oneEigth);
    line(x + 3 * oneEigth, y + 5 * oneEigth, x + 5 * oneEigth, y + 5 * oneEigth);
  } else {
    // reccursive step
    drawHibert(newSize, x, y, 4);
    drawHibert(newSize, x + newSize, y, 2);
    drawHibert(newSize, x, y + newSize, 1);
    drawHibert(newSize, x + newSize, y + newSize, 1);
  }
}


void drawBasic(int size /*800, 400, 200, 100, etc.*/, int x, int y /*starting position*/, int r /*rotation (1, 2, 3, or 4)*/) {
  int oneQuarter = size / 4;
  int threeQuarters = 3 * oneQuarter;
  if (r != 4) {
    line(x + oneQuarter, y + oneQuarter, x + oneQuarter, y + threeQuarters);
  }
  if (r != 3) {
    line(x + oneQuarter, y + threeQuarters, x + threeQuarters, y + threeQuarters);
  }
  if (r != 2) {
    line(x + threeQuarters, y + threeQuarters, x + threeQuarters, y + oneQuarter);
  }
  if (r != 1) {
    line(x + threeQuarters, y + oneQuarter, x + oneQuarter, y + oneQuarter);
  }
}
