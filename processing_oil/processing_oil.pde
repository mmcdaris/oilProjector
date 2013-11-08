int image_count;
String[] files;
PImage[] images;

String get_oil() {
  String oil_count = "";
  String lines[] = loadStrings("http://processing.org/about/index.html");
  println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++) {
  }
  return oil_count; 
}

void setup() {
  background(0);
  frameRate(10);
  size(1000, 800); 
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
  image(images[int(random(image_count))], random(300), random(300)); 
}

