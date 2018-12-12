//
//  Hour of Code { 彩虹水族箱 } - 每條魚都有在一起的權利 - Dec. 12, 2016
//
//
//  Created by Rosali Chang on 2016/12/08.
//  Special thanks to Radian Jheng.
//  Photo credit to Youga Chang.
//  Advising Prof. Jones Yu.
//



// 背景、控制按鈕、小手圖示
PImage bgImg ;
PImage btn[]  =  new PImage[3] ;    // 有三個按鈕：放入烏龜、放入魚、清理水族箱
PImage hand_open, hand_grab ;       // 小手有兩種狀態：放開（未抓住動物）、握住（抓住動物）
boolean hold  =  false;             // 小手狀態是否為握
int btnMargin =  15 ;               // 按鈕彼此間的間隔
int btnSize   =  50 ;               // 按鈕大小
int btnRadius =  btnSize/2 ;        // 按鈕半徑


// 使用聲音相關函式
import      ddf.minim.* ;
Minim       minim ;
AudioPlayer bgMusic ;               // 背景音樂
AudioSample kiss ;                  // 接吻音效


// 管理動物
Animal animal[] = new Animal[10] ;  // 至多管理１０隻動物        
int aniCounter ;                    // 目前總共有幾隻動物


// 相戀動畫
LoveAnimation loveAnimation ; 


// 兩隻動物相戀後的標記
Love love[] = new Love[5] ;         // 至多５對相戀動物  
int loveCounter ;                   // 目前總共有幾對



void setup() {
  size(800, 600) ;
  noCursor();  // 讓鼠標消失

  // 讀入背景圖、三個按鈕圖、小手圖
  bgImg     = loadImage("img/bgImage.png") ;
  hand_open = loadImage("img/hand_open.png") ;
  hand_grab = loadImage("img/hand_grab.png") ;
  for (int i = 0; i < btn.length; i++ ) { 
    btn[i] = loadImage("img/btn_" + i + ".png") ;
  }

  // 背景音樂、相戀音效
  minim   =  new Minim(this) ;
  kiss    =  minim.loadSample("audio/kiss.mp3", 512) ;
  bgMusic =  minim.loadFile("audio/bgMusic.mp3") ;
  bgMusic.play() ;
  bgMusic.loop() ;

  // 相戀動畫設置
  int animationTime =  1  ;  // in seconds ;
  int animationSize =  50 ;  // in pixel ;
  loveAnimation     =  new LoveAnimation("img/heart.png", animationTime, animationSize  ) ;
}


void draw() {
  
  // 呈現背景圖、三個按鈕
  image(bgImg, 0, 0, width, height) ;
  for (int i = 0; i < btn.length; i++) { 
    image(btn[i], btnSize * i + btnMargin * (i + 1), btnMargin, btnSize, btnSize) ;
  }

  // 讓動物移動並呈現在畫布上
  for (int i = 0; i < aniCounter; i++) {
    animal[i].move() ;
    animal[i].display() ;
  }

  // 呈現相戀動畫
  loveAnimation.display() ;

  // 呈現相戀標記
  for (int i = 0; i < loveCounter; i++) {
    love[i].display() ;
  }

  // 呈現小手
  imageMode(CENTER);
  image(hold ? hand_grab : hand_open, mouseX, mouseY, 30, 30) ;
  imageMode(CORNER);
}


void mouseClicked() {

  // 按鈕範圍判斷
  if (aniCounter < 10 & dist(mouseX, mouseY, (btnMargin * 1) + btnRadius, btnMargin + btnRadius) < btnRadius) {

    // 生成一隻烏龜
    animal[aniCounter++] = new Turtle() ;
  } else if (aniCounter < 10 & dist(mouseX, mouseY, (btnSize * 1) + (btnMargin * 2) + btnRadius, btnMargin + btnRadius) < btnRadius) {

    // 生成一隻魚
    animal[aniCounter++] = new Fish() ;
  } else if (dist(mouseX, mouseY, (btnSize * 2) + (btnMargin * 3) + btnRadius, btnMargin + btnRadius) < btnRadius) {

    // 清理水族箱   
    for (int i = 0; i < aniCounter; i++) {        
      animal[i] = null ;
    }
    aniCounter = 0 ;
    for (int i = 0; i < loveCounter; i++) {        
      love[i] = null ;
    }
    loveCounter = 0 ;
  }
}



boolean gotcha  = false ;  // 表示動物是否有被抓到
int gotAniIndex = -1 ;     // 被抓到動物的編號, -1 代表尚未抓有動物

void mousePressed() {
// 按下滑鼠，若小手位置在動物身長範圍內，將抓到該動物

  hold = true ;

  for (int i=0; i < aniCounter; i++) {

    // 判斷該動物有沒有被抓到
    gotcha = animal[i].grab();

    // 若有，記住被抓到動物的編號
    if (gotcha) {
      gotAniIndex = i ;                 
      //println("got:" + gotAniIndex) ;
      break ;
    }
  }
}


void mouseDragged() {                   
  // 按著滑鼠，若有抓到動物，便可隨著小手拖曳動物

  if (gotcha) {
    animal[gotAniIndex].moveTo();
  }
}


void mouseReleased() {
  // 放開滑鼠，若抓有動物，且該動物單身，便可讓其與其他單身動物配對

  if (gotcha && !animal[gotAniIndex].married) {

    boolean metMate = false ;  // 表示被抓到的動物是否有遇到伴侶
    int metAniIndex = -1 ;     // 和抓到動物相遇的動物的編號, -1 代表並未有動物與被抓到動物相遇

    for (int i=0; i < aniCounter; i++) {

      // 判斷被抓到的動物有沒有遇到伴侶 (注意：不能與自己相遇)
      if (i != gotAniIndex) {
        metMate = animal[i].met() ;
      }

      // 若有，記住被相遇動物的編號
      if (metMate) {
        metAniIndex = i ;               
        //println("met:" + metAniIndex) ;
        break ;
      }
    }

    // 若有遇到伴侶 -> 與伴侶結婚
    if (metMate) {                     

      // 被抓住的動物與被相遇的動物求婚
      animal[gotAniIndex].propose(metAniIndex) ;

      //println("*** Happy Wedding for " + gotAniIndex + "&" + metAniIndex + "***") ;
    } 

    //放開滑鼠，沒有動物被抓住
    gotcha = false ;  
    gotAniIndex = -1 ;
  }

  hold = false ;
}