//
//  Hour of Code { 彩虹水族箱 } - 每條魚都有在一起的權利 - Dec. 12, 2016
//
//
//  Created by Rosali Chang on 2016/12/08.
//  Special thanks to Radian Jheng.
//  Photo credit to Youga Chang.
//  Advising Prof. Jones Yu.
//


// 使用聲音相關函式
import ddf.minim.*;
Minim minim;
AudioPlayer bgMusic; 
AudioSample kiss;


// 宣告 button 大小、內容、與內容位置 
float btnW = 200;
float btnH = 40;
float txtInitX = 100;
float txtY = 25;
String[] txt = {"Creat a Fish", "Creat a Turtle", "Feed", "Clear"}; 


// 相戀動畫
PImage[] hearts = new PImage[5];
int[] heartFrameCount = new int[5]; // 這個愛心經過幾次系統影格了 -> 被 draw 了幾次 -> 便可透過 frameRate 來轉換成畫了幾秒。
int[] heartX = new int[5] ; 
int[] heartY = new int[5] ;
int heartIndex = 0 ; // 現在要用哪一來儲存愛心狀態 -> 同時也代表，我要去用 array 的第幾格存。


Animal animal[] = new Animal[10];   
Feed feed;      
int aniCounter; // 目前總共有幾隻動物


void setup() {
  size(800, 600);

  textFont(createFont("AppleGothic", 15));
  textAlign(CENTER);

  // 背景音樂、相戀音效
  minim = new Minim(this);
  bgMusic = minim.loadFile("audio/bgMusic.mp3");
  bgMusic.play();
  bgMusic.loop();
  kiss = minim.loadSample("audio/kiss.mp3", 512);

  // 相戀動畫
  frameRate(30); // 每秒會 draw 幾次
  for (int i = 0; i < 5; i++) {
    //----!!!!----//
    hearts[i] = loadImage("img/heart.png");
  }
  for (int i = 0; i < heartFrameCount.length; i++) {
    heartFrameCount[i] = 9999 ;
  }
}


void draw() {
  background(0, 255, 255);

  // 實作按鈕
  fill(240);
  stroke(100);
  strokeWeight(1); 
  for (int i=0; i<4; i++) { 
    rect(btnW*i, 0, btnW, btnH);
  }
  fill(0);      
  for (int i=0; i<4; i++) { 
    text(txt[i], i*btnW+txtInitX, txtY);
  }
  text("Animal Amount : " + aniCounter, txtInitX, height-txtY);


  // 讓動物移動並呈現在畫布上
  for (int i=0; i<aniCounter; i++) {
    animal[i].move();
    animal[i].display();
  }

  // 若有食物
  if (feed != null) {
    // 讓食物墜落並呈現在畫布上
    feed.move();
    feed.display();

    // 讓動物朝食物移動
    for (int i=0; i<aniCounter; i++) {
      if (feed != null) {
        animal[i].moveToFeed();
      }
    }
  }
}


void mouseClicked() {
  if (mouseY > 0 && mouseY < 50) {
    if (mouseX > 0 && mouseX < btnW*1 && aniCounter<10) {
      // 生成一隻魚
      animal[aniCounter++] = new Fish();
    } else if (mouseX > btnW*1 && mouseX < btnW*2 && aniCounter<10) {
      // 生成一隻烏龜
      animal[aniCounter++] = new Turtle();
    } else if (mouseX > btnW*2 && mouseX < btnW*3) {
      // 撒飼料
      feed = new Feed();
    } else if (mouseX > btnW*3 && mouseX < btnW*4) {
      // 清理水族箱   
      for (int i=0; i<aniCounter; i++) {        
        animal[i] = null;
      }
      aniCounter = 0;
    }
  }
}


boolean gotcha = false; // 判斷動物是否有被抓到
int gotAnimalIndex = -1; // 被抓到動物的編號

void mousePressed() {
  for (int i=0; i<aniCounter; i++) {
    gotcha = animal[i].grab(); 
    if (gotcha) {
      gotAnimalIndex = i;
      break;
    }
  }
}

void mouseDragged() {
  if (gotcha) {
    animal[gotAnimalIndex].moveTo();
  }
}


boolean metMate; // 判斷動物是否有遇到伴侶
int gotMarriedAnimalIndex; // 伴侶的編號

void mouseReleased() {
  for (int i=0; i<aniCounter; i++) {
    metMate = animal[i].met(); // 若有遇到伴侶 -> 與伴侶結婚 
    if (metMate) {
      // 相戀POSE
      //----!!!!----//

      // 親吻音效
      kiss.trigger();

      // 相戀動畫
      //----!!!!----//

      // 結伴同行
      float xSpeed = random(9)-3;
      float ySpeed = random(9)-3;
      animal[gotAnimalIndex].getMarried();
      animal[gotAnimalIndex].xSpeed = xSpeed;
      animal[gotAnimalIndex].ySpeed = ySpeed;
      animal[i].xSpeed = xSpeed;
      animal[i].ySpeed = ySpeed;
      break;
    }
  }

  if (gotAnimalIndex != -1 && !metMate) {
    animal[gotAnimalIndex].free();
  }

  gotcha = false;
  metMate = false;
  gotAnimalIndex = -1;
  gotMarriedAnimalIndex = -1;
}