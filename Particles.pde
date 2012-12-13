import java.util.ArrayList;
import java.util.Iterator;

class Particle {
	PVector p;
	
	Particle (float x, float y) {
		p = new PVector(x, y);
	}
	void update () {
		
	}
	void draw (){
		point(p.x, p.y);
	}
	
	boolean shouldDie () {
		return false;
	}
};

class ParticleWithSpeed extends Particle {
	PVector v;
	ParticleWithSpeed (float x, float y) {
		super(x, y);
		v = new PVector(0.0, -5.0);
	}
	void update () {
		super.update();
		p.add(v);
	}
	void draw (){
		line(p.x, p.y, p.x+v.x, p.y+v.y);
	}
	
	boolean shouldDie () {
		return p.y<100;
	}
};

class ParticleGenerador {
	ArrayList<Particle> particles;
	ParticleGenerador () {
		particles = new ArrayList<Particle>();
	}
	void update () {
		Iterator<Particle> i = particles.iterator();
		while (i.hasNext()) {
		    Particle p = i.next();
			p.update();
			if (p.shouldDie()){
				i.remove();
			}
		}
	}
	void draw (){
		for (Particle p : particles) {
			p.draw();
		}
	}
	void addParticle (Particle p) {
		particles.add(p);
	}
};
