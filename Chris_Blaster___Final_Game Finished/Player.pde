class Player{
  
  //Player Stuff
 int pX;
 int pY;
 int pC;
 int pW;
 int pH;
 int playerSpeed;
 
 //Player Move
 boolean pLeft = false;
 boolean pRight = false;
  
//////////////////////////////////////////////////////////////////  
  //Constructor
  Player(int x, int y, int w, int h, int c){
  rectMode(CENTER);
    
  pX = x;
  pY = y;
  pC = c;
  pW = w;
  pH = h;
  playerSpeed = 15;
  }
////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////
  void render(){
    fill(pC);
    rect(pX,pY,pW,pH);
  }
    
    void move(){
        if (pLeft && pX - pW / 2 > 0){ 
  pX -= playerSpeed;
  }
  if (pRight && pX + pW / 2 < width){
  pX += playerSpeed;
  }
    }

}
