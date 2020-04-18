public class Ripple {
  public float x;
  public float y;
  //public float amplitude;
  private int count;
  private float speed;
  private int wavelength;
  public ArrayList<RippleRing> rings = new ArrayList<RippleRing>(); 

  private static final int TTL = 200;

  public Ripple(float _x, float _y, float _s, int _wv) {
    x = _x;
    y = _y;
    speed = _s; // pixels per frame
    wavelength = _wv; // # of frames because constant velocity????
    count = 0;
    rings.add(new RippleRing(0));
  }

  void draw() {
    strokeWeight(1);
    // TODO: Greyscale between the rings?
    stroke(color(map(count, 0, TTL, 255, 0)));
    for (RippleRing ring : rings) {
      // TODO: Dampen more for bigger rings
      ellipse(x, y, ring.radius, ring.radius);
    }
  }

  boolean update() {
    for (RippleRing ring : rings) {
      ring.radius += speed;
    }
    if (count % wavelength == 0) { // wavelength in units of frames because constant velocity?????????
      rings.add(new RippleRing(0));
    }
    count++;
    return count <= TTL;
  }

  private class RippleRing {
    public float radius;
    public RippleRing(float _r) {
      radius = _r;
    }
  }
}
