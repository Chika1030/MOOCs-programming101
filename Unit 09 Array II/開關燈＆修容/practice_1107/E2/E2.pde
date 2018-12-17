PImage img  ;
int r = 10 ; 

void setup () {
  size(400, 400) ;
  img = loadImage("SpongeBob.jpg") ; 
}

void draw() {
  image(img, 0, 0) ;
  
  int X = mouseX ; 
  int Y = mouseY ;   
  img.loadPixels() ;

  int rSum = 0, gSum = 0, bSum = 0, total = 0 ; 

  if ( mousePressed ) {
    for (int x = X-r; x < X+r; x++) {
      for (int y = Y-r; y < Y+r; y++) {
        if (x >= 0 && x < img.width && y >= 0 && y < img.height) {
          if (dist(x, y, X, Y) < r) {
            int loc = x + y*img.width;
            color c = img.pixels[loc] ;
            rSum  += red  (c);
            gSum  += green(c);
            bSum  += blue (c);
            total += 1 ;
          }
        }
      }
    }
  
    if (total > 0 ) {         
      for (int x = X - r; x < X + r; x++ ) {
        for (int y = Y - r; y < Y + r; y++ ) {
          if (x >= 0 && x < img.width && y>= 0 && y<img.height) {
            if (dist(x, y, X, Y) < r) {
              int loc = x + y*img.width;
              color c = img.pixels[loc] ;
              img.pixels[loc] =  color (rSum / total, gSum / total, bSum / total );            
            }     
          }
        }
      }
      img.updatePixels();
    }
  }
}