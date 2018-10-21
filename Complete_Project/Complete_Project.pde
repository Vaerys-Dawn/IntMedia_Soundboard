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
        size(400, 1000);
    }

    //bouncy ball sound recieved from here: http://soundbible.com/1626-Ball-Bounce.html

    public void setup() {
        context = new AudioContext();
        mainVolume = new Gain(context, 1, 1f);
        context.out.addInput(mainVolume);
        context.start();
        try {
          effects.put(49, new FlameEffect("fire.mp3", 1, 0, width/10));          // 1
          effects.put(50, new SineWaveEffect("sinewave.pm3", 2, 100, width/10)); // 2
          effects.put(51, new ZigZagEffect("", 3, 200, width/10));               // 3
          effects.put(52);
          effects.put(53);
          effects.put(54, new BubbleEffect("bubbles.mp3", 6, 500, width / 10));  // 6
          effects.put(55, new RainEffect("rain.mp3", 7, 600, width / 10));       // 7
          effects.put(56, new BallEffect("ball.mp3", 8, 700, width / 10));       // 8
          effects.put(57, new SlideBoxEffect("slide.mp3", 9, 800, width / 10));  // 9
          effects.put(48, new ShatterEffect("shatter.mp3", 0, 900, width /10));  // 0
        } catch (IOException e) {}
    }

    public void draw() {
        clear();
        background(0);
        for (Map.Entry<Integer, Effect> e : effects.entrySet()) {
            e.getValue().drawEffect();
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
