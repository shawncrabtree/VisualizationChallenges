public class Ripple {
  public float x;
  public float y;
  public float amplitude;
  private int count = 1;
  public ArrayList<RippleRing> rings = new ArrayList<RippleRing>(); 

  public Ripple(float _x, float _y) {
    x = _x;
    y = _y;
    amplitude = 12;
    rings.add(new RippleRing(0));
  }

  void draw() {
    if (amplitude > 0) {
      strokeWeight(amplitude);
      for (RippleRing ring : rings) {
        ellipse(x, y, ring.radius, ring.radius);
      }
    }
  }

  boolean update(float growthRate) {
    for (RippleRing ring : rings) {
      ring.radius += growthRate;

    }
    if (count % 20 == 0) {
      rings.add(new RippleRing(0));
    }
    count++;
    amplitude -= .2;
    return amplitude <= 0;
  }

  private class RippleRing {
    public float radius;
    public RippleRing(float _r) {
      radius = _r;
    }
  }
}
