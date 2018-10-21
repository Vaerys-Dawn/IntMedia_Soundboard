class BallEffect extends Effect { //<>//
  
  List<BallObject> balls = new LinkedList<BallObject>();

  public BallEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException {
    super(soundFile, id, offset, effectWidth, red, green, blue);
    for (int i = 0; i < 10; i++) {
      balls.add(new BallObject(this, i+1, volume, context, sample, effectWidth));
    }
    volume.removeAllConnections(sound);
  }

  public void drawEffect() {
    translate(offset, 0);
    boolean isOff = true;
    for (BallObject b : balls) {
      b.drawObject();
      if (b.state != State.RAIN_RESET) isOff = false;
    }
    if (isOff) volume.setGain(0);
  }
  
  @Override
  public void pause() {
    isActive = false;
  }
}
