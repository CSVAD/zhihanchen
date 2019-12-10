package template.library;
import processing.core.*;

public class CircleObj extends Component{
	public float r; //R of circle
	
	public CircleObj(PApplet _p,float _x, float _y,float _r) {
		super(_p,_x,_y,1,1);
		r = _r;
	}
	public CircleObj(PApplet _p,float _r) {
		super(_p,0,0,1,1);
		r = _r;
	}
	public void draw(float _x,float _y, float sx, float sy,float ro) {
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