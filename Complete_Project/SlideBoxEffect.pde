// INDIVIDUAL SUBMISSION - SLIDING BOX EFFECT WITH AUDIO
// By Jonathan Mifsud 13209465

// Sliding Box effect will trigger when user enters keypad button '9'.
// Sound and animation will be executed on user interaction.

enum StateSB {
  RISE,
  FALL,
}
class SlideBoxEffect extends Effect {
  StateSB stateRSB = StateSB.RISE;
  StateSB stateFSB = StateSB.FALL;
  StateSB state = StateSB.RISE;
  float xs;
  float ys;
  color cs;
  float ss;
  public SlideBoxEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{ 
    super(soundFile, id, offset, effectWidth);
    xs = 550;
    ys = 250;
    cs = color(255, 0, 255);
    ss = 0.5; // Speed of box movement
  }
  public void drawEffect() {
    //clear(); //Removes trail but also accidently removes bubble animation.
    fill(cs);
    rect(xs, ys, 100, 100);
    if (isActive) {
      stateRSB = StateSB.RISE; //If key is pressed, box rises
    }
    else {
      stateFSB = StateSB.FALL; //If key is not pressed, box falls
    }
    switch(state) {
      case RISE: 
        ys = ys - ss; // Position of box goes up
        if (ys > height) {
          ys = 0;
        }
        break;
      case FALL:
        ys = ys + ss; // Position of box goes down
        if (ys > height) {
          ys = 0;
        }
        break;
    }
  }
  
}
