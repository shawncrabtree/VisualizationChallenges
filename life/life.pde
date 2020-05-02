import java.util.*;  

TileSet aliveTiles = new TileSet();

int n = 75;

void setup() {

  fullScreen();

  for (int i = n/4; i < n*3/4; i++) {
    for (int j = n/4; j < n*3/4; j++) {
      if (random(0, 10) < 5) {
        aliveTiles.add(new Tile(i, j));
      }
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  for (Tile tile : aliveTiles) {
    float xCo = map(tile.x, 0, n, 0, width);
    float yCo = map(tile.y, 0, n, 0, height);
    float size = width / n;
    rect(xCo, yCo, size, size);
  }

  TileSet nextAliveTiles = new TileSet();

  // living tiles that should stay living
  for (Tile tile : aliveTiles) {
    int numNeighbors = aliveTiles.countNeighbors(tile.x, tile.y);
    if (numNeighbors == 2 || numNeighbors == 3) {
      nextAliveTiles.add(tile);
    }
  }


  for (int i = aliveTiles.minX() - 2; i < aliveTiles.maxX() + 2; i++) {
    for (int j = aliveTiles.minY() - 2; j < aliveTiles.maxY() + 2; j++) {
      if (!aliveTiles.hasTile(i, j)) {
        int neighborCount = aliveTiles.countNeighbors(i, j);
        if (neighborCount == 3) {
          nextAliveTiles.add(new Tile(i, j));
        }
      }
    }
  }


  aliveTiles = nextAliveTiles;
  delay(50);
}
