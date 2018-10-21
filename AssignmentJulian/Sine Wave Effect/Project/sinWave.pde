float posX, posY, amplitude = 40, variationY, temps = 0, WaveSpeed, completeCycle, subCycle;
int startX = 100, endX = 500, step=10, distanceX;
color color_1 = color(200, 100, 0);
SoundFile sound;

    
class sinWave extends Effect {
  public sinWave(String soundFile, int id, float offset, float effectWidth) throws IOException{
    super(soundFile, id, offset, effectWidth);
    
  }
  public void drawEffect(){ 
  
  background(0);
  noStroke();
  smooth();
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
