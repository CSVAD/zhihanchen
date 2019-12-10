package template.library;

import template.library.Component;
import java.util.HashMap;

public class Group{
	HashMap <String, Component> components;
	float x,y;
	float scale_x,scale_y;
	float rotation; 
	
	public Group() {
		components = new HashMap <String, Component>();
		x=200;y=200;
		scale_x=1;scale_y=1;
		rotation=0;
	}
	
	public Component get(String name) { //get component by name
		return components.get(name);
	}
	
	public void put(String name, Component component) { //add component
		components.put(name,component);
	}
	
	public Component remove(String name) {//remove component by name
		return components.remove(name);
	}
	
	//methods for whole group
	public void move(float dx,float dy) { 
		x+=dy;
		x+=dy;
	}
	public void moveTo(float _x,float _y) { 
		x=_x;
		y=_y;
	}
	public void scale(float s) { 
		scale_x*= s;
		scale_y*= s;		
	}
	public void scale(float sx,float sy) { 
		scale_x*= sx;
		scale_y*= sy;		
	}
	public void setScale(float s) { 
		scale_x = s;
		scale_y = s;		
	}
	public void setScale(float sx,float sy) { 
		scale_x = sx;
		scale_y = sy;		
	}
	public void setRotation(float r) {
		rotation = r;
	}
	public void rotate(float r) {
		rotation += r;
	}
	//methods for all components
	public void setFill(float r, float g, float b) {
		for (String key : components.keySet()) {
			components.get(key).setFill(r,g,b);
		}
	}
	public void setStroke(float r, float g, float b) {
		for (String key : components.keySet()) {
			components.get(key).setStroke(r,g,b);
		}
	}
	public void draw() { 
		for (String key : components.keySet()) {
			components.get(key).draw(x,y,scale_x,scale_y,rotation);
		}
	}
}
