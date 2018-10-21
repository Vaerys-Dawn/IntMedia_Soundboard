import beads.*;
import org.jaudiolibs.beads.*;

  AudioContext context;
  Gain mainVolume;
  ParticleEffect particle;
 
  public void setup(){
    size(800,800);
    context = new AudioContext();
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
    try{
      particle = new ParticleEffect("",0,-200,200);
    }catch(IOException e){}
  }

  public void draw(){
    clear();
    background(0);
    particle.drawEffect();
  }
  
// Press Key 1
public void keyPressed() {
  if (keyCode == 49) particle.play();
  if (key == 'e' || key =='E'){
  exit();
  }
}

public void keyReleased() {
  if (keyCode == 49) particle.pause();
}
