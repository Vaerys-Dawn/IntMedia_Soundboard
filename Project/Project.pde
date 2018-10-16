import beads.*;
import org.jaudiolibs.beads.*;

  AudioContext context;
  Gain mainVolume;
  float x, y, w;
  float spdX, spdY, rotSpd;
  float theta;
  shatterEffect shatter;
  
  public void setup(){
    size(300,300);
    background(255);
    x = width- width;
    y = height - height;
    w = 150;
    spdX = 5.0f;
    spdY = 5.0f;
    rotSpd = PI/150;
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
