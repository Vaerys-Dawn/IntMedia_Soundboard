import processing.sound.*;
import beads.*;
import org.jaudiolibs.beads.*;
import java.awt.*;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.LinkedList;
import java.util.Random;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.*;

  AudioContext context = new AudioContext();
  Gain mainVolume;
  Map<Integer, Effect> effects = new HashMap<Integer, Effect>();
  Random random = new Random();
  boolean recording = false;
  boolean playback = false;
  List<String> playBackList = new LinkedList();
    
  public void settings() {
    size(1000, 800);
  }

  //bouncy ball sound recieved from here: http://soundbible.com/1626-Ball-Bounce.html

  public void setup() {
    mainVolume = new Gain(context, 1, 1f);
    context.out.addInput(mainVolume);
    context.start();
    float effectWidth = width/10;
    float increment = 0;
    textSize(32);
    try {        
      effects.put(49, new FlameEffect("fire.mp3", 1, 0, effectWidth, 255, 51, 51));                                   // 1
      effects.put(50, new SineWaveEffect("sinewave.mp3", 2, increment += effectWidth, effectWidth, 200, 100, 0));     // 2
      effects.put(51, new ZigZagEffect("square.mp3", 3, increment += effectWidth, effectWidth, 255, 255, 51));       // 3
      effects.put(52, new ParticleEffect("wind.mp3", 4, increment += effectWidth, effectWidth, 22,187,62));           // 4
      effects.put(53, new ParticleEffect("wind.mp3", 5, increment += effectWidth, effectWidth, 22,187,62));           // 5
      effects.put(54, new BubbleEffect("bubble.mp3", 6, increment += effectWidth, effectWidth, 0, 255, 255));        // 6
      effects.put(55, new RainEffect("rain.mp3", 7, increment += effectWidth, effectWidth, 0, 50, 255));              // 7
      effects.put(56, new BallEffect("ball.mp3", 8, increment += effectWidth, effectWidth, 150, 50, 255));            // 8
      effects.put(57, new SlideBoxEffect("slide.mp3",9, increment += effectWidth, effectWidth, 255, 0, 255));         // 9
      effects.put(48, new ShatterEffect("shatter.mp3", 0, increment += effectWidth, effectWidth, 200, 0, 200));     // 0
    } catch (IOException e) {}
  }

  public void draw() {
    clear();
    background(0);
    String record = "";
    if (playback) {
      int start = 48;
      if (playBackList.size() == 0) {
        playback = false;
        return;
      }
      for (String s: playBackList.get(0).split("")){
        Effect object = effects.get(start);
        if (object == null) {
          break;
        }
        if (s.equals("1")) object.play();
        else if (s.equals("0")) object.pause();
        start++;
      }
      playBackList.remove(0);
      for (Map.Entry<Integer, Effect> e : effects.entrySet()) {
        e.getValue().drawThis();
      }
      fill(0,255,0);
      triangle(20, height-20, 20, height-40, 40, height-30);
    }else {
      for (Map.Entry<Integer, Effect> e : effects.entrySet()) {
        e.getValue().drawThis();
        record += e.getValue().isActive ? "1" : "0";
      }
      record += "\r\n";
      if (recording) {
        fill(255,0,0);
        ellipse(20, height-40, 20,20);
        writeToFile("sound.txt",record,false);
      }
    }
  }

  public void keyPressed() {
    Effect object = effects.get(keyCode);
    if (object != null) object.play();
    if (key == 'r') recording = !recording;
    if (key == 'c') writeToFile("sound.txt","",true);
    if (key == 'p') {
      playback = !playback;
      if (playback) playBackList = readFromFile("sound.txt");
      else {
        for (Map.Entry<Integer, Effect> e : effects.entrySet()) {
          e.getValue().pause();
        }
      }
    }
  }
  

  public void keyReleased() {
    Effect object = effects.get(keyCode);
    if (object != null) object.pause();
  }
  
  public void writeToFile(String file, String text, boolean overwrite) {
    file = dataPath(file);
    try {
      if (!Files.exists(Paths.get(file))) {
        Files.createFile(Paths.get(file));
      }
      if (overwrite) {
        FileWriter fileWriter = new FileWriter(file, false);
        fileWriter.write(text);
        fileWriter.flush();
        fileWriter.close();
      } else {
        FileWriter fileWriter = new FileWriter(file, true);
        fileWriter.append("\n" + text);
        fileWriter.flush();
        fileWriter.close();
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public List<String> readFromFile(String file) {
    file = dataPath(file);
    try {
      if (!Paths.get(file).toFile().exists()) {
        Files.createFile(Paths.get(file));
      }
      List<String> fileContents;
      fileContents = Files.readAllLines(Paths.get(file));
      return fileContents;
    } catch (IOException e) {
      return null;
    }
  }
  
