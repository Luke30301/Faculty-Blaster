Ball Zball;
Ball Cball;
Player zane;
Player chris;

Button startButton;
Button howToPlayButton;
Button goodluckButton;
Button crashButton;
//head 1-5 = Zane - head 5-10 = Chris

Head head1;
Head head2;
Head head3;
Head head4;
Head head5;

Head head6;
Head head7;
Head head8;
Head head9;
Head head10;

import processing.sound.*;
SoundFile background;
SoundFile bing;

PImage Purp;
PImage rainbow;
PImage chrisHead;
PImage zaneHead;


int zaneScore = 0;
int chrisScore = 0;

// trqack and tracks when to add balls 
int zanePoints = 0;
int chrisPoints = 0;

// Track chnage rounds
int zaneRound = 1;
int chrisRound = 1;

int state;

ArrayList <Head> chrisHeadList;
ArrayList <Head> zaneHeadList;

boolean zaneInverted = false;
boolean chrisInverted = false;
//////////////////////////////////////////////////////////////////////
void setup() {
  
  //Image Settings
  imageMode(CENTER);
  
  
  zaneHead = loadImage("Zane Head.png");
  chrisHead = loadImage("Chris Head.png");

    
  background = new SoundFile(this, "background.mp3");
  bing = new SoundFile(this, "bing.wav");
  
  Purp = loadImage("Purp.jpg");
  Purp.resize(width,height);
  rainbow = loadImage("rainbow.jpg");
  rainbow.resize(width,height);
  
  chrisHeadList = new ArrayList<Head>();
  zaneHeadList = new ArrayList<Head>();

  // add a head to the list
  for (int headCount = 0; headCount < 5; headCount++ ) {
    zaneHeadList.add(new Head(75, zaneHead));
  }
  for (int headCount = 0; headCount < 5; headCount++ ) {
    chrisHeadList.add(new Head(75, chrisHead));
  }


  //Zane
  zane = new Player(1200, height - 50, 100, 20, color(#FF03C0));
  Zball = new Ball(100 ,50, color(#C498B9));
  //Chris
  chris = new Player(400, height - 50, 100, 20, color(#03E8FF));
  Cball = new Ball(100, 50, color(#1429DE));
  
  startButton = new Button(width/2, height/2, 200, color(#3300FF));
  howToPlayButton = new Button(width/2, height/2 + 300, 200, color(#4B0082));
  crashButton = new Button(width / 2 + 250, height / 2 + 150, 200, color(#191970));
  goodluckButton = new Button(width / 2 - 250, height / 2 + 150, 200, color(#8B008B));

  

  

  
}
//////////////////////////////////////////////////////////////////////////////////////
void draw() {
  background(0);
  
  if(!background.isPlaying()){
   background.play(); 
  }

  levelHandler();
  

}
/////////////////////////////////////////////////////////////////////
void settings(){
 fullScreen(); 
 
 //size(1600,1000);
}

//////////////////////////////////////////////////////////////////////
void keyPressed() {
  if ((key == 'a' && !zaneInverted) || (key == 'd' && zaneInverted)) {
    zane.pLeft = true;
  }
  if ((key == 'd' && !zaneInverted) || (key == 'a' && zaneInverted)) {
    zane.pRight = true;
  }
  if ((key == 'j' && !chrisInverted) || (key == 'l' && chrisInverted)) {
    chris.pLeft = true;
  }
  if ((key == 'l' && !chrisInverted) || (key == 'j' && chrisInverted)) {
    chris.pRight = true;
  }
        if (key == 'r'){
    
      //resetGame();
    state += 1; // state = state 1 or state +
    
    if (state >= 4){
     state = 0; 
    }
  }
}
//////////////////////////////////////////////////////////////////////
void keyReleased() {
  if ((key == 'a' && !zaneInverted) || (key == 'd' && zaneInverted)) {
    zane.pLeft = false;
  }
  if ((key == 'd' && !zaneInverted) || (key == 'a' && zaneInverted)) {
    zane.pRight = false;
  }
  if ((key == 'j' && !chrisInverted) || (key == 'l' && chrisInverted)) {
    chris.pLeft = false;
  }
  if ((key == 'l' && !chrisInverted) || (key == 'j' && chrisInverted)) {
    chris.pRight = false;
  }
  
  //Bacck to start
  if (key == 'b'){
   state = 0; 
   resetGame();
  }
}
/////////////////////////////////////////////////////////////////////////
void mousePressed(){
  if (state == 0 && startButton.isInButton()) {
    state = 1;  // start the game
  } 
  else if (state == 0 && howToPlayButton.isInButton()){
    state = 4;// how to play
  }
  else if (state == 0 && goodluckButton.isInButton()) {
  state = 6; // Start "Goodluck lol" mode
}
  else if (state == 0 && crashButton.isInButton()) {
  state = 7;
}
 else if (state == 7){
   state = 8; 
  }
}
/////////////////////////////////////////////////////////////////////////

void crash() {
  crash(); // Infinite recursion (stack overflow)
}
////////////////////////////////////////////////////////////////////////
void drawScoreZ() {
  fill(color(#FF03C0));
  textSize(100);
  textAlign(CENTER);
  text(zaneScore, width / 8, height / 1.1);
  
     // Levels Show
   fill(color(#FF03C0));
   textSize(40);
   textAlign(CENTER);
   text("Zane Level: " + zaneRound, width / 4, 80);

}
void drawScoreC() {
  fill(color(#03E8FF));
  textSize(100);
  textAlign(CENTER);
  text(chrisScore, width / 1.2, height / 1.1);
  
       // Levels Show
   fill(color(#03E8FF));
   textSize(40);
   textAlign(CENTER);

   text("Chris Level: " + chrisRound, 3 * width / 4, 80);
}
//////////////////////////////////////////////////////////////////////
void zaneScoreNew(Head h) {
  if (h.destroy == false) {
    zaneScore++;
    zaneHeadList.remove(h);
  }
}
//////////////////////////////////////////////////////////////////////
void chrisScoreNew(Head h) {
  if (h.destroy == false) {
    chrisScore++;
    chrisHeadList.remove(h);
  }
}
////////////////////////////////////////////////////////////////////////////
void resetGame(){
  zaneScore = 0;
  chrisScore = 0;
  zanePoints = 0;
  chrisPoints = 0;
  zaneRound = 1;
  chrisRound = 1;
  zane.pW = 100;
  chris.pW = 100;
  Zball = new Ball(100, 50, color(#C498B9));
  Cball = new Ball(100, 50, color(#1429DE));

  zaneHeadList.clear();
  chrisHeadList.clear();

  for (int i = 0; i < 5; i++) {
    zaneHeadList.add(new Head(75, zaneHead));
  }
  for (int i = 0; i < 5; i++) {
    chrisHeadList.add(new Head(75, chrisHead));
  }

  state = 0; // go back to the start screen
}
////////////////////////////////////////////////////////////////////////////////
void levelHandler(){
      //my finite state machine
 switch (state){
   // Level 1 - start screen
   case 0: 
   
   image(Purp, width/2, height/2);
   
   textFont(createFont("Consolas", 20));
   textSize(80);
   textAlign(CENTER);
   fill(0);
   text("FACULTY BLASTER", width / 2, height / 3); 
/////////////////////////////////////////////////////////////////////    
    //Start Button
  startButton.render();
  fill(0);
  textSize(40);
  text("START", width/2, height/2 + 10);
 ////////////////////////////////////////////////////////////////////////// 
  howToPlayButton.render();
  fill(0);
  textSize(30);
  text("HOW TO PLAY", width / 2, height / 2 + 310);
  /////////////////////////////////////////////////////////////////////////
  goodluckButton.render();
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("GOODLUCK LOL", width / 2 - 250, height / 2 + 160);
  //////////////////////////////////////////////////////////////////////////
  crashButton.render();
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("PRESS ME", width / 2 + 250, height / 2 + 160);
       break;
   // Level 2 - plaing the game 
   case 1:
   
      image(rainbow, width/2, height/2);
   // Show Score
   drawScoreZ();
   drawScoreC();
   

  //Zane Ball
  Zball.render();
  Zball.move();
  Zball.wallDetect();
  Zball.playerCollision(zane);
  
   //Chris Ball
  Cball.render();
  Cball.move();
  Cball.wallDetect();
  Cball.playerCollision(chris);
 
  //Player
  zane.render();
  zane.move();

  chris.render();
  chris.move();
//loop through zanes head 
  for (Head activeHead : zaneHeadList) {
    if (activeHead.destroy == true) {
      activeHead.render();
      activeHead.move();
      activeHead.wallDetect();

      Zball.headCollision(activeHead);
    }
  }
  for(int i = zaneHeadList.size()-1; i >= 0; i -= 1){
    Head activeHead = zaneHeadList.get(i);
    zaneScoreNew(activeHead);
  }

// Loop through chris head 
  for (Head activeHead : chrisHeadList) {
    if (activeHead.destroy == true) {
      activeHead.render();
      activeHead.move();
      activeHead.wallDetect();

      Cball.headCollision(activeHead);
      //chrisScoreNew(activeHead);
    }
  }
     for(int i = chrisHeadList.size()-1; i >= 0; i -= 1){
    Head currentHead = chrisHeadList.get(i); 
    chrisScoreNew(currentHead);
 
  }
/////////////////////////////////////////////////////////////Zane Levels
if (zaneHeadList.isEmpty()) {
  zaneRound++;

   if (zaneRound == 2) {
    for (int i = 0; i < 10; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 15;
    Zball.xSpeed *= 1.7;
    Zball.ySpeed *= 1.7;
  } 
  else if (zaneRound == 3) {
    for (int i = 0; i < 15; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 10;
    Zball.xSpeed *= 1.3;
    Zball.ySpeed *= 1.3;
  } 
  else if (zaneRound == 4) {
    for (int i = 0; i < 20; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 10;
    Zball.xSpeed *= 1.1;
    Zball.ySpeed *= 1.1;
  } 
  if (zaneRound == 5) {
    state = 2;  // Zane wins
  }
}
//////////////////////////////////////////////////////////////Chris Levels
  if (chrisHeadList.isEmpty()){
    chrisRound++;
    
    
  if (chrisRound == 2) {
    for (int i = 0; i < 10; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 15;
    Cball.xSpeed *= 1.7;
    Cball.ySpeed *= 1.7;
  }
 else if (chrisRound == 3) {
    for (int i = 0; i < 15; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 10;
    Cball.xSpeed *= 1.3;
    Cball.ySpeed *= 1.3;
  } 
 else if (chrisRound == 4) {
    for (int i = 0; i < 20; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 10;
    Cball.xSpeed *= 1.1;
    Cball.ySpeed *= 1.1;
  } 
  else if (chrisRound == 5) {
    state = 3; // Chris wins
    }
  if (zanePoints >= 45){
    state = 2;
  }
}
    if (chrisPoints >= 45){
    state = 3;
  }

if (Zball.y > height && Cball.y > height){
 if (zaneScore > chrisScore){
  state = 2; 
 }
 else if (chrisScore > zaneScore){
  state = 3; 
 }
 else {
  state = 5; 
 }
}
   break; 
 ////////////////////////////////////////////////////////////////
//zane win    
     case 2:
      textSize(100);
      textAlign(CENTER);
      fill(color(#FF03C0));
      text("Zane Wins!", width / 2, height / 2);
      //Bakc
      textSize(40);
      fill(color(#FF03C0));
      text("Press 'B' to go back to the menu", width / 2, height - 100);
      break;
// Chris win
     case 3: 
      textSize(100);
      textAlign(CENTER);
      fill(color(#03E8FF));
      text("Chris Wins!", width / 2, height / 2);
      // Back
      textSize(40);
      fill(color(#03E8FF));
      text("Press 'B' to go back to the menu", width / 2, height - 100);
      break;
     case 4:
      background(20);
      fill(255);
      textAlign(CENTER);
      textSize(50);
      text("HOW TO PLAY", width / 2, 150);
  
      textSize(30);
      text("ZANE CONTROLS: 'A' = left, 'D' = right", width / 2, 300);
      text("CHRIS CONTROLS: 'J' = left, 'L' = right", width / 2, 350);
      text("Press 'B' to go back", width / 2, 800);
      
      text("GOODLUCK MODE: Controls will flip every time you clear a round!", width / 2, 500);
      break;
     case 5:
      textSize(100);
      textAlign(CENTER);
      fill(200, 200, 255);
      text("It's a Tie!", width / 2, height / 2);
      
            // Back
      textSize(40);
      fill(color(#03E8FF));
      text("Press 'B' to go back to the menu", width / 2, height - 100);
      break;
      case 6:
      
        image(rainbow, width/2, height/2);
  // Show Score
   drawScoreZ();
   drawScoreC();
   

  //Zane Ball
  Zball.render();
  Zball.move();
  Zball.wallDetect();
  Zball.playerCollision(zane);
  
   //Chris Ball
  Cball.render();
  Cball.move();
  Cball.wallDetect();
  Cball.playerCollision(chris);
 
  //Player
  zane.render();
  zane.move();

  chris.render();
  chris.move();
//loop through zanes head 
  for (Head activeHead : zaneHeadList) {
    if (activeHead.destroy == true) {
      activeHead.render();
      activeHead.move();
      activeHead.wallDetect();

      Zball.headCollision(activeHead);
    }
  }
  for(int i = zaneHeadList.size()-1; i >= 0; i -= 1){
    Head activeHead = zaneHeadList.get(i);
    zaneScoreNew(activeHead);
  }

// Loop through chris head 
  for (Head activeHead : chrisHeadList) {
    if (activeHead.destroy == true) {
      activeHead.render();
      activeHead.move();
      activeHead.wallDetect();

      Cball.headCollision(activeHead);
      //chrisScoreNew(activeHead);
    }
     for(int i = chrisHeadList.size()-1; i >= 0; i -= 1){
    Head currentHead = chrisHeadList.get(i); 
    chrisScoreNew(currentHead);
  }
  }
/////////////////////////////////////////////////////////////Zane Levels
if (zaneHeadList.isEmpty()) {
  zaneRound++;

   if (zaneRound == 2) {
    for (int i = 0; i < 10; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 15;
    Zball.xSpeed *= 1.7;
    Zball.ySpeed *= 1.7;
    
    zaneInverted = !zaneInverted;
  } 
  else if (zaneRound == 3) {
    for (int i = 0; i < 15; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 10;
    Zball.xSpeed *= 1.3;
    Zball.ySpeed *= 1.3;
    
    zaneInverted = !zaneInverted;
  } 
  else if (zaneRound == 4) {
    for (int i = 0; i < 20; i++) {
      zaneHeadList.add(new Head(75, zaneHead));
    }
    zane.pW -= 10;
    Zball.xSpeed *= 1.1;
    Zball.ySpeed *= 1.1;
    
    zaneInverted = !zaneInverted;
  } 
  if (zaneRound == 5) {
    state = 2;  // Zane wins
  }
}
//////////////////////////////////////////////////////////////  Chris Levels
  if (chrisHeadList.isEmpty()){
    chrisRound++;
    
    
  if (chrisRound == 2) {
    for (int i = 0; i < 10; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 15;
    Cball.xSpeed *= 1.7;
    Cball.ySpeed *= 1.7;
    
    chrisInverted = !chrisInverted;
  }
 else if (chrisRound == 3) {
    for (int i = 0; i < 15; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 10;
    Cball.xSpeed *= 1.3;
    Cball.ySpeed *= 1.3;
    
    chrisInverted = !chrisInverted;
  } 
 else if (chrisRound == 4) {
    for (int i = 0; i < 20; i++) {
      chrisHeadList.add(new Head(75, chrisHead));
    }
    chris.pW -= 10;
    Cball.xSpeed *= 1.1;
    Cball.ySpeed *= 1.1;
    
    chrisInverted = !chrisInverted;
  } 
  else if (chrisRound == 5) {
    state = 3; // Chris wins
    }
  if (zanePoints >= 45){
    state = 2;
  }
}
    if (chrisPoints >= 45){
    state = 3;
  }

if (Zball.y > height && Cball.y > height){
 if (zaneScore > chrisScore){
  state = 2; 
 }
 else if (chrisScore > zaneScore){
  state = 3; 
 }
 else {
  state = 5; 
 }
}
  break;
  case 7:
  background(0,0,139);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  textFont(createFont("Consolas", 20));
  textSize(28);
  text(":)\nYour PC ran into a problem and needs to restart.", width / 2, height / 2 - 100);
  textSize(20);
  text("We're just collecting some error info, and then we'll restart for you.", width / 2, height / 2 - 40);
  text("0x0000007E SYSTEM_THREAD_EXCEPTION_NOT_HANDLED", width / 2, height / 2 + 40);

  break;
  case 8:
  delay(5000);  
  exit();
  crash();
  // quit
 break;
  }
 }
