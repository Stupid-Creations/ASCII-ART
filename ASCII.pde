PImage a;
color c;
String depth = "Wwli:,.";
String depth1 = "@#S%?*+;:,.";
String depth2 = " .,:ilwW";
char[] picture;

PrintWriter output;

void setup() {
  size(200,200);
  loadPixels();
  picture = new char[pixels.length];
  output = createWriter("NICE.TXT");
  noLoop();
}

void draw() {
  a = loadImage("DSC00094.JPG");
  a.resize(width, height);
  image(a, 0, 0);
  loadPixels();
  for (int i = 0; i<(width*height); i++) {
    pixels[i] = color(brightness(pixels[i]));
    picture[i] = get_character(int(brightness(pixels[i])));
  }
  updatePixels();
  for (int i = 0; i<picture.length; i++) {
    output.print(picture[i]);
    if (i%width == 0) {
      output.println();
    }
  }
  output.flush();
  output.close();
  exit();
}               


char get_character(int brightness) {
  int b = floor(map(brightness, 0, 255, 0, depth1.length()-1));
  char a = depth1.charAt(b);
  return a;
}
