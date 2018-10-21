private class BallObject extends ShapeObject {

  int alpha = 0;
  int posStart;
  boolean soundAdded;
  SamplePlayer player;
  Gain volume;
  AudioContext context;
  Sample sound;

  public BallObject(Effect effect, int position, Gain volume, AudioContext context, Sample sound) {
    super(-100, -40, 40, 40, height - 60);
    this.effect = effect;
    this.posStart = position;
    this.volume = volume; 
    this.context = context;
    this.sound = sound;
    volume.setGain(0.1);
    state = State.BALL_RESET;
  }

  public void drawObject() {
    switch (state) {
      case BALL_INITIAL_DROP:
        if (posY >= jumpHeight) {
          state = State.BALL_SQUISH;
        } else {
          if (objHeight < startHeight + (startHeight / 2)) {
            objHeight += speed;
          } else {
            objHeight = startHeight + (startHeight / 2);
          }
          if (objWidth > startWidth / 2) {
            objWidth -= speed;
          } else {
            objWidth = startWidth / 2;
          }
          posY += speed;
        }
        break;
      case BALL_SQUISH:
        boolean reachedWidth = objWidth >= (startWidth + (startWidth / 2));
        boolean reachedHeight = objHeight <= startHeight / 2;
        if (!soundAdded) {
          player = new SamplePlayer(context, sound);
          player.setKillOnEnd(true);
          volume.addInput(player);
          soundAdded = true;
        }
        if (reachedHeight && reachedWidth) {
          state = State.BALL_BOUNCE_1;
        } else {
          if (!reachedHeight) {
            objHeight -= speed / 2;
          }
          if (!reachedWidth) {
            objWidth += speed / 2;
          }
          posY += speed / 2;
        }
        break;
      case BALL_BOUNCE_1:
        if (posY <= -startHeight) {
          state = State.BALL_RESET;
        } else {
          if (objHeight < startHeight + (startHeight / 2)) {
            objHeight += speed;
          } else {
            objHeight = startHeight + (startHeight / 2);
          }
          if (objWidth > startWidth / 2) {
            objWidth -= speed;
          } else {
            objWidth = startWidth / 2;
          }
          posY -= speed * 0.75;
          alpha -= speed * 0.5;
        }
        break;
      case BALL_RESET:
        posX = random.nextInt((int) effect.effectWidth);
        posY = -posStart * (height / 10) - 60;
        soundAdded = false;
        speed = 15;
        alpha = 255;
        volume.removeAllConnections(player);
        if (effect.isActive) {
          state = State.BALL_INITIAL_DROP;
        }
        break;
    }
    fill(150, 50, 255, alpha);
    ellipse(posX, posY, objWidth, objHeight);
  }
}
