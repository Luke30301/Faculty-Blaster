class Button{
   
  //Vars.
  
int ButtonSize; 
int ButtonX; 
int ButtonY; 
int ButtonC;

boolean ButtonPressed; 
 ////////////////////////////////////////////////////////////////// 
  //Constructor
  Button (int x, int y, int s, int c){
    rectMode(CENTER);
  
  ButtonSize = s; 
  ButtonX = x; 
  ButtonY = y; 
  ButtonC = c;

  }
  //////////////////////////////////////////////////////////////////////

 ///////////////////////////////////////////////////////////////////// 
  void render(){
    fill(ButtonC);
    rect(ButtonX, ButtonY, ButtonSize, ButtonSize);
  }
////////////////////////////////////////////////////////////////////////
//void ButtonP(){
// ButtonPressed = mousePressed && isInButton();
//}
///////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
//Hitbox function
boolean isInButton(){
  //hitBox 
  rectMode(CENTER);
  int top = ButtonY - ButtonSize/2;
  int bottom = ButtonY + ButtonSize/2;
  int left = ButtonX - ButtonSize/4; 
  int right = ButtonX + ButtonSize/4;
  
  if (mouseX > left &&
      mouseX < right &&
      mouseY > top &&
      mouseY < bottom){
    return (true);
  }
  else {
   return (false); 
  }
}

  
  
 
}
