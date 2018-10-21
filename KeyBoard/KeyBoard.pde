import beads.*;
import org.jaudiolibs.beads.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

AudioContext context;
Gain gain;
Map<Integer, KeyObject> keys = new HashMap<Integer, KeyObject>();
Sample sample;

public void settings() {
    size(1000, 100);
}

public void setup() {
    loop();
    context = new AudioContext();
    gain = new Gain(context, 1, 1f);
    context.start();
    context.out.addInput(gain);
    noStroke();
    textSize(32);
    try {
        sample = new Sample(dataPath("Trumpet_FULL.mp3"));
    } catch (IOException e) {
        e.printStackTrace();
    }
    keys.put(49, new KeyObject(1, 0.2f));
    keys.put(50, new KeyObject(2, 0.4f));
    keys.put(51, new KeyObject(3, 0.6f));
    keys.put(52, new KeyObject(4, 0.8f));
    keys.put(53, new KeyObject(5, 1f));
    keys.put(54, new KeyObject(6, 1.2f));
    keys.put(55, new KeyObject(7, 1.4f));
    keys.put(56, new KeyObject(8, 1.6f));
    keys.put(57, new KeyObject(9, 1.8f));
    keys.put(48, new KeyObject(0, 2f));
    context.start();
}

public void draw() {
    clear();
    background(255);
    for (Map.Entry<Integer, KeyObject> k : keys.entrySet()) {
        k.getValue().drawObject();
        if (!keyPressed) k.getValue().checkPressed(mouseX, mousePressed);
    }
}

public void keyPressed() {
    KeyObject object = keys.get(keyCode);
    if (object != null) object.play();
}

public void keyReleased() {
    KeyObject object = keys.get(keyCode);
    if (object != null) object.pause();
}

public void mouseReleased(){
  if (keyPressed) return;
  for (Map.Entry<Integer, KeyObject> k : keys.entrySet()) {
        k.getValue().pause();
    }
}
