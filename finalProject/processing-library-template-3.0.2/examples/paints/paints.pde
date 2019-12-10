import template.library.*;


HumanObj h1,h2,h3;
SunObj s1;
void setup() {
  size(1280,800);
  
  h1 = new HumanObj(this);
  h1.moveTo(500.0,500.0);
  h2 = new HumanObj(this);
  h2.moveTo(380.0,600.0);
  h2.scale(1.3);
  h3 = new HumanObj(this);
  h3.moveTo(300.0,300.0);
  h3.scale(0.8);
  s1 = new SunObj(this,50);
  s1.moveTo(100,100);
}
void draw(){
    background(255);
    noFill();
    stroke(0);
    
    s1.draw();
    h1.draw();
    h2.draw();
    h3.draw();
}
