public class KeyObject {
    SamplePlayer player;
    int key;
    boolean isActive = false;

    Gain objectGain;

    public KeyObject(int key, float pitch) {
        this.key = key;
        this.player = new SamplePlayer(context, sample);
        objectGain = new Gain(context, 1, 0.1f);
        player.setPitch(new Glide(context, pitch));
        player.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
        objectGain.setGain(0);
        objectGain.addInput(player);
        gain.addInput(objectGain);
    }

    public void drawObject() {
        if (isActive) {
            fill(0);
            rect(key == 0 ? 900 : (key - 1) * 100, 0, 100, 100);
            fill(255);
        } else {
            fill(0);
        }
        text(key + "", (key == 0 ? 900 : (key - 1) * 100) + 50, 50);
    }

    public void play() {
        isActive = true;
        objectGain.setGain(0.5f);
    }

    public void pause() {
        isActive = false;
        objectGain.setGain(0);
    }
    
    public void checkPressed(float position, boolean isPressed){
        int start = (key == 0 ? 900 : (key - 1) * 100);
        int end = (key == 0 ? 900 : (key - 1) * 100) + 100;
        if (position >= start && position <= end && isPressed) play();
        else if (isPressed && (position <= start || position >= end)) pause();
    }
}
