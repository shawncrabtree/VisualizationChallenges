public class TileSet implements Iterable<Tile> {


  public HashSet<Tile> tiles = new HashSet<Tile>();
  public TileSet() {
  }

  public Iterator<Tile> iterator() {
    return this.tiles.iterator();
  }

  public void add(Tile t) {
    tiles.add(t);
  }

  public boolean hasTile(int _x, int _y) {
    // TODO: Optimize everything so much!!!
    for (Tile t : tiles) {
      if (t.x == _x && t.y == _y) {
        return true;
      }
    }
    return false;
  }

  public int countNeighbors(int _x, int _y) {
    int count = 0;
    for (Tile tile : tiles) {
      if ((tile.x != _x || tile.y != _y) && abs(tile.x-_x) <= 1 && abs(tile.y-_y) <= 1) {
        count++;
      }
    }
    return count;
  }

  public int minX() {
    int min = 0;
    for (Tile tile : tiles) {
      if (min == 0 || tile.x < min) {
        min = tile.x;
      }
    }
    return min;
  }

  public int maxX() {
    int max = 0;
    for (Tile tile : tiles) {
      if (max == 0 || tile.x > max) {
        max = tile.x;
      }
    }
    return max;
  }

  public int minY() {
    int min = 0;
    for (Tile tile : tiles) {
      if (min == 0 || tile.y < min) {
        min = tile.y;
      }
    }
    return min;
  }

  public int maxY() {
    int max = 0;
    for (Tile tile : tiles) {
      if (max == 0 || tile.y > max) {
        max = tile.y;
      }
    }
    return max;
  }
}
