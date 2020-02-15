void setup() {
  size(700, 700);
}

void draw() {
  loadPixels();
  for (int i = 1; i < width; i++) {
    for (int j = 1; j < height; j++) {
      int myPixel = width * j + i;
      pixels[myPixel] = color(j/i*(frameCount%255+1), 0.3*(i*j/(frameCount%255+1)), i/j*(frameCount%255+1), frameCount%255);
    }
  }
  updatePixels();
}
