
import beads.*;
import org.jaudiolibs.beads.*;

  AudioContext context;
  Gain mainVolume;
  shatterEffect shatter;
  SoundFile sound;
  
  public void setup(){
    size(300,300);
    background(255);
    sound = new SoundFile(this, "shatter.mp3");
    sound.play();
    
    try{
      shatter = new shatterEffect("",1,0,100);
    }catch(IOException e){}
    context = new AudioContext();
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
  }

  public void draw(){
    clear();
    shatter.drawEffect();
  }
