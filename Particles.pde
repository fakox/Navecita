class Particula {
	PVector p;
	void setup (float x, float y) {
		p = new PVector(x, y);
	}
	void update () {
		
	}
	void draw (){
		point(p.x, p.y);
	}
};

class ParticulaConVelocidad extends Particula {
	PVector v;
	void setup (float x, float y) {
		super.setup(x, y);
		v = new PVector(0.1, 0.0);
	}
	void update () {
		super.update();
		p.add(v);
	}
	void draw (){
		point(p.x, p.y);
	}
};
