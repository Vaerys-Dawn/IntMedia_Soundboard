

class shatterEffect extends Effect {
  public shatterEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{
    super(soundFile, id, offset, effectWidth);
  }
  
  public void drawEffect(){
  
  fill(200, 0, 200);
  background(0);
  pushMatrix();
  translate(-x, -y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 0);
  vertex(300, 0);
  vertex(0, 50);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, -y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 50);
  vertex(300, 0);
  vertex(300, 100);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, 0);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(300, 100);
  vertex(0, 50);
  vertex(0, 150);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, 0);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 150);
  vertex(300, 200);
  vertex(300, 100);
  endShape();
  popMatrix();
  pushMatrix();
  translate(-x, 0);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 150);
  vertex(300, 200);
  vertex(0, 250);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(-theta);
  beginShape(TRIANGLES);
  vertex(0, 250);
  vertex(300, 200);
  vertex(300, 300);
  endShape();
  popMatrix();
  pushMatrix();
  translate(x, y);
  rotate(theta);
  beginShape(TRIANGLES);
  vertex(0, 300);
  vertex(0, 250);
  vertex(300, 300);
  endShape();
  popMatrix();
  x += spdX;
  y += spdY;
  theta += rotSpd;
  }
}
