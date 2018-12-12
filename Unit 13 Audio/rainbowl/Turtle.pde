class Turtle extends Animal {

  Turtle () {
    super("turtle") ;
    xSpeed = (random(0, 2) + 0.1) * (random(1) < 0.5 ? 1 : -1) ; 
    ySpeed = (random(0, 2) + 0.1) ;
  }

  void move () {
    super.move() ;
    if (!follower) {
      if (y > height - h) { 
        ySpeed = 0 ;
      }
    } else {
      if (y < 0 && animal[mateIndex].ySpeed < 0) { 
        animal[mateIndex].ySpeed *= -1 ;
      }
      if (y > height - h && animal[mateIndex].ySpeed > 0) {  
        animal[mateIndex].ySpeed *= -1 ;
      }
      ySpeed = animal[mateIndex].ySpeed ;
    }
  }
}