import controlP5.*;
ControlP5 cp5;

int resolution = 20;

float redValue = 100;
float greenValue = 100;
float blueValue = 100;
float legHeight = 300;
float legWidth = 20;
float backHeight = 300;
float backWidth = 30;
float seatWidth = 200;

Controller redSlider;
Controller greenSlider;
Controller blueSlider;
Controller legHeightSlider;
Controller backHeightSlider;
Controller legWidthSlider;
Controller backWidthSlider;
Controller seatWidthSlider;

void setup() {
  size(1024, 768, P3D);
  cp5 = new ControlP5(this);

  redSlider =  cp5.addSlider("redValue")
    .setPosition(25, 25)
    .setRange(0, 255)
    ;

  greenSlider = cp5.addSlider("greenValue")
    .setPosition(25, 25*2)
    .setRange(0, 255)
    ;

  blueSlider =  cp5.addSlider("blueValue")
    .setPosition(25, 25*3)
    .setRange(0, 255)
    ;


  legHeightSlider = cp5.addSlider("legHeight")
    .setPosition(25, 25*4)
    .setRange(0, height/2-50)
    ;
    
  legWidthSlider = cp5.addSlider("legWidth")
    .setPosition(25, 25*5)
    .setRange(2, 100)
    ;

  
  backHeightSlider = cp5.addSlider("backHeight")
    .setPosition(25, 25*6)
    .setRange(0, height/2-50)
    ;
  
  backWidthSlider = cp5.addSlider("backWidth")
    .setPosition(25, 25*7)
    .setRange(2, 200)
    ;
    
  seatWidthSlider = cp5.addSlider("seatWidth")
    .setPosition(25, 25*8)
    .setRange(2, 500)
    ;

 
}


void draw() {

  background(0);
  lights();
  pushMatrix();
  translate(width / 2, height / 2 , -100);
  fill(redValue,greenValue,blueValue);
  noStroke();
  //stroke(0,0,255);
  //strokeWeight(1);
  rotateY((float)(frameCount * Math.PI / 800));
  rotateZ((float)(frameCount * Math.PI / 800));
  float a=200,b=seatWidth,c=30;
  box(a,b,c);
  
  translate(-a/2,-b/2,c/2);
  translate(legWidth/2,legWidth/2,legHeight/2);
  box(legWidth,legWidth,legHeight);

  translate(a-legWidth,0,0);
  box(legWidth,legWidth,legHeight);
  
  translate(0,b-legWidth,0);
  box(legWidth,legWidth,legHeight);
  
  translate(legWidth-a,0,0);
  box(legWidth,legWidth,legHeight);
  
  translate(-legWidth/2+backWidth/2,legWidth/2-b/2,-legHeight/2-c-backHeight/2);
  box(backWidth,b,backHeight);
  popMatrix();
}
