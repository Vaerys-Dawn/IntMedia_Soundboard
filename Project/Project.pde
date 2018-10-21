// BASE CODE with INDIVIDUAL COMPONENT 

import beads.*;
import org.jaudiolibs.beads.*;

  AudioContext context;
  Gain mainVolume;
  BubbleEffect bubbles;
  SlideBoxEffect box;
  
  public void setup(){
    context = new AudioContext();
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
    size(800, 400);
    try {
      bubbles = new BubbleEffect("Bubbles.mp3", 6, 0, 200); //Audio clip for animation, binded to key 6
      box = new SlideBoxEffect("Slide.mp3", 9, 0, 200); //Audio clip for animation, binded to key 9
    }
    catch (IOException e) {}
  }

  public void draw(){
    bubbles.drawEffect();
    box.drawEffect();
    if (mousePressed) {
      bubbles.play(); //Audio should play on mouse click
    }
    else {
      bubbles.pause();
    }
  }
