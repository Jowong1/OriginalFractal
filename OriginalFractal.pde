int n = 200;
int change = -1;
boolean repeat = false;
boolean start = false;
boolean count = false;
boolean buttonsOn = false;
boolean begin = false;
boolean blackBackground = false;
float bounce = 0;
float bChange = 0.2;
int slide = -5;
int slide2 = -5;
int turnWhite = 0;
int turnBlack = 255;
int turnWhite2 = 0;
int turnBlack2 = 255;
int turnWhite3 = 0;
int turnBlack3 = 255;

public void setup(){
  size(800,800);
  background(0);
}
public void draw(){
  if(start == false){
    noStroke();
    rectMode(CORNER);
    fill(255);
    rect(0, 0, width/2, height);
    fill(0);
    rect(width/2, 0, width/2, height);
    rectMode(CENTER);
    if(turnBlack < 0){
      fill(255);
    }else{
      fill(turnBlack2);
    }
    rect(width/2 - 150, height/2 + bounce, 255, 100);
    if(turnBlack < 0){
      fill(0);
    }else{
      fill(turnWhite2);
    }
    rect(width/2 + 150, height/2 + bounce, 255, 100);
    textSize(60);
    if(slide < height/2 - 200){
      slide+=2;
    }else if(slide2 < height/2 - 200){
      slide2+=2;
    }else if(turnWhite < 240){
      turnWhite++;
      turnBlack--;
    }else{
      turnWhite = 255;
      turnBlack = 0;
      if(turnWhite2 < 240){
        turnWhite2++;
        turnBlack2--;
      }else{
        if(turnWhite3 >= 240){
          turnWhite3 = 255;
          turnBlack3 = 0;
          buttonsOn = true;
        }else{
          turnWhite3++;
          turnBlack3--;
        }
      }
    }
    fill(0);
    text("Choose", width/4 - 75, slide);
    fill(255);
    text("Your", 3 * width/4 - 135, slide2);
    textSize(50);
    if(bounce > 10){
      bChange = -0.2;
    }
    if(bounce < 0){
      bChange = 0.2;
    }
    bounce = bChange + bounce;
    fill(turnBlack);
    text("Back",width/2 - 110, height/2 - 100);
    if(turnBlack > 15){
      fill(0);
    }else if(turnBlack2 > 15){
      fill(turnWhite2);
    }else{
      fill(turnBlack3);
    }
    text("Black",width/2 + 85, height/2 + 15 + bounce);
    fill(turnWhite);
    text("ground",width/2, height/2 - 100);
    if(turnBlack > 15){
      fill(255);
    }else if(turnBlack2 > 15){
      fill(turnBlack2);
    }else{
      fill(turnWhite3);
    }
    text("White",width/2 - 220, height/2 + 15 + bounce);
  }else{
    recursion(width/2, height/2, n);
    recursion(width, height/2, n);
    recursion(width/2, height, n);
    recursion(0, height/2, n);
    recursion(width/2, 0, n);
    n = n + change;
    if(n <= 20){
      change = 1;
    }else if(n >= 200){
      change = -1;
    }
    if(begin == true){
      fill(0);
      text("Click", width/2 - 60, height/2);
    }
  }
}
public void mouseClicked(){
  if(start == false){
    if(buttonsOn == true){
      if(mouseX >= (width/2 - 275) && mouseX <= (width/2 - 25) && mouseY >= (height/2 - 50) && mouseY <= (height/2 + 50)){
        background(255);
        start = true;
        begin = true;
      }
      if(mouseX <= (width/2 + 275) && mouseX >= (width/2 + 25) && mouseY >= (height/2 - 50) && mouseY <= (height/2 + 50)){
        background(0);
        blackBackground = true;
        start = true;
        begin = true;
      }
    }
  }else{
    count = !count;
    if(begin == true){
      begin = false;
    }
  }
}
public void recursion(int x, int y, int num){
  if(num <= 20){
  }else{
    if(count == true){
      fill(0);
      stroke(255);
    }else{
      fill(255);
      stroke(0);
    }
    ellipse(x, y, num, num);
    recursion(x, y - 5, num-5);
  }
}
