class ShatterEffect extends Effect {
  
  float x = width - width;
  float y = height - height;
  float w = 150;
  float spdX = 4.0f, spdY = 4.0f, rotSpd = PI/150;  
  float theta;
  
  boolean soundAdded;
  SamplePlayer player;
  AudioContext context;
  Sample sound;
  
  String soundFile;
  SoundFile file;

  public ShatterEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
    super(soundFile, id, offset, effectWidth, red, green, blue);
    this.soundFile = soundFile;
  }
  
  
  public void drawEffect(){ 
    if(keyPressed && key == '0'){
      drawTriangles();           
          
    }
  }
  
  public void pause() {
    isActive = false;
    volume.setGain(0);
    x = width - width;
    y = height- height;
    spdX = 4.0f;
    spdY = 4.0f;
    rotSpd = PI/150;
    theta = 0;
  }
  
  void drawTriangles() {
  if (!soundAdded) {
    player = new SamplePlayer(context, sample);
    player.setKillOnEnd(true);
    volume.addInput(player);
    soundAdded = true;
  }
  x += spdX;
  y += spdY;
  theta += rotSpd;
  translate(offset, 0);
  fill(200, 0, 200);
  pushMatrix();
  translate(x, -y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 0);
  vertex(100, 0);
  vertex(100, 50);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, -y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 0);
  vertex(100, 50);
  vertex(0, 100);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, 0);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(100, 50);
  vertex(100, 150);
  vertex(0, 100);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, -y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 100);
  vertex(100, 150);
  vertex(0, 200);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, -y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 200);
  vertex(100, 150);
  vertex(100, 250);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(100, 250);
  vertex(0, 200);
  vertex(0, 300);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, 0);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 300);
  vertex(100, 350);
  vertex(100, 250);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, 0);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 400);
  vertex(100, 350);
  vertex(0, 300);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  //rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 400);
  vertex(100, 450);
  vertex(100, 350);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, -y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 400);
  vertex(0, 500);
  vertex(100, 450);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(100, 550);
  vertex(0, 500);
  vertex(100, 450);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 500);
  vertex(0, 600);
  vertex(100, 550);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(100, 650);
  vertex(0, 600);
  vertex(100, 550);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 700);
  vertex(100, 650);
  vertex(0, 600);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(100, 750);
  vertex(0, 700);
  vertex(100, 650);
  endShape();
  popMatrix();

  }
}
