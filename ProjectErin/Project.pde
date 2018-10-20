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
        size(400, 800);
    }

    //bouncy ball sound recieved from here: http://soundbible.com/1626-Ball-Bounce.html

    public void setup() {
        context = new AudioContext();
        mainVolume = new Gain(context, 1, 1f);
        context.out.addInput(mainVolume);
        context.start();
        try {
            effects.put(55, new RainEffect("Rain_Heavy_Loud.mp3", 1, 0, width / 2));
            effects.put(56, new BallEffect("Ball_Sound.mp3", 2, 200, width / 2));
        } catch (IOException e) {
        }
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
