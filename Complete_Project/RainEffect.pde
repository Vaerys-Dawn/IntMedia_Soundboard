class RainEffect extends Effect {

    List<DropletObject> droplets = new LinkedList<DropletObject>();

    public RainEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException {
        super(soundFile, id, offset, effectWidth, red, green, blue);
        for (int i = 0; i < 50; i++) {
            droplets.add(new DropletObject(this));
        }
    }

    public void drawEffect() {
        fill(0, 50, 255);
        translate(offset, 0);
        boolean isOff = true;
        for (DropletObject d : droplets) {
            d.drawObject();
            if (d.state != State.RAIN_RESET) isOff = false;
        }
        if (isOff) volume.setGain(0);
    }

    @Override
    public void pause() {
        isActive = false;
    }
}
