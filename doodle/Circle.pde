
public class Circle{
  private float radius;
  public float getRadius(){
     return radius; 
  }
  
  public Circle(float r){
     radius = r;
  }
  
  public void Grow(float amt){
    if (radius < width){
      radius += amt;
    }
  }
  
  public void Draw(float angle){
    noFill();
    arc(0, 0, radius, radius, angle, TWO_PI - angle); 
  }
}

public class MoveableCircle extends Circle{
  private float x;
  private float y;
  
  public MoveableCircle(float r, float _x, float _y) {
    super(r);
    x = _x;
    y = _y;
  }
  
  public void Move(float _x, float _y){
    x += _x;
    y += _y;
  }
}
