public class TileSet {

  public Tile tiles[][];
  public int xSize;
  public int ySize;
  private int xOff;
  private int yOff;
  public TileSet(int _xs, int _ys) {
    xSize = _xs;
    ySize = _ys;
    tiles = new Tile[xSize][ySize];
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        tiles[i][j] = new Tile();
      }
    }
    xOff = 0;
    yOff = 0;
  }

  public void initializeRandom() {
    for (int i = xSize/4; i < xSize*3/4; i++) {
      for (int j = ySize/4; j < ySize*3/4; j++) {
        if (noise(i, j) >= .6) {
          tiles[i][j].isAlive = true;
        }
      }
    }
    moveNext();
  }

  public void draw() {
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        float xCo = map(i, 0, xSize, 0, width);
        float yCo = map(j, 0, ySize, 0, height);
        if (tiles[i][j].isAlive) {
          fill(255);
        } else {
          fill(0);
        }
        rect(xCo, yCo, width/xSize, height/ySize);
      }
    }
  }

  private void resize() {
    Tile[][] newTiles = new Tile[xSize+2][ySize+2];
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        newTiles[i+1][j+1] = tiles[i][j];
      }
    }
    for (int i = 0; i < xSize+2; i++) {
      newTiles[i][0] = new Tile();
      newTiles[i][ySize+1] = new Tile();
    }
    for (int j = 1; j < ySize+2; j++) {
      newTiles[0][j] = new Tile();
      newTiles[xSize+1][j] = new Tile();
    }
    tiles = newTiles;
    xSize += 2;
    ySize += 2;
    xOff += 1;
    yOff += 1;
  }

  public void moveNext() {
    // check for resize
    boolean shouldResize = false;
    for (int j = 0; j < ySize; j++) {
      if (tiles[0][j].isAlive) {
        shouldResize = true;
      } else if (tiles[xSize-1][j].isAlive) {
        shouldResize = true;
      }
    }
    if (!shouldResize) {
      for (int i = 0; i < xSize; i++) {
        if (tiles[i][0].isAlive) {
          shouldResize = true;
        }
        if (tiles[i][ySize-1].isAlive) {
          shouldResize = true;
        }
      }
    }

    if (shouldResize) {
      resize();
    }



    // reset neighbor counts
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        tiles[i][j].neighborCount = 0;
      }
    }

    // count neighbors
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        if (tiles[i][j].isAlive) {
          incrementNeighbors(i, j);
        }
      }
    }

    // calculate next living state
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        int nc = tiles[i][j].neighborCount;
        boolean isAl = tiles[i][j].isAlive;
        if (isAl && nc != 2 && nc != 3) {
          tiles[i][j].isAlive = false;
        } else if (!isAl && nc == 3) {
          tiles[i][j].isAlive = true;
        }
      }
    }
  }


  private void incrementNeighbors(int i, int j) {
    tiles[i+1][j].neighborCount++;
    tiles[i-1][j].neighborCount++;
    tiles[i][j+1].neighborCount++;
    tiles[i][j-1].neighborCount++;
    tiles[i+1][j+1].neighborCount++;
    tiles[i+1][j-1].neighborCount++;
    tiles[i-1][j+1].neighborCount++;
    tiles[i-1][j-1].neighborCount++;
  }


  private class Tile {
    public int neighborCount = 0;
    public boolean isAlive = false;
  }
}
