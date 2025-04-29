class Head{
  
  int hX;
  int hY;
  int hD;
  //int hC;
  PImage headImage;
  
  int xSpeed;
  int ySpeed;
  boolean destroy = true;
  
  //Constructor -- int headC,
    Head(int headD, PImage img){
      
    hX = int(random(0, width));
    hY = int(random(0,height));
    hD = headD;
    headImage = img;
    
    //float zaneHeadScale = .5;
    headImage.resize(hD, hD);
    //hC = headC;
    
   
    
    xSpeed = 2;
    ySpeed = 2;
    
    
    ////Reroll X and Y speed until its nonzero
    //while (xSpeed == 0){
    // xSpeed = int(random(-10,10)); 
    //}
    //while (ySpeed == 0){
    // ySpeed = int(random(-10,10)); 
    //}
  }
  void render(){
    if (destroy) {
   //fill(hC);
   imageMode(CENTER);
  //circle(hX,hY,hD); 
  image(headImage, hX, hY);
    }
 }
     /*
This function takes updates the position the ball according to its speed.
   */
  void move() {
    hX += xSpeed;
    hY += ySpeed;
  }

  /*
This function checks if the ball is touching an edge. If it is, the speed flips
   */
  void wallDetect() {
    // detects wall detection for the right wall
    if (hX+hD/2 >= width) {
      xSpeed = -abs(xSpeed);
    }
    // wall detection for left wall
    if (hX-hD/2 <= 0) {
      xSpeed = abs(xSpeed);
    }

    // wall detection for the bottom wall
    if (hY+hD/2 >= height) {
       ySpeed = -abs(xSpeed);
    }
    // wall detection for left wall
    if (hY-hD/2 <= 0) {
      ySpeed = abs(ySpeed);
    }
  }
  
  void destroyed(){
   destroy = false; 
  }
  
  
  
  
}
