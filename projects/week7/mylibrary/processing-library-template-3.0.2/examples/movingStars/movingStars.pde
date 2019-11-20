import template.library.*;

Star[] star= new Star[5];
float overlayAlpha = 10;
Star s1;
void setup() {

  size(1280,800);
  smooth();
  for(int i = 0;i<5;i++){
    star[i] = new Star(this,20+random(30),0.5,5+i);
    star[i].setPos(100.0*i,100.0);
  }
  s1=new Star(this,20+random(30),0.35,8);
  s1.setPos(width/2, height/2);
}
void draw(){
  fill(135,206,235, overlayAlpha);
  noStroke();
  rect(0,0,width,height);
  
  //stroke(0, 90);
  for(int i = 0;i<5;i++)
    star[i].moveLine(100.0*i,100.0,100.0*i,700.0,5+i+random(10));
  star.move(-5+random(10),-1+random(10));
  
}
