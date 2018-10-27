class ZigZagEffect extends Effect{

public ZigZagEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
  super(soundFile, id, offset, effectWidth, red, green, blue);
}
  //values for initial position of ball
  float ballx = 0;
  float bally = height;
  //change to adjust direction, speed
  float moveballx = -10;
  float movebally = -10;

  public void drawEffect(){
    translate(offset, 0);
    fill(255, 255, 51);
    if(isActive){
      ellipse(ballx, bally, 15, 15);
    }
 
    ballx += moveballx;
    bally += movebally;
    
    if(ballx > effectWidth){
      //ballx = effectWidth;
      moveballx = -moveballx;
    } 
    if(bally > height-effectWidth){
      bally = height-effectWidth;
      movebally = -movebally;
    } 
    if(ballx < 0){
      //ballx = 0;
      moveballx = -moveballx;
    } 
    if(bally < 0){
      bally = 0;
      movebally = -movebally;
    } 
  }
  
  @Override
  public void play() {
    isActive = true;
    volume.setGain(0.05f);
  }
  
}
