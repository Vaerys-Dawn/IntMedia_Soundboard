class ShatterEffect extends Effect {
  
  float x = width - width;
  float y = height - height;
  float w = 150;
  float spdX = 5.0f, spdY = 5.0f, rotSpd = PI/150;  
  float theta;

  public ShatterEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
    super(soundFile, id, offset, effectWidth, red, green, blue);
  }
  
  
  public void drawEffect(){ 
    if(key == '0'){
      drawTriangles();
    }
  }
  
  void drawTriangles() {
  translate(offset, 0);
  fill(200, 0, 200);
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
