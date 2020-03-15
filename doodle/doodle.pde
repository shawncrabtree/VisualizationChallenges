Circle circle = new Circle(300);
MoveableCircle moveCircle = new MoveableCircle(25, 0, 0);
float growthRate = 1;
float angle = .01;

void setup() {
  size(800,800);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  circle.Grow(growthRate);
  circle.Draw(angle);
  //moveCircle.Draw(angle);
  moveCircle.Move(1, 0);
  //
  angle += .01;
}
