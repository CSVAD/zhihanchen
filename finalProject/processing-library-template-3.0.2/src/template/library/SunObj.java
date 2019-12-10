package template.library;

import processing.core.PApplet;

public class SunObj extends Component{
	
	public int n; // n iter of the light
	public float r; // r of the sun
	public float l; //length of light
	
	public SunObj(PApplet _p,float _x, float _y,float _r, int _n, float _l) {
		super(_p,_x,_y,1,1);
		r = _r;
		n = _n;
		l = _r/2;
	}
	public SunObj(PApplet _p, float _r) {
		super(_p,0,0,1,1);
		r = _r;
		n = 8;
		l = _r/2;
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
		p.circle(0,0,r);
		float r1 = r*(float)0.75;
    	float r2 = r1+l;
	    for(int i=0;i<n;i++){
	    	p.line(p.sin(p.radians((float)i*(float)(360.0/this.n)))*r1,p.cos(p.radians((float)i*(float)(360.0/this.n)))*r1
	    			,p.sin(p.radians((float)i*(float)(360.0/this.n)))*r2,p.cos(p.radians((float)i*(float)(360.0/this.n)))*r2);
	    }

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
