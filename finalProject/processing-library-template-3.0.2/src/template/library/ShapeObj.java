package template.library;

import java.util.ArrayList;
import java.util.List;

import processing.core.PApplet;

public class ShapeObj extends Component{
	public List<Float> xs = new ArrayList<>(); 
	public List<Float> ys = new ArrayList<>();  
	
	public ShapeObj(PApplet _p,float _x, float _y) {
		super(_p,_x,_y,1,1);
		
	}
	public ShapeObj(PApplet _p) {
		super(_p,0,0,1,1);

	}
	public void add(float _x, float _y) {
		xs.add(_x);
		ys.add(_y);
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
		int n = xs.size();
		p.beginShape();
		for(int i = 0; i < n; i++) {
			p.vertex(xs.get(i),ys.get(i));
		}
		p.endShape(p.CLOSE);
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
