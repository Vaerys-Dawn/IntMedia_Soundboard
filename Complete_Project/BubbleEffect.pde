// INDIVIDUAL SUBMISSION - BUBBLE EFFECT WITH AUDIO 
// By Jonathan Mifsud 13209465

// Bubble effect will trigger when user enters keypad button '6'.
// Sound and animation will be executed on user interaction.

// Current Issue: 
// Effects seem to rely on each other, thus replicating the same effect.
// Need to consult group to multiply bubbles into an array and remove trail using clear().

enum StateBU {
  RISE,
  FALL,
  DRAW_BUBBLES
}
class BubbleEffect extends Effect {
  StateBU stateR = StateBU.RISE;
  StateBU stateF = StateBU.FALL;
  StateBU stateDB = StateBU.DRAW_BUBBLES;
  StateBU state = StateBU.RISE;
  float x;
  float y;
  float sp;
  float sz;
  color c;
  public BubbleEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{ 
    super(soundFile, id, offset, effectWidth, red, green, blue);
    x = random(100, 300);
    y = random(100, 700);
    sp = random(0.8, 4); // Speed of bubbles
    sz = random(10, 80); // Size of bubbles
    c = color(#00FFFF);
  }
  //EFFECT
  public void drawEffect() {
    if (isActive) {
      stateR = StateBU.RISE; //If key is pressed, bubbles go up
    }
    else {
      stateF = StateBU.FALL; //If key is not pressed, bubbles go down
    }
    switch(state) {
      case RISE:
        y = y - sp; // Bubbles go up
        if (y < 0) {
          y = random(100, 700); //original position
          c = color(#00FFFF); //original colour
        }
        break;
      case FALL:
        y = y + sp; // bubbles go down
        if (y > 700); {
          y = random(-100, -50); //reset position
          c = color(#00FFFF); //original colour
        }
        break;
    }

    noStroke();
    ellipseMode(CENTER);
    fill(c); //cyan
    ellipse(x,y,sz,sz); //Bubble's coordinates and size
  }
}
