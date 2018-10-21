import processing.sound.*;
import beads.*;
import org.jaudiolibs.beads.*;
import java.util.Arrays; 

  AudioContext context;
  Gain mainVolume;
  sinWave wave;
  float posX, posY, amplitude = 40, variationY, temps = 0, WaveSpeed, completeCycle, subCycle;
  int startX = 100, endX = 500, step=10, distanceX;
  color color_1, color_2;
  SoundFile sound;

  
  public void setup(){
    size(400,400);
    background(0);
    color_1 = color(200, 100, 0);
    color_2 = color(150,240,50);

    noStroke();
    smooth();
    rectMode(CENTER);
    distanceX = endX-startX;
    completeCycle = TWO_PI/float(distanceX);
    subCycle = (TWO_PI*5)/float(distanceX);
    try{
      wave = new sinWave("",1,0,100);
    }catch(IOException e){}
    sound = new SoundFile(this, "sinewave.mp3");
    sound.play();
    //context = new AudioContext();
    //WavePlayer freqModulator = new WavePlayer(context, 150, Buffer.SINE);
    //Function function = new Function(freqModulator) {
    //  public float calculate() {
    //    return x[0] * 100.0 + 600.0;
    //  }
    //};

    //WavePlayer wp = new WavePlayer(context, function, Buffer.SINE);
    //mainVolume = new Gain(context, 1, 0.2);
    //mainVolume.addInput(wp);
    //context.out.addInput(mainVolume);
    //context.start();
  }

color fore = color(20, 255, 100);
color back = color(0,0,0);

  public void draw(){
    clear();
    wave.drawEffect();
  
  }
