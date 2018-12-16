import ddf.minim.*;
 
Minim minim;
AudioPlayer song;

boolean isPlaying;
 
void setup()
{
  size(100, 100);
 
  minim = new Minim(this);
 
  // this loads mp3 from the data folder
  // song = minim.loadFile("gameover.mp3");
   song = minim.loadFile("jingle2.wav");
  song.play();
  // song.loop();

  isPlaying = true;
}
 
void draw()
{
  if (isPlaying) {
    song.play();
  } else{
    song.pause();
  }
}

void mouseClicked(){  
  isPlaying = !isPlaying;
}
