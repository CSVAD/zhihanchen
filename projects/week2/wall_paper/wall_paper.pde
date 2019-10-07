int W=800;
int H=800;
float nH=16;
float nW=16;
float rH=H/nH;
float rW=W/nW;
float[][] colors2={{255,222,173},{255,255,255}};
float[][] colors1={{255,255,255},{255,222,173}};
float r=rH/5;
float rin=rH/10;
void setup(){
  size(800,800);
  //background(255,255,255);
  noFill();
  for(int i=0;i<nH;i++){
    for(int j=0;j<nW;j++){
      pushMatrix();
      translate(i*rW,j*rH);
      drawSeed(0,0,(i+j)%2);
      popMatrix();
    }
  }
}

void drawSeed(float x,float y, int ind){
  pushMatrix();
  translate(x+rW/2,y+rH/2);
  //rotate(r);
  fill(colors1[ind][0],colors1[ind][1],colors1[ind][2]);
  rotate(radians(45));
  stroke(colors1[ind][0],colors1[ind][1],colors1[ind][2]);
  for(int i=0;i<4;i++){
    rotate(radians(90));
    triangle(0,0,-r,rH/2.5,r,rH/2.5);
    translate(0,rH/2.5);
    arc(0, 0, 2*r, 2*r, 0, PI, PIE);
    translate(0,-rH/2.5);
  }
  stroke(colors2[ind][0],colors2[ind][1],colors2[ind][2]);
  fill(colors2[ind][0],colors2[ind][1],colors2[ind][2]);
  circle(0,0,2*rin);
  popMatrix();
}
