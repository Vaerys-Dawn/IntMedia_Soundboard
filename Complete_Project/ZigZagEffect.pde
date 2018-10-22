class ZigZagEffect extends Effect{

public ZigZagEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
  super(soundFile, id, offset, effectWidth, red, green, blue);
}
  //values for initial position of ball
  float ballx = 0;
  float bally = height;
  //change to adjust direction, speed
  float moveballx = 0.5;
  float movebally = -10;

  public void drawEffect(){
    translate(offset, 0);
    fill(255, 255, 51);
    if(isActive){
      ellipse(ballx, bally, 30, 30);
    }
    ballx = ballx + moveballx;
    bally = bally + movebally;
    
    if(ballx > effectWidth){
      ballx = 0;
      moveballx = -moveballx;
    } 
    if(bally > height){
      bally = height;
      movebally = -movebally;
    } 
    if(ballx < 0){
      ballx = effectWidth;
      moveballx = -moveballx;
    } 
    if(bally < height){
      bally = 0;
      movebally = -movebally;
    } 
  }
}
