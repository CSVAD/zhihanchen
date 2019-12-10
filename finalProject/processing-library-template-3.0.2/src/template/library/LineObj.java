package template.library;

import processing.core.PApplet;

public class LineObj extends Component{
	public float x1,x2,y1,y2; //same as params in processing
	
	public LineObj(PApplet _p,float _x, float _y,float _x1, float _y1, float _x2, float _y2) {
		super(_p,_x,_y,1,1);
		x1 = _x1;
		x2 = _x2;
		y1 = _y1;
		y2 = _y2;
	}
	public LineObj(PApplet _p,float _x1, float _y1, float _x2, float _y2) {
		super(_p,0,0,1,1);
		x1 = _x1;
		x2 = _x2;
		y1 = _y1;
		y2 = _y2;
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
		p.line(x1,y1,x2,y2);
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
