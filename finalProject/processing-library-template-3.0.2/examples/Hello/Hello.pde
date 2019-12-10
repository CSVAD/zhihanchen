import template.library.*;

Component c1,r1;
Group g;
String s1[] = {"c1","r1"};
void setup() {
  size(400,400);
  c1 = new CircleObj(this,0,0,50);
  r1 = new RectObj(this,50,50,50,50);
  r1.setFill(0,255,255);
  c1.setStroke(255,0,0);
  g = new Group();
  g.put(s1[0],c1);
  g.put(s1[1],r1);
}

void draw() {
  background(255);
  noFill();
  noStroke();
  g.draw();
  //g.scale(1.01);
  //g.rotate(PI/60);
  
  float s=1.01;
  g.get(s1[0]).scale(s);
  g.get(s1[1]).scale(s);
  g.get(s1[1]).rotate(PI/60);
  
}
