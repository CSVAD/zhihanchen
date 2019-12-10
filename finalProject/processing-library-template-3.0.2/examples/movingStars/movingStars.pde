import template.library.*;

StarObj[] star= new StarObj[5];
float overlayAlpha = 10;
StarObj s1,s2;
void setup() {
  size(1280,800);
  smooth();
  for(int i = 0;i<5;i++){
    star[i] = new StarObj(this,100.0*i,100.0,20+random(30),5+i);
  }
  s1 = new StarObj(this,500,200,20+random(30),5);
  s1.setFill(255,255,255);
}
void draw(){
  if(frameCount%5==0){
    fill(135,206,235, overlayAlpha);
    noStroke();
    rect(0,0,width,height);
    
    fill(255,255,0);
    stroke(255,215,0);
    for(int i = 0;i<5;i++){
      star[i].moveLine(100.0*i,100.0,100.0*(2*i+1),700.0,1+i+random(10));
      star[i].draw();
    }
  
    s1.move(-5+random(10),-5+random(10));
    s1.draw();
  }
}
