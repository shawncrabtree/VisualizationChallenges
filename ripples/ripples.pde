
void setup(){
  size(800, 800);
}

// Lower is more rain
int rainRate = 10;

ArrayList<Ripple> ripples = new ArrayList<Ripple>();
void draw(){
  // TODO: Perlin EVERYWHERE!!!
  if (random(rainRate) < 1){
    ripples.add(new Ripple(random(0, width), random(0,height), 1, 50));
  }
  
  
  background(0);
  noFill();
  stroke(255);
  ArrayList<Ripple> doneRipples = new ArrayList<Ripple>();
  for (Ripple ripple : ripples){
    ripple.draw();
    if (!ripple.update()){
      doneRipples.add(ripple);
    }
  }
  ripples.removeAll(doneRipples);
}
