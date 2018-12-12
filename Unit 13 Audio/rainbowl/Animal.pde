class Animal {
  PImage img ;
  float size, w, h, x, y, xSpeed, ySpeed ;
  int mateIndex ;
  int proposeSpace  = 60 ;     // 求婚動作預備空間
  boolean proposing = false ;  // 是否處於求婚狀態，會影響移動方式
  boolean follower  = false ;  // 是否成為伴侶的追隨者
  boolean married   = false ;  // 是否結婚了



  Animal (String filename) {
    img = loadImage("img/" + filename + ".png") ;
    float ratio = float(img.height) / float(img.width) ;
    size = floor(random(1) + 1) * 10 + 100 ;
    w = size ;
    h = size * ratio ;
    x = random(width - w) ;
    y = 0 ;
  }


  boolean grab () {
    boolean gotcha = false ;
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {  // 當小手落在動物身長範圍內，動物就會被抓到 
      gotcha = true ;
    }
    return gotcha ;
  }


  void moveTo () {
    if (mouseX > 0 && mouseX < width - w && mouseY > 0 && mouseY < height - h) {  // 在水族箱範圍內
      x = mouseX ;
      y = mouseY ;
    }
  }


  boolean met () {
    boolean met = false ;
    if (!married && mouseX + animal[gotAniIndex].w > x && mouseX < x + w && mouseY + animal[gotAniIndex].h > y && mouseY < y + h) { // 若未婚的動物和被抓到的動物接觸，即相遇成功
      met = true ;
    }
    return met ;
  }


  void propose(int mateIndex) {

    // 被抓住動物記住求婚對象(伴侶)的編號  
    this.mateIndex = mateIndex ;        

    // 被抓住動物移至求婚位置
    if (animal[mateIndex].x > width - w - proposeSpace - animal[mateIndex].w) {  // 若被抓住動物求婚預備空間不夠，求婚對象向左移動至預備空間足夠處
      animal[mateIndex].x = width - w - proposeSpace - animal[mateIndex].w ;
    }
    x = animal[mateIndex].x + animal[mateIndex].w + proposeSpace ;
    y = animal[mateIndex].y + animal[mateIndex].h - h ;  // 兩隻動物對齊底部

    // 設定求婚儀式移動速度 
    animal[mateIndex].xSpeed = 1 ;
    xSpeed = -1 ;

    // 雙方確認開始求婚儀式
    proposing = true ;            
    animal[mateIndex].proposing = true ;

    // 相戀動畫
    loveAnimation.add(animal[mateIndex].x + animal[mateIndex].w + (proposeSpace / 2), animal[mateIndex].y) ;

    // 親吻音效
    kiss.trigger() ;

    // 被抓住動物成為伴侶的追隨者
    follower = true ;
  }


  int loveIndex ;  

  void getMarried () {
    married = true ;
    animal[mateIndex].married = true ;
    loveIndex = loveCounter ;
    love[loveIndex] = new Love() ;
    loveCounter++ ;
  }


  void move () {
    if (!follower) {

      if (!proposing) {

        x += xSpeed ;
        y += ySpeed ;

        if (x < 0 && xSpeed < 0) { 
          xSpeed *= -1 ;
        }
        if (x > width - w && xSpeed > 0) { 
          xSpeed *= -1 ;
        }
        if (y < 0 && ySpeed < 0) {
          ySpeed *= -1 ;
        }
      } else {
        x += xSpeed ;
      }
    } else {

      if (!proposing) {

        x = animal[mateIndex].x + animal[mateIndex].w / 2;
        y = animal[mateIndex].y + animal[mateIndex].h - h;  // 兩隻動物對齊底部

        if (x < 0 && animal[mateIndex].xSpeed < 0) {
          animal[mateIndex].xSpeed *= -1;
        }
        if (x > width - w && animal[mateIndex].xSpeed > 0) {
          animal[mateIndex].xSpeed *= -1;
        }

        xSpeed = animal[mateIndex].xSpeed ;

        love[loveIndex].moveTo(x, y);
      } else {
        x += xSpeed ;

        if (x < animal[mateIndex].x + animal[mateIndex].w) {
          proposing = false ;
          animal[mateIndex].proposing = false ;
          getMarried() ;
        }
      }
    }
  }


  void display () {
    boolean hDirection = (xSpeed > 0) ? true : false;
    if (hDirection) {
      pushMatrix();
      translate(x, y);
      scale(1, 1);
      image(img, 0, 0, w, h);
      popMatrix();
    } else {
      pushMatrix();
      translate(x, y);
      scale(-1, 1);
      image(img, -w, 0, w, h);
      popMatrix();
    }
  }
}