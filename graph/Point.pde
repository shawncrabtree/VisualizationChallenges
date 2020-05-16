class Point {
  public int x;
  public int y;
  public int i;
  private boolean followingMouse;

  public Point(int _x, int _y, int _i) {
    x = _x;
    y = _y;
    i = _i;
    followingMouse = false;
  }


  public void draw() {
    if (followingMouse) {
      x = mouseX;
      y = mouseY;
    }
    stroke(255);
    ellipse(x, y, 20, 20);
    stroke(128);
    text(i, x + 20, y+20);
  }

  public boolean isFollowMouse() {
    return followingMouse;
  }

  public void followMouse() {
    followingMouse = true;
  }

  public void stopFollowMouse() {
    followingMouse = false;
  }
}
