ArrayList<Integer> x1 = new ArrayList<Integer>(), y1 = new ArrayList<Integer>();
int w1 = 40, h1 = 40, block1 = 20, direction1 = 0, foodx1 = 15, foody1 = 15,fc1=255, fc11= 255, fc111 = 255, speed = 10;
int[]x1_direction={0,0,1,-1}, y1_direction={1,-1,0,0};

ArrayList<Integer> x2 = new ArrayList<Integer>(), y2 = new ArrayList<Integer>();
int w2 = 40, h2 = 40, block2 = 20, direction2 = 0, foodx2 = 30, foody2 = 30, fc2=255, fc22= 255, fc222 = 255;
int[]x2_direction={0,0,1,-1}, y2_direction={1,-1,0,0};

boolean gameEnd=false;

int randomX1 = (int) random(10);
int randomY1 = (int) random(10);
int randomX2 = (int) random(30);
int randomY2 = (int) random(30);

void setup() {
  size(800,800);
  x1.add(randomX1);
  y1.add(randomY1);
  x2.add(randomX2);
  y2.add(randomY2);

}

void draw() {
  background(0); 
  fill(128, 184, 237);
  for (int i = 0; i < x1.size(); i++) rect(x1.get(i)*block1, y1.get(i)*block1, block1, block1);

  fill(237, 5, 5);
  for (int i = 0; i < x2.size(); i++) rect(x2.get(i)*block2, y2.get(i)*block2, block2, block2);
  
  if(!gameEnd){
    fill(fc1, fc11, fc111);
    ellipse(foodx1*block1+10, foody1*block1+10, block1, block1);
    fill(fc2, fc22, fc222);
    ellipse(foodx2*block2+10, foody2*block2+10, block2, block2);
    
    textAlign(LEFT);
    textSize(25);
    fill(255);
    text("Total Score: "+ x1.size(),10,10, width -20, 50);
    
  
  if(frameCount%speed==0){
    x1.add(0, x1.get(0) + x1_direction[direction1]);
    y1.add(0, y1.get(0) + y1_direction[direction1]);
    x2.add(0, x2.get(0) + x2_direction[direction2]);
    y2.add(0, y2.get(0) + y2_direction[direction2]);
    
    if (x1.get(0) < 0 || y1.get(0) < 0 || x1.get(0) >= w1 || y1.get(0) >= h1 || x2.get(0) < 0 || y2.get(0) < 0 || x2.get(0) >= w2 || y2.get(0) >= h2) gameEnd=true;
    for (int i = 1; i<x1.size();i++)     for (int p = 1; p<x2.size();p++)
    if (x1.get(0)==x1.get(i)&&y1.get(0)==y1.get(i) || (x1.get(i)==x2.get(p)&&y1.get(i)==y2.get(p)) || (x1.get(0)==x2.get(p)&&y1.get(0)==y2.get(p)) || (x1.get(i)==x2.get(0)&&y1.get(i)==y2.get(0))) gameEnd = true;
    
    for (int i = 1; i<x2.size();i++)
    if (x2.get(0)==x2.get(i)&&y2.get(0)==y2.get(i)) gameEnd = true;
    
    if (x1.get(0)==x2.get(0)&&y1.get(0)==y2.get(0)) gameEnd = true;
    
    
    
    if (x1.get(0)==foodx1 && y1.get(0) == foody1){
      if (x1.size()%2==0 && speed>=2) speed-=1;
      foodx1 = (int)random(0,w1);
      foody1 = (int)random(0,h1);
      fc1=(int)random(255);fc11 = (int)random(255);fc111 = (int)random(255);
    }
    else if (x2.get(0)==foodx1 && y2.get(0) == foody1){
      if (x2.size()%2==0 && speed>=2) speed-=1;
      foodx1 = (int)random(0,w2);
      foody1 = (int)random(0,h2);
      fc1=(int)random(255);fc11 = (int)random(255);fc111 = (int)random(255);
    }
    else if (x1.get(0)==foodx2 && y1.get(0) == foody2){
      if (x1.size()%2==0 && speed>=2) speed-=1;
      foodx2 = (int)random(0,w1);
      foody2 = (int)random(0,h1);
      fc2=(int)random(255);fc22 = (int)random(255);fc222 = (int)random(255);
    }
    else if (x2.get(0)==foodx2 && y2.get(0) == foody2){
      if (x2.size()%2==0 && speed>=2) speed-=1;
      foodx2 = (int)random(0,w2);
      foody2 = (int)random(0,h2);
      fc2=(int)random(255);fc22 = (int)random(255);fc222 = (int)random(255);
    } else{
    
      x1.remove(x1.size()-1);
      y1.remove(y1.size()-1);
      x2.remove(x2.size()-1);
      y2.remove(y2.size()-1);
    }
  }
  }else{
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER \n Your total score is: "+ x1.size()+"\n Press Enter to restart", width/2, height/3);
    if (keyCode == ENTER){
      x1.clear();
      x2.clear();
      y1.clear();
      y2.clear();
      x1.add(randomX1);
      y1.add(randomY1);
      x2.add(randomX2);
      y2.add(randomY2);
      direction1 = 2;
      direction2 = 2;
      speed = 8;
      gameEnd = false;
  }
  }

//fill(random(255),random(255),random(255));
}


void keyPressed(){
  int move1 = keyCode == DOWN? 0:(keyCode == UP?1:(keyCode == RIGHT?2:(keyCode == LEFT?3:-1)));
  if (move1 != -1) direction1 = move1;
  
  if (key == 'w') 
  direction2 = 1;
  if (key == 'a') 
  direction2 = 3;
  if (key == 's') 
  direction2 = 0;
  if (key == 'd') 
  direction2 = 2;
  
}
