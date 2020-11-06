ArrayList<Integer> x1 = new ArrayList<Integer>(), y1 = new ArrayList<Integer>();
int w1 = 30, h1 = 30, block1 = 20, direction1 = 0;
int[]x1_direction={0,0,1,-1}, y1_direction={1,-1,0,0};

ArrayList<Integer> x2 = new ArrayList<Integer>(), y2 = new ArrayList<Integer>();
int w2 = 30, h2 = 30, block2 = 20, direction2 = 0;
int[]x2_direction={0,0,1,-1}, y2_direction={1,-1,0,0};

int randomX1 = (int) random(10);
int randomY1 = (int) random(10);
int randomX2 = (int) random(10);
int randomY2 = (int) random(10);

void setup() {
  size(800,800);
  x1.add(randomX1);
  y1.add(randomY1);
  x2.add(randomX2);
  y2.add(randomY2);

}

void draw() {
background(0); 

fill(235, 52, 89);
for (int i = 0; i < x1.size(); i++) rect(x1.get(i)*block1, y1.get(i)*block1, block1, block1);

fill(235, 52, 89);
for (int i = 0; i < x2.size(); i++) rect(x2.get(i)*block2, y2.get(i)*block2, block2, block2);



//fill(random(255),random(255),random(255));

}
