int image_count;
String[] files;
PImage[] images;

class Tracker {
  String barrels;
  String[] parts;
  int count, mid; 
  PFont copper, helvetica;
  
  Tracker(String path) {
    barrels = loadStrings(path + "/barrels")[0];
    barrels = barrels.trim();
    mid = barrels.length() / 2;   
    parts = new String[2];
    parts[0] = barrels.substring(0,mid);
    parts[1] = barrels.substring(mid,barrels.length());
    count = int(parts[1]);
    
    println(barrels);
    println(count);
    copper = loadFont("Copperplate-135.vlw");
    helvetica = loadFont("Helvetica-Bold-100.vlw");
  }
  void minus() {
    count = count - 1; 
  }
  int get_count() {
    return count;
  }
  void display() {
    minus();
    textFont(helvetica);
    smooth();
    fill(#D30209);
    textSize(135);
    text(parts[0]+count, 10, 780);
    textSize(100);
    fill(#D30209);
    text("Barrels Left:", 10, 80); 
  }
}

Tracker oil;

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
  oil = new Tracker(sketchPath);
}

void draw() {
  image(images[int(random(image_count))], random(300), random(300));
  oil.display();
}
