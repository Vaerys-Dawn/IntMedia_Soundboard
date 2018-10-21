class DropletObject extends ShapeObject {

  public DropletObject(Effect effect) {
    super(-100, -100, 20, 20, (float) ((height- effect.effectWidth) * 0.8 + random.nextInt((int) (height * 0.1)) ));
    this.effect = effect;
    state = State.RAIN_RESET;
  }

  public void drawObject() {
    switch (state) {
      case RAIN_FALL:
        if (posY >= jumpHeight) {
          state = State.RAIN_HIT;
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
      case RAIN_HIT:
        boolean reachedWidth = objWidth >= (startWidth + (startWidth / 2));
        boolean reachedHeight = objHeight <= startHeight / 2;
        if (reachedHeight && reachedWidth) {
          state = State.RAIN_RESET;
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
      case RAIN_RESET:
        posX = random.nextInt((int) effect.effectWidth);
        posY = -random.nextInt(height) - 40;
        speed = random.nextInt(10) + 15;
        if (effect.isActive) {
          state = State.RAIN_FALL;
        }
        break;
    }
    ellipse(posX, posY, objWidth, objHeight);
  }
}
