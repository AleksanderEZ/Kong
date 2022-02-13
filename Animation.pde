class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, String fileExtension, int count, int numberOfZerosInIndex) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, numberOfZerosInIndex) + fileExtension;
      images[i] = loadImage(filename);
      images[i].resize(width, height);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeight() {
    return images[0].height;
  }
}
