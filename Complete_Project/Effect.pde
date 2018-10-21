// BASE CODE

abstract class Effect{
  int id;
  float offset;
  float effectWidth;
  boolean isActive = false;
  Sample sample = null;
  SamplePlayer sound = null;
  Gain volume;
  
  public Effect(String soundFile, int id, float offset, float effectWidth) throws IOException {
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
  }
  
  public void drawThis(){
    pushMatrix();
    drawEffect();
    popMatrix();
    if (isActive) {
      fill(0);
      rect(offset, 0, effectWidth, effectWidth);
      fill(255);
    } else {
      fill(0);
    }
    text(key + "", (key == 0 ? 900 : (key - 1) * 100) + 50, 50);
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
