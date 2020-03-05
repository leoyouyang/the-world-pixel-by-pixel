// Code for the blur effect: "PXP_camera_blur" written by Daniel Rozin

PImage img[];
int currentImg = 0;
int ballX, ballY;
int dirX = 1;
int dirY = 1;
float imgZoomX = 0;
float imgZoomY = 0;

void setup() {
  size(960, 640);
  img = new PImage[6];
  for (int i = 0; i < 6; i++) {
    img[i] = loadImage("images/" + i + ".jpg");
    img[i].resize(width, height);
  }
  ballX = int(random(25, width - 25));
  ballY = int(random(25, height - 25));
}

void draw() {
  //Zoom in on the image
  imgZoomX += 1.5;
  imgZoomY += 1.5;
  
  //Show the image
  image(img[currentImg], 0 - imgZoomX/2, 0 - imgZoomY/2, width + imgZoomX, height + imgZoomY);
  
  //Change the image every 75 frames
  if (frameCount % 75 == 0) {
    currentImg += 1;
    imgZoomX = 0;
    imgZoomY = 0;
      
    if (currentImg > 5) {
      currentImg = 0;
    }
  }
  
  //Create the crystal ball
  img[currentImg].loadPixels();
  loadPixels();
  int blurAmount = 5;
  int divider=  (2*blurAmount+1)*(2*blurAmount+1);
  for (int x = max(ballX-50, blurAmount); x<min(ballX+50, width-blurAmount); x++) {
    for (int y = max(ballY-50, blurAmount); y<min(ballY+50, height-blurAmount); y++) {
     if (dist(ballX, ballY, x, y)< 50) {
        int sumR=0;
        int sumG=0;
        int sumB=0;
        for (int blurX=x- blurAmount; blurX<=x+ blurAmount; blurX++) {
          for (int blurY=y- blurAmount; blurY<=y+ blurAmount; blurY++) {
            PxPGetPixel(blurX, blurY, img[currentImg].pixels, width);
            sumR+=R;
            sumG+=G;
            sumB+=B;
          }
        }
        sumR/= divider;
        sumG/= divider;
        sumB/= divider;
        PxPSetPixel(x, y, sumR, sumG, sumB, 255, pixels, width);
      }
    }
  }
  updatePixels();
  
  //Make the crystal ball bounce
  ballX += 10 * dirX;
  ballY += 17 * dirY;
  if (ballX > width - 25 || ballX < 25) {
    dirX *= -1;
  }
  
  if (ballY > height - 25 || ballY < 25) {
    dirY *= -1;
  }
}

int R, G, B, A;
void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];
  A = (thisPixel >> 24) & 0xFF;
  R = (thisPixel >> 16) & 0xFF;
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a =(a << 24);                       
  r = r << 16;
  g = g << 8; 
  color argb = a | r | g | b; 
  pixelArray[x+y*pixelsWidth]= argb;
}
