class SineWaveEffect extends Effect {
  
  float posX;
  float posY;
  float amplitude = 40;
  float variationY;
  float temps = 0;
  float WaveSpeed;
  float completeCycle;
  float subCycle;
  int startX = 100;
  int endX = 500;
  int step = 10; 
  int distanceX;
  color color_1 = color(200, 100, 0);
  
  public SineWaveEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{
    super(soundFile, id, offset, effectWidth);
  }
  
  public void drawEffect(){
    noStroke();
    smooth();
    //translate(0, offset);
    distanceX = endX-startX;
    completeCycle = TWO_PI/float(distanceX);
    subCycle = (TWO_PI*5)/float(distanceX);
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
