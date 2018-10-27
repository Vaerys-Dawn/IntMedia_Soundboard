// INDIVIDUAL SUBMISSION - SLIDING BOX EFFECT WITH AUDIO
// By Jonathan Mifsud 13209465

// Sliding Box effect will trigger when user enters keypad button '9'.
// Sound and animation will be executed on user interaction.

class SlideBoxEffect extends Effect {
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
    if (keyPressed && key == '9') {
      upeffect();
    }
    else {
      downeffect();
    }
    fill(cs);
    rect(xs, ys, 100, 100);
  }
  public void upeffect() {
    ys = ys - ss; // Position of box goes up
    if (ys > height  || ys < 0) {
        ys = 0;
      }
  }
  public void downeffect() {
   ys = ys + ss;
   if (ys < height  || ys < 0) {
        ys = 250;
      } 
  }
  /*@Override
  public void pause() {
    isActive = false;
    volume.setGain(0);
    ys = ys + ss; // Position of box goes up
    if (ys > height  || ys < 0) {
        ys = 250;
      }
  }*/
}
