abstract class Effect{
  int id;
  float offset;
  float effectWidth;
  boolean isActive = false;
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
    sound = new SamplePlayer(context, new Sample(dataPath(soundFile)));
    sound.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    volume.addInput(sound);
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
