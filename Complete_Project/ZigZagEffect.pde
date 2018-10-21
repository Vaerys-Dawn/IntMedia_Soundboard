class ZigZagEffect extends Effect{

public ZigZagEffect(String soundFile, int id, float offset, float effectWidth) throws IOException{
  super(soundFile, id, offset, effectWidth);
}
//values for initial position of ball
float ballx = 0;
float bally = height;
//change to adjust direction, speed
float moveballx = 55.5;
float movebally = -10;

public void drawEffect(){
  translate(offset, 0);
fill(255, 255, 51);
  if(isActive){ ellipse(ballx, bally, 30, 30);}
   ballx = ballx + moveballx;
   bally = bally + movebally;
   
   if(ballx > 800){
   ballx = 800;
   moveballx = -moveballx;
   } 
   if(bally > height){
   bally = height;
   movebally = -movebally;
   } 
   if(ballx < 400){
   ballx = 400;
   moveballx = -moveballx;
   } 
   if(bally < 0){
   bally = 0;
   movebally = -movebally;
   } 
}
}
