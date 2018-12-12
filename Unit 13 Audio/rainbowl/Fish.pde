class Fish extends Animal {
  
  Fish () {
    super(str(floor(random(4)))) ;
    xSpeed = (random(0, 2) + 0.5) * (random(1) < 0.5 ? 1 : -1) ;  
    ySpeed = (random(0, 2) + 0.5) * (random(1) < 0.5 ? 1 : -1) ;
  }

  void move () {
    super.move() ;
    if (!follower) {
      if (y > height - h && ySpeed > 0) { 
        ySpeed *= -1 ;
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