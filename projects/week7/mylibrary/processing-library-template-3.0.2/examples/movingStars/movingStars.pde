import template.library.*;

Star[] star= new Star[5];
float overlayAlpha = 10;

void setup() {

  size(1280,800);
  smooth();
  for(int i = 0;i<5;i++){
    star[i] = new Star(this,20+random(30),0.5,5+i);
    star[i].setPos(100.0*i,100.0);
  }
}
void draw(){
  fill(135,206,235, overlayAlpha);
  noStroke();
  rect(0,0,width,height);
  
  //stroke(0, 90);
  for(int i = 0;i<5;i++)
    star[i].move(100.0*i,100.0,100.0*i,700.0,5+i+random(10));
  
}
