import java.util.*;  

TileSet tiles;

int n = 16;

void setup() {

  fullScreen();
  tiles = new TileSet(width/n, height/n);
  tiles.initializeRandom();
}

void draw() {
  background(128);
  tiles.draw();
  tiles.moveNext();
 // delay(500);
  /*
  TileSet nextAliveTiles = new TileSet(200, 200);
   
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
   }*/


  //aliveTiles = nextAliveTiles;
}
