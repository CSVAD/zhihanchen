package template.library;

import processing.core.PApplet;

public class ArrowObj extends Component{
	public float w,d; //w,d of rect
	
	public ArrowObj(PApplet _p,float _x, float _y,float _w, float _d) {
		super(_p,_x,_y,1,1);
		w = _w;
		d = _d;
	}
	public ArrowObj(PApplet _p,float _w, float _d) {
		super(_p,0,0,1,1);
		w = _w;
		d = _d;
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
		p.line(-40,0,40,0);
		p.line(40,0,25,-15);
		p.line(40,0,25,15);
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
