int image_count;
String[] files;
PImage[] images;

void setup() { 
  size(800, 800); 
  String path = sketchPath+"/oil_photos/";
  File file = new File(path);
  files = file.list();
  image_count = files.length;
  images = new PImage[image_count];
  for (int i = 0; i < files.length; i++ ) {
    images[i] = loadImage(path+files[i]) ;
  }
  
}  

void draw() {
  image(images[int(random(image_count))], 0, 0); 
}

