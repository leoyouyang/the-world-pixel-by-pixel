int i, j;

void setup() {
  size(960, 600);
  noStroke();
  
}

void draw() {
  background(0);
  for (i = 0; i < width; i += 30) {
    for (j = 0; j < height; j += 30) {
      float dia = map(dist(mouseX, mouseY, i, j), 1133, 0, 35, 20);
      ellipse(i + dia/2, j + dia/2, dia, dia);
    }
  }
}
