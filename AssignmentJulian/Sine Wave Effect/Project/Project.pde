import processing.sound.*;
import beads.*;
import org.jaudiolibs.beads.*;
import java.util.Arrays; 

  AudioContext context;
  Gain mainVolume;
  sinWave wave;
  

  
  public void setup(){
    sound = new SoundFile(this, "sinewave.mp3");
    sound.play();
    size(400,400);
    background(0);
    try{
      wave = new sinWave("",1,0,100);
    }catch(IOException e){}
    
  }



  public void draw(){
    clear();
    wave.drawEffect();
  
  }
