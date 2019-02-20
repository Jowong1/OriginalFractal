int n = 200;
public void setup(){
  size(800,800);
  background(255);
}
public void draw(){
  recursion(width/2, height/2, n);
  recursion(width, height/2, n);
  recursion(width/2, height, n);
  recursion(0, height/2, n);
  recursion(width/2, 0, n);
  n--;
}
public void recursion(int x, int y, int num){
  if(num <= 20){
    
  }else{
    fill(255);
    ellipse(x, y, num, num);
    recursion(x, y - 5, num-5);
    
  }
}
