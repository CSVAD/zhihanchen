import drawing.library.*;
import processing.pdf.*;
import controlP5.*;

DrawingManager drawingManager;
DShape shape;
DLine line;

ControlP5 controlP5;
boolean showGUI = true;
Slider[] sliders;

float maxlen=50;
float lastX,lastY;
float p_ellipse=0.5;
float a_ellipse=30;
float b_ellipse=5;

float p_star=0.5;
float r_star=25;

float interval = 100;
float noise = 0.5;

float current_int = random(interval*(1-noise),interval*(1+noise));
float distance = 0;
void setup() {
  size(1056,816,P3D);
  background(255);
  smooth();
  drawingManager = new DrawingManager(this);
  setupGUI();
 }

void draw() {
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'c'){
    drawingManager.clear();
  }
}

void mousePressed(){
   shape = drawingManager.addShape();  
   //if(random(1.0)<prob):
   lastX=mouseX;
   lastY=mouseY;
   distance = 0;
   current_int = random(interval*(1-noise),interval*(1+noise));
}
  
void mouseDragged(){
   //shape = drawingManager.addShape(); 
   float dx=mouseX-lastX;
   float dy=mouseY-lastY;
   distance+=sqrt(dx*dx+dy*dy);
   if(! (mouseX>=0 && mouseX<425 && mouseY>=0 && mouseY<5+225)){
     drawingManager.stroke(0,0,0);
     float reg=sqrt(dx*dx+dy*dy);
     dx=dx/reg;
     dy=dy/reg;
     if(distance>current_int){
       current_int = random(interval*(1-noise),interval*(1+noise));
       distance = 0;
       if(p_ellipse+p_star!=0){
         float rand = random(0,p_ellipse+p_star);
         if(rand<p_ellipse){
           drawEllipse(mouseX,mouseY,dx,dy);
         }
         else{
           drawStar(mouseX,mouseY);
         }
       }
     }
     shape.addVertex(mouseX,mouseY); 
   }
   lastX=mouseX;
   lastY=mouseY;
}

void drawEllipse(float x,float y,float dx,float dy){
  int dir=random(1.0)<0.5? 1:-1;
  float vx=dir*dy;
  float vy=-dir*dx;
  float xp=x+vx*a_ellipse;
  float yp=y+vy*a_ellipse;
  pushMatrix();
  float len = random(maxlen/5,maxlen);
  line(x,y,x+vx*len,y+vy*len);
  translate((x+xp)/2+vx*len,(y+yp)/2+vy*len);
  rotate(-atan(dx/dy));
  ellipse(0,0,a_ellipse,b_ellipse);
  popMatrix();
}

void drawStar(float x,float y){
  float vx=0;
  float vy=1;
  float xp=x+vx*r_star*2;
  float yp=y+vy*r_star*2;
  pushMatrix();
  float len = random(maxlen/5,maxlen);
  line(x,y,x+vx*len,y+vy*len);
  translate((x+xp)/2+vx*len,(y+yp)/2+vy*len);
  //rotate(-atan(dx/dy));
  beginShape();
    for(int i=0;i<=10;i++){
      float r=(i%2*r_star+r_star)/2.0;
      vertex(sin(radians((i)*360.0/10))*r,cos(radians((i)*360.0/10))*r);
    }
    //circle(p.x,p.y,5+random(50));
    endShape();
  popMatrix();
}
