// BASE CODE

abstract class Effect{
  int id;
  float offset;
  float effectWidth;
  boolean isActive = false;
  Sample sample = null;
  SamplePlayer sound = null;
  Gain volume;
  int red;
  int green;
  int blue;
  
  public Effect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException {
    this.id = id;
    this.offset = offset;
    this.effectWidth = effectWidth;
    volume = new Gain(context, 1, 0.1f);
    volume.setGain(0);
    mainVolume.addInput(volume);
    if(!dataFile(soundFile).exists()) return;
    sample = new Sample(dataPath(soundFile));
    sound = new SamplePlayer(context, sample);
    sound.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    volume.addInput(sound);
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  
  public void drawThis(){
    pushMatrix();
    drawEffect();
    popMatrix();
    noStroke();
    fill(100);
    rect(offset, height-effectWidth, effectWidth, effectWidth);
    
    if (isActive) {
      fill(red, green, blue);
    } else {
      fill(200);
    }
    text(id + "", offset + 50, height-effectWidth+50);
  }
  
  abstract void drawEffect();
  
  public void play() {
    isActive = true;
    volume.setGain(0.5f);
  }

    public void pause() {
    isActive = false;
    volume.setGain(0);
  }
}
