import controlP5.*;
ControlP5 cp5;

int resolution = 20;

float redValue = 100;
float greenValue = 100;
float blueValue = 100;
float legHeight = 300;
float legWidth = 100;
float backHeight = 300;
float backWidth = 200;

Controller redSlider;
Controller greenSlider;
Controller blueSlider;
Controller legHeightSlider;
Controller backHeightSlider;
Controller legWidthSlider;
Controller backWidthSlider;

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
    .setRange(100, height/2-50)
    ;
    
  legWidthSlider = cp5.addSlider("legWidth")
    .setPosition(25, 25*5)
    .setRange(2, 100)
    ;

  
  backHeightSlider = cp5.addSlider("backHeight")
    .setPosition(25, 25*6)
    .setRange(100, height/2-50)
    ;
  
  backWidthSlider = cp5.addSlider("backWidth")
    .setPosition(25, 25*7)
    .setRange(2, 200)
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
  rotateY((float)(frameCount * Math.PI / 400));
  rotateZ((float)(frameCount * Math.PI / 400));
  float a=200,b=200,c=30;
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
