import drawing.library.*;
import processing.pdf.*;
import controlP5.*;

DrawingManager drawingManager;
DShape shape;
DLine line;

ControlP5 controlP5;
boolean showGUI = true;
Slider[] sliders;

float noise = 10;
boolean colorShift = false;
float speed = 0.2;
float hues = 50;
float sat = 50;
float bri = 50;
float r = 30;
void setup() {
  size(1056,816,P3D);
  background(255);
  smooth();
  drawingManager = new DrawingManager(this);
  setupGUI();
  colorMode(HSB, 100);
  noStroke();
  fill(hues,sat,bri);
  circle(width/2,50,50);
 }

void draw() {
  fill(hues,sat,bri);
  circle(width/2,50,50);
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
  if(key == 'r'){
    colorMode(RGB, 255);
    drawingManager.clear();
    colorMode(HSB, 100);
  }
  if(key == 'c'){
    colorShift=true;
  }
}

void keyReleased(){
  colorShift = false;
}

void mousePressed(){
   shape = drawingManager.addShape();  
   //if(random(1.0)<prob):
}
  
void mouseDragged(){
   //
   if( (mouseX>=0 && mouseX<425 && mouseY>=0 && mouseY<5+225)) return;
   if(colorShift == true){
     int dx = mouseX-pmouseX;
     int dy = mouseY-pmouseY;
     hues += dx*speed;
     sat += dy*speed;
     if(hues>100) hues=100;
     if(hues<0) hues=0;
     if(sat>100) sat=100;
     if(sat<0) sat=0;
     fill(hues,sat,bri);
     circle(width/2,50,50);
   }
   noStroke();
   fill(hues+noise*random(-1,1),sat+noise*random(-1,1),bri+noise*random(-1,1));
   circle(mouseX,mouseY,r); 

}

void mouseWheel(MouseEvent event) {
  int e = round(event.getCount());
  if(colorShift == true){
    bri += e*speed;
    if(bri>100) bri=100;
    if(bri<0) bri=0;
    fill(hues,sat,bri);
    circle(width/2,50,50);
  }

}
