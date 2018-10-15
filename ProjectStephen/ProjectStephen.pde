import beads.*;
import org.jaudiolibs.beads.*;

  AudioContext context;
  Gain mainVolume;
  FlameEffect flame;
  ZigZagEffect zigzag;
 
 
  public void setup(){
    size(800,800);
    context = new AudioContext();
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
    try{
      flame = new FlameEffect("",0,-200,200);
      zigzag = new ZigZagEffect("",1,200,200);
    }catch(IOException e){}
  }

  public void draw(){
    clear();
    background(0);
    flame.drawEffect();
    zigzag.drawEffect();
 text("Press '1' for flames. Press '2' for a ZigZag Ball. Press 'E' to exit.", 0 + 50, height - 30);
  }
  
public void keyPressed() {
  if (keyCode == 49) flame.play();
  if (keyCode == 50) zigzag.play();
  if (key == 'e' || key =='E'){
  exit();
  }
}

public void keyReleased() {
  if (keyCode == 49) flame.pause();
  if (keyCode == 50) zigzag.pause();
}
