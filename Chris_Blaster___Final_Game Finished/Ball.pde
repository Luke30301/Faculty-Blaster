class Ball {
  
  /////////////////////////////
  //Variables
  /////////////////////////////
  
  int x;
  int y;
  int d;
  int chrisColor;
  int zaneColor;

  int xSpeed;
  int ySpeed;
  
  //////////////////////////////
  //Constructor
  //Intitalizes all my Vars.
  /////////////////////////////
  //Ball(int startingX, int startingY){
  //  x = startingX;
  //  y = startingY;
  //  d = 100;
  //  aColor = color(#19E581);
    
  //  xSpeed = 10;
  //  ySpeed = 10;
  //}
  
    Ball( int ballY, int ballD, int ballC){
    x = int(random(0, width));
    y = ballY;
    d = ballD;
    chrisColor = ballC;
    
    xSpeed = 5;
    ySpeed = 5;
    
    
    ////Reroll X and Y speed until its nonzero
    //while (xSpeed == 0){
    // xSpeed = int(random(-10,10)); 
    //}
    //while (ySpeed == 0){
    // ySpeed = int(random(-10,10)); 
    //}
  }
 /////////////////////////////
  //Functions
  ///////////////////////////// 
 void render(){
   fill(chrisColor);
  circle(x,y,d); 
 }
     /*
This function takes updates the position the ball according to its speed.
   */
  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  /*
This function checks if the ball is touching an edge. If it is, the speed flips
   */
  void wallDetect() {
    // detects wall detection for the right wall
    if (x+d/2 >= width) {
      xSpeed = -abs(xSpeed);
    }
    // wall detection for left wall
    if (x-d/2 <= 0) {
      xSpeed = abs(xSpeed);
    }

    // wall detection for the bottom wall
    if (y+d/2 >= height) {
       
    }
    // wall detection for left wall
    if (y-d/2 <= 0) {
      ySpeed = abs(ySpeed);
    }
  }
  void playerCollision(Player player){
   if (x + d / 2> player.pX - player.pW / 2 &&
      x - d / 2 < player.pX + player.pW / 2 &&
      y + d / 2 > player.pY - player.pH / 2 &&
      y - d / 2 < player.pY + player.pH / 2) {
        
       ySpeed = -abs(ySpeed);
       bing.play();
       }
  }
       
  void headCollision(Head head){
   if  (x + d / 2 > head.hX - head.hD / 2 &&
        x - d / 2 < head.hX + head.hD / 2 &&
        y + d / 2 > head.hY - head.hD / 2 &&
        y - d / 2 < head.hY + head.hD / 2) {
       head.destroy = false;
       //ySpeed = -abs(ySpeed);
       }
  }
}
