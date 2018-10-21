import beads.*;
import org.jaudiolibs.beads.*;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.LinkedList;
import java.util.Random;

  AudioContext context;
  Gain mainVolume;
  Map<Integer, Effect> effects = new HashMap<Integer, Effect>();
  Random random = new Random();
    
  public void settings() {
    size(1000, 800);
  }

  //bouncy ball sound recieved from here: http://soundbible.com/1626-Ball-Bounce.html

  public void setup() {
    context = new AudioContext();
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
    float bottom = height-100;
    float effectWidth = width/10;
    float increment = 0;
    try {      
      effects.put(49, new FlameEffect("fire.mp3", 1, 0, effectWidth));                                 // 1
      effects.put(50, new SineWaveEffect("sinewave.pm3", 2, increment += effectWidth, effectWidth));   // 2
      effects.put(51, new ZigZagEffect("bubbles.mp3", 3, increment += effectWidth, effectWidth));      // 3
      effects.put(54, new BubbleEffect("bubbles.mp3", 4, increment += effectWidth, effectWidth));       // 4
      effects.put(54, new BubbleEffect("bubbles.mp3", 5, increment += effectWidth, effectWidth));       // 5
      effects.put(54, new BubbleEffect("bubbles.mp3", 6, increment += effectWidth, effectWidth));       // 6
      effects.put(55, new RainEffect("rain.mp3", 7, increment += effectWidth, effectWidth));           // 7
      effects.put(56, new BallEffect("ball.mp3", 8, increment += effectWidth, effectWidth));           // 8
      effects.put(57, new SlideBoxEffect("slide.mp3",9, increment += effectWidth, effectWidth));       // 9
      effects.put(48, new ShatterEffect("shatter.mp3", 0, increment += effectWidth, effectWidth));     // 0
    } catch (IOException e) {}
  }

  public void draw() {
    clear();
    background(0);
    for (Map.Entry<Integer, Effect> e : effects.entrySet()) {
      e.getValue().drawThis();
    }
    
  }

  public void keyPressed() {
    Effect object = effects.get(keyCode);
    if (object != null) object.play();
  }

  public void keyReleased() {
    Effect object = effects.get(keyCode);
    if (object != null) object.pause();
  }
