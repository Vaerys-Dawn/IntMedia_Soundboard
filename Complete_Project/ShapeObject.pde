private class ShapeObject {
    float startHeight;
    float startWidth;
    float posX;
    float posY;
    float objHeight;
    float objWidth;
    float jumpHeight;

    State state;
    int speed = 0;
    Effect effect;

    public ShapeObject(float posX, float posY, float objHeight, float objHidth, float jumpHeight) {
      this.posX = posX;
      this.posY = posY;
      this.objHeight = objHeight;
      this.objWidth = objHidth;
      this.startHeight = objHeight;
      this.startWidth = objHidth;
      this.jumpHeight = jumpHeight;
    }
}
