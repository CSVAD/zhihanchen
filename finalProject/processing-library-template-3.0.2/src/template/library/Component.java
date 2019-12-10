package template.library;
import processing.core.*;

public class Component {
	PApplet p;
	float scale_x,scale_y; //size ratio of object
	float x,y;  //position of object
	float rotation; //rotation of object
	float fill_r, fill_g, fill_b; //fill color of the object
	float stroke_r, stroke_g, stroke_b;//stroke color of the object
	boolean fill_setted, stroke_setted;//if False, use processing global fill or stroke
	
	public Component(PApplet _p,float _x, float _y,float sx, float sy) {
		p=_p;
		x=_x;
		y=_y;
		scale_x=sx;
		scale_y=sy;
		fill_setted = false;
		rotation = 0;
	}
	public Component(PApplet _p) {
		p = _p;
		scale_x=1;
		scale_y=1;
		x = 0;
		y = 0;
		fill_setted = false;
		rotation = 0;
	}
	public void setFill(float r, float g, float b) {
		fill_r = r;
		fill_g = g;
		fill_b = b;
		fill_setted = true;
	}
	public void setStroke(float r, float g, float b) {
		stroke_r = r;
		stroke_g = g;
		stroke_b = b;
		stroke_setted = true;
	}

	public void setScale(float s) {
		scale_x = s;
		scale_y = s;
	}
	public void setScale(float sx, float sy) {
		scale_x = sx;
		scale_y = sy;
	}
	public void scale(float s) {
		scale_x = scale_x * s;
		scale_y = scale_y * s;
	}
	public void scale(float sx, float sy) {
		scale_x = scale_x * sx;
		scale_y = scale_y * sy;
	}
	public void setRotation(float r) {
		rotation = r;
	}
	public void rotate(float r) {
		rotation += r;
	}
	public void move(float dx, float dy) {
		x+=dx;
		y+=dy;
	}
	public void moveTo(float _x, float _y) {
		x=_x;
		y=_y;
	}
	public void moveLine(float sx, float sy, float ex, float ey,float speed) {
		float d=p.sqrt((ex-sx)*(ex-sx)+(ey-sy)*(ey-sy));
		float dx=(ex-sx)/d;
		float dy=(ey-sy)/d;
		x+=dx*speed;
		y+=dy*speed;
		if(p.abs(x-sx)>p.abs(ex-sx)) {
			x=sx;
			y=sy;
		}
	}
	public void draw() {

	}
	public void draw(float _x,float _y, float sx, float sy, float rotation) {

	}
}
