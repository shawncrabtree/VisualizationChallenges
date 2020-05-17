Point[] points;
int numPoints = 8;
PFont f;



void setup() {
  size(800, 800);
  f = createFont("Arial", 8, true);

  points = new Point[numPoints];
  for (int i = 0; i < numPoints; i++) {
    points[i] = new Point((int)random(width), (int)random(height), i);
  }
}

void mousePressed() {
  for (int i = 0; i < numPoints; i++) {
    Point p = points[i];
    if (dist(mouseX, mouseY, p.x, p.y) < 20) {
      p.followMouse();
      return;
    }
  }
}

void mouseReleased() {
  for (Point p : points) {
    p.stopFollowMouse();
  }
}

void draw() {
  background(0);

  textFont(f, 32);
  fill(255);
  text("Make a Cube!!!", 10, 100);

  for (Point p : points) {
    p.draw();
  }

  drawLine(0, 1);
  drawLine(0, 2);
  drawLine(0, 3);

  drawLine(2, 5);
  drawLine(1, 5);
  drawLine(5, 6);

  drawLine(2, 7);
  drawLine(6, 7);
  drawLine(3, 7);

  drawLine(1, 4);
  drawLine(3, 4);
  drawLine(6, 4);
}

private void drawLine(int i1, int i2) {
  line(points[i1].x, points[i1].y, points[i2].x, points[i2].y);
}
