

void setup(){
  fullScreen();
  background(0);
  stroke(255);
}
int N = 200000;
int stepSize = 2;
int x = 0, y = 0;
int prevX = 0, prevY = 0;
Direction direction = Direction.Up;
enum Direction {
  Up(0),
  Right(1),
  Down(2),
  Left(3);
  
  private final int value;
  private Direction(int value) {
      this.value = value;
  }

  public int getValue() {
      return value;
  }
}
// returns -1 or sqrt
int isSquare(int n){
  int roundedDownRoot = (int)Math.sqrt(n);
   if ((roundedDownRoot * roundedDownRoot) == n){
     return roundedDownRoot;
   }
   return -1;
}

void draw(){
  translate(width/2, height/2);
  int nextOther = 0;
  for (int i = 1; i < N; i++){
    x = moveX(prevX);
    y = moveY(prevY);
    int intRoot = isSquare(i-1);
    if (intRoot != -1){
      //fill(color(204, 153, 0));
      fill(255);
      direction = Direction.values()[(direction.getValue() + 1) % 4];
      nextOther = intRoot + i;
    } else if (nextOther == i){
      fill(255);
      direction = Direction.values()[(direction.getValue() + 1) % 4];
    } else if (isPrime(i)){
      fill(color(100, 40, 200));
    } else {
      fill(255);
    }
    //line(prevX, prevY,x,y);
    //text(Integer.toString(i), x, y);
    rect(x, y,stepSize, stepSize);
    prevX = x; prevY = y;
  }
  noLoop ();
}

int moveX(int curX){
  if (direction == Direction.Right){
      return curX + stepSize;
  } else if (direction == Direction.Left){
      return curX - stepSize;
  }
  return curX;
}

int moveY(int curY){
  if (direction == Direction.Up){
      return curY + stepSize;
  } else if (direction == Direction.Down){
      return curY - stepSize;
  }
  return curY;
}




static boolean isPrime(int n){  
  int i,m=0,flag=0;      
  m=n/2;      
  if(n==0||n==1){  
    return false;
  }else{  
   for(i=2;i<=m;i++){      
    if(n%i==0){      
      return false; 
    }      
   }      
   if(flag==0)  { return true; }  
  }//end of else  
  return false;
}  
