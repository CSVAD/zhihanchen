import template.library.*;

Star[] star= new Star[5];

void setup() {
  size(400,400);
  for(int i = 0;i<5;i++)
    star[i] = new Star(this,20*(i*2+1),0.5,5+i);
  
}

void draw() {
  background(255);
  noFill();
  for(int i = 0;i<5;i++)
    star[i].draw(200,200);
}
