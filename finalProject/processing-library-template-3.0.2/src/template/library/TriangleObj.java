package template.library;

import processing.core.PApplet;

public class TriangleObj extends Component{
	public float x1,x2,x3,y1,y2,y3; 
	
	public TriangleObj(PApplet _p,float _x, float _y, float _x1, float _y1,float _x2, float _y2,float _x3, float _y3) {
		super(_p,_x,_y,1,1);
		x1 = _x1;
		y1 = _y1;
		x2 = _x2;
		y2 = _y2;
		x3 = _x3;
		y3 = _y3;
	}
	public TriangleObj(PApplet _p,float _x1, float _y1,float _x2, float _y2,float _x3, float _y3) {
		super(_p,0,0,1,1);
		x1 = _x1;
		y1 = _y1;
		x2 = _x2;
		y2 = _y2;
		x3 = _x3;
		y3 = _y3;
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
		p.triangle(x1,y1,x2,y2,x3,y3);
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
