package template.library;


import processing.core.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example Hello 
 */

public class Star {
	
	// myParent is a reference to the parent sketch
	PApplet p;
	public float r;
	public float ratio;
	public int n;
	public float x,y;

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 */
	public Star(PApplet p, float r, float ratio, int n) {
		this.p = p;
		this.r = r;
		this.ratio = ratio;
		this.n = n;
	}
	public void setPos(float x, float y) {
		this.x=x;
		this.y=y;
	}
	public void draw() {
		p.beginShape();
	    for(int i=0;i<n*2+1;i++){
	      float r=i%2==0? this.r*ratio:this.r;
	      p.vertex(x+p.sin(p.radians((float)i*(float)(180.0/this.n)))*r,y+p.cos(p.radians((float)i*(float)(180.0/this.n)))*r);
	    }
	    
	    //circle(p.x,p.y,5+random(50));
	    p.endShape();
	}
    
	public void move(float x_start, float y_start,float x_end, float y_end, float speed) {
		float d=p.sqrt((x_end-x)*(x_end-x)+(y_end-y)*(y_end-y));
		float dx=(x_end-x)/d;
		float dy=(y_end-y)/d;
		
		float step_x=dx*speed;
	    float step_y=dy*speed;
	    p.fill(255,255,0);
	    p.stroke(255,215,0);
	    draw();
	    if(d>speed)
	    	setPos(x+step_x,y+step_y);
	    else
	    	setPos(x_start,y_start);
	    	
	}

}

