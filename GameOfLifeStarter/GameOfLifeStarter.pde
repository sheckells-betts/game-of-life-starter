final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  for (int r = 0; r < grid.length; r++) {
    for (int c =0; c < grid[r].length; c++) {
      if ( (int)(random(1, (DENSITY*100)))== 1) {
        grid[r][c]=1;
      }
      System.out.print(grid[r][c]);
    }
    System.out.println();
  }
}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  for (int r = 0; r < grid.length; r++) {

    for (int c = 0; c < grid[r].length; c++) {
      if (countNeighbors(r, c) > 3) {
        nextGrid[r][c]=1;
      }
      else{
        nextGrid[r][c]=0;
      }
    }
  }
  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  int xLim;
  int yLim;
  int xMin;
  int yMin;
  if (y == grid.length-1) {
    yLim=y;
  } else {
    yLim = y+1;
  }
  if (x == grid[0].length-1) {
    xLim=x;
  } else {
    xLim = x+1;
  }
  if (y == 0) {
    yMin=y;
  } else {
    yMin = y-1;
  }
  if (x == 0) {
    xMin=x;
  } else {
    xMin = x-1;
  }



  for (int r = yMin; r <= yLim; r++) {

    for (int c = xMin; c<=xLim; c++) {

      if (c == x && r == y) {
      } else if (grid[r][c] == 1) {
        n++;
      }
    }
  }


  // your code here
  // don't check out-of-bounds cells

  return n;
}

void showGrid() {
  // your code here
  // use square() to represent each cell
  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)

  for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[r].length; c++) {
      if (grid[r][c] == 1) {
        fill(#2D43AD);
        square(c*SPACING, r*SPACING, SPACING);
      }
    }
  }
}
