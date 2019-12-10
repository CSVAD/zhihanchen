package template.library;

import processing.core.PApplet;

public class ArcObj extends Component{
	public float x,y,a,b,start,end; //same as params in processing
	
	public ArcObj(PApplet _p,float _x, float _y,float _a, float _b, float s, float e) {
		super(_p,_x,_y,1,1);
		a = _a;
		b = _b;
		start = s;
		end = e;
	}
	public ArcObj(PApplet _p,float _a, float _b, float s, float e) {
		super(_p,0,0,1,1);
		a = _a;
		b = _b;
		start = s;
		end = e;
	}
	public void draw(float _x,float _y, float sx, float sy, float ro) {
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
		p.arc(0,0,a,b,start,end);
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
