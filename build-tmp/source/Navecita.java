import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import java.util.ArrayList; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class Navecita extends PApplet {

Nave nave;

public void setup(){
	size(512, 512);
	nave = new Nave();
	nave.setup();
}

public void draw(){
	nave.update();

	background(255);
	nave.draw();
}

public void mousePressed () {
	nave.mousePressed();
}
class Nave {
	PVector position;
	ParticleGenerador pg;
	
	public void setup(){
		position = new PVector(width/2, height/2);
		
		pg = new ParticleGenerador();
	}//
	public void setup(float x, float y){
		position = new PVector(x, y);
	}
	public void update(){
		position.x=mouseX;
		position.y=mouseY;
		
		pg.update();
	}
	public void draw (){
		float w = 15;
		float h = 20;
		float x = position.x;
		float y = position.y;
		triangle(x, y, x+w, y+h, x-w, y+h);
		noCursor();
		
		pg.draw();
	}
	
	public void mousePressed () {
		pg.addParticle(new ParticleWithSpeed(position.x, position.y));
	}
};


class Particle {
	PVector p;
	
	Particle (float x, float y) {
		p = new PVector(x, y);
	}
	public void update () {
		
	}
	public void draw (){
		point(p.x, p.y);
	}
	
	public boolean shouldDie () {
		return false;
	}
};

class ParticleWithSpeed extends Particle {
	PVector v;
	ParticleWithSpeed (float x, float y) {
		super(x, y);
		v = new PVector(0.0f, -5.0f);
	}
	public void update () {
		super.update();
		p.add(v);
	}
	public void draw (){
		line(p.x, p.y, p.x+v.x, p.y+v.y);
	}
	
	public boolean shouldDie () {
		return p.y<100;
	}
};

class ParticleGenerador {
	ArrayList<Particle> particles;
	ParticleGenerador () {
		particles = new ArrayList<Particle>();
	}
	public void update () {
		Iterator<Particle> i = particles.iterator();
		while (i.hasNext()) {
		    Particle p = i.next();
		    // Do something
			p.update();
			if (p.shouldDie()){
				i.remove();
			}
		}
	}
	public void draw (){
		for (Particle p : particles) {
			p.draw();
		}
	}
	public void addParticle (Particle p) {
		particles.add(p);
	}
};
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Navecita" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
