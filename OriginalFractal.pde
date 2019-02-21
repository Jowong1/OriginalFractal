int n = 200;
int change = -1;
boolean repeat = false;
boolean start = false;
int count = 0;
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
    rect(0, height, width/2, height);
    rectMode(CENTER);
    rect(width/2 - 150, height/2, 255, 100);
    fill(255);
    rect(width/2 + 150, height/2, 255, 100);
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
  }
}
public void mouseClicked(){
  if(start == false){
    if(mouseX >= (width/2 - 150 - 75) && mouseX <= (width/2 - 150 + 75) && mouseY == height/2);
    println(true);
    //rect(width/2 - 150, height/2, 255, 100);
    //fill(255);
    //rect(width/2 + 150, height/2, 255, 100);
  }else{
    if(count == 3){
      count = 0;
    }
    count++;
  }
}
public void recursion(int x, int y, int num){
  if(num <= 20){
    //repeat = true;
  }else{
    if(count == 0 || count == 2){
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
