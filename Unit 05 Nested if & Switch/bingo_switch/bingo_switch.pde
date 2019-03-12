int bingo = floor(random(100, 1000));

switch (bingo/10) { 
  case 111:
    println("you won $100!");
  break;
  case 222:
    println("you won $200!");
  break;
  case 333:
    println("you won $300!");
  break;
  case 444:
    println("you won $400!");
  break;
  default: 
    println("wish you good luck!");
}
