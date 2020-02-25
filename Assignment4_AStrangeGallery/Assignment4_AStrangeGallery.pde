PImage img[];
int currentImg = 0;
int mode = int(random(0, 4));
color newColor;

void setup() {
  size(960, 720);
  noStroke();
  textSize(24);
  textAlign(CENTER, CENTER);
  img = new PImage[5];
  img[0] = loadImage("images/StarryNight.jpg");
  img[1] = loadImage("images/MonaLisa.jpg");
  img[2] = loadImage("images/ASundayonLaGrandeJatte.jpg");
  img[3] = loadImage("images/ParisStreetRainyDay.jpg");
  img[4] = loadImage("images/TheLastSupper.jpg");
}

void draw() {
  //Show the image
  image(img[currentImg], 0, 0, width, height);
  fill(255, 180);
  rect(0, height - 50, width, 50);
  
  //Color manipulation 
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
     int thisPixel = i + j * width; 
     color thisColor = pixels[thisPixel];
     float R = red(thisColor);
     float G = green(thisColor);
     float B = blue(thisColor);
     
     if (mode == 0) {
       newColor = color(G, R, B);
     }
     
     else if (mode == 1) {
       newColor = color(R, B, G);
     }
     
     else if (mode == 2) {
       newColor = color(B, G, R);
     }
     
     else if (mode == 3) {
       newColor = color(G, B, R);
     }
     
     pixels[thisPixel] = newColor;
    }
  }
  updatePixels();
  
  //Add texts
  fill(0);
  text("Click your mouse to switch between images", width/2, height-28);
}

void mousePressed() {
  mode = int(random(0, 4));
  currentImg += 1;
  if (currentImg > 4) {
    currentImg = 0;
  }
}
