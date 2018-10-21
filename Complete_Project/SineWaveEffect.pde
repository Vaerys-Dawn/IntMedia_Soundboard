class SineWaveEffect extends Effect {
    
  public SineWaveEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{
    super(soundFile, id, offset, effectWidth);
  }
  
  public void drawEffect(){  
    background(0);
    fill(color_1);
    posY = 200;
    WaveSpeed = 0.001;
    rotate(HALF_PI);
    translate(0, -width);

    for (int i = 1; i<width; i+=step) {
      temps += (millis()%i)*WaveSpeed;
      variationY = sin(((i-startX)+temps)*completeCycle);
      variationY*=amplitude;
      ellipse(i, (posY+variationY), 5, 5);
    }  
 }
}
