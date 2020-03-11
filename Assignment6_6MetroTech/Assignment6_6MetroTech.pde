PImage img;
int myColor = 0;
int myColorChange = 1;
float degree = 0;

void setup() {
  background(0);
  size(427, 640);
  textSize(16);
  textAlign(CENTER, CENTER);
  img = loadImage("img.JPG");
  img.resize(width, height);
}

void draw() {    
  text("Move your mouse to", width/2, height-58);
  text("let the image make sense.", width/2, height-36);
    
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 5; j++) {
      degree = map(mouseX, 20, width-20, 0, 2*PI);
      rotate(degree);
      println(degree);
      copy(img, i*width/3, j*height/5, width/3, height/5, i*width/3, j*height/5, width/3, height/5);
    }
  }
  
  if (degree == 0.0 || degree == 2*PI)
    text("Congrats! You made it!", width/2, height-40);
}
