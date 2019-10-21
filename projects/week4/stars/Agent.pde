//Perlin noise example. Modified from:

// M_1_5_03_TOOL.pde
// Agent.pde, GUI.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de

class Agent {
  PVector p, pOld;
  float stepSize, angle, distance;

  Agent() {
    p = new PVector(0,random(height));
    pOld = new PVector(p.x,p.y);
    stepSize = random(averageVelocity*0.25,averageVelocity*1.75);
    distance = random(averageDistance*0.25,averageDistance*1.75);
    // init noiseZ

  }

  void update(){

    p.x += stepSize;
    
    // offscreen wrap
    if (p.x<-10) p.x=pOld.x=width+10;
    if (p.x>distance+10) {
      p.x=pOld.x=-10;
      stepSize = max(randomGaussian()+1,0.15)*averageVelocity;
      //random(averageVelocity*0.25,averageVelocity*2);
      distance = max(randomGaussian()+1,0.15)*averageDistance;
      //random(averageDistance*0.25,averageDistance*1.75);
      p.y = random(height);
      }
    if (p.y<-10) p.y=pOld.y=height+10;
    if (p.y>height+10) p.y=pOld.y=-10;

    strokeWeight(strokeWidth*stepSize);
    //line(pOld.x,pOld.y, p.x,p.y);
    fill(255,255,0);
    stroke(255,215,0);
    beginShape();
    for(int i=0;i<10;i++){
      float r=(i%2*rstar+rstar)/2.0;
      vertex(p.x+sin(radians(i*360.0/10))*r,p.y+cos(radians(i*360.0/10))*r);
    }
    //circle(p.x,p.y,5+random(50));
    endShape();
    pOld.set(p);
  }




}
