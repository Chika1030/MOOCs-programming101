class Turtle extends Aquatics {

  Turtle () {
    super("turtle") ;
    xSpeed = random(0.5, 1.5) * (random(1) < 0.5 ? 1 : -1) ; 
    ySpeed = random(0.5, 1.5) ;
  }

  void swim () {
    super.swim() ;
    if (y > height - h) { 
      ySpeed = 0 ;
    }
  }
}