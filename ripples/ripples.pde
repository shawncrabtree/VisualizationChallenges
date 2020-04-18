
void setup(){
  size(800, 800);
}

// Lower is more rain
int rainRate = 4;

float growthRate = 4;
int c = 0;
ArrayList<Ripple> ripples = new ArrayList<Ripple>();
void draw(){
  
  if (c % rainRate == 0){
    ripples.add(new Ripple(random(0, width), random(0,height)));
  }
  
  
  background(0);
  noFill();
  stroke(255);
  ArrayList<Ripple> doneRipples = new ArrayList<Ripple>();
  for (Ripple ripple : ripples){
    ripple.draw();
    if (!ripple.update(growthRate)){
      doneRipples.add(ripple);
    }
  }
  ripples.remove(doneRipples);
  
  c++;
}
