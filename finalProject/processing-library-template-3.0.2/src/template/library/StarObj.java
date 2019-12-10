package template.library;

import processing.core.PApplet;

public class StarObj extends Component{
	
	public int n; // n iter of the star
	public float r; // r of the star
	public float ratio; //ratio of star(=1 becomes polygon)
	
	public StarObj(PApplet _p,float _x, float _y,float _r, int _n) {
		super(_p,_x,_y,1,1);
		r = _r;
		n = _n;
		ratio = (float)0.5;
	}
	public StarObj(PApplet _p, float _r) {
		super(_p,0,0,1,1);
		r = 50;
		n = 5;
		ratio = (float)0.5;
	}
	public void draw(float _x, float _y, float sx, float sy, float ro) {
		int fill=0;
		int stroke=0;
		if(fill_setted) {
			fill=p.g.fillColor;
			p.fill(fill_r,fill_g,fill_b);
		}
		if(stroke_setted) {
			stroke=p.g.strokeColor;
			p.fill(stroke_r,stroke_g,stroke_b);
		}
		p.pushMatrix();
		p.translate(_x,_y);
		p.scale(sx,sy);
		p.rotate(ro);
		p.translate(x,y);
		p.scale(scale_x,scale_y);
		p.rotate(rotation);
		p.beginShape();
	    for(int i=0;i<n*2+1;i++){
	      float r=i%2==0? this.r*ratio:this.r;
	      p.vertex(p.sin(p.radians((float)i*(float)(180.0/this.n)))*r,p.cos(p.radians((float)i*(float)(180.0/this.n)))*r);
	    }
	    
	    p.endShape();
		p.popMatrix();
		
		if(fill_setted)
			p.fill(fill);
		if(stroke_setted) 
			p.stroke(stroke);
	}
	public void draw() {
		draw(0,0,1,1,0);
	}
}
