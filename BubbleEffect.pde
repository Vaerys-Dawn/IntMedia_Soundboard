// INDIVIDUAL SUBMISSION - BUBBLE EFFECT WITH AUDIO 
// By Jonathan Mifsud 13209465

// Bubble effect will trigger when user enters keypad button '6'.
// Sound and animation will be executed on user interaction.

// Current Issue: 
// Effects seem to rely on each other, thus replicating the same effect.
// Need to consult group to multiply bubbles into an array and remove trail using clear().

class BubbleEffect extends Effect {
  float x;
  float y;
  float sp;
  float sz;
  color c;
  public BubbleEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{ 
    super(soundFile, id, offset, effectWidth);
    x = random(100, 300);
    y = random(100, 700);
    sp = random(0.8, 4); // Speed of bubbles
    sz = random(10, 80); // Size of bubbles
    c = color(#00FFFF);
  }
  //EFFECT
  public void drawEffect() {
    //clear()
    if (isActive) {
      y = y - sp; // Bubbles go up
        if (y < 0 || y > height) {
          y = random(100, 700); //original position
          c = color(#00FFFF); //original colour
        }
    }
    else {
      y = y + sp; // bubbles go down
        if (y > height); {
          y = random(-100, -50); //reset position
          c = color(#00FFFF); //original colour
        }
    }
    background(0);
    noStroke();
    ellipseMode(CENTER);
    fill(c); //cyan
    ellipse(x,y,sz,sz); //Bubble's coordinates and size
  }
}
