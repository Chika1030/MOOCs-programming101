class Fish extends Aquatics {
  
  Fish () {
    super(str(floor(random(4)))) ;
    xSpeed = random(1, 2) * (random(1) < 0.5 ? 1 : -1) ;  
    ySpeed = random(1, 2) * (random(1) < 0.5 ? 1 : -1) ;
  }

  void swim () {
    super.swim() ; 
    if (y > height - h) { 
      ySpeed *= -1 ;
    }
  }
}