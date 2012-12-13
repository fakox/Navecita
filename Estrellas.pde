class Estrellas extends ParticleWithSpeed {
	Estrellas (float x, float y) {
		super(x, y);
		v.set(random(2)-1, random(2)-1, 0.0);
	}
	
	void update () {
		super.update();
		v = PVector.mult(v, 1.04);
	}
	
	void draw () {
		stroke(50, 50, 100);
		line(p.x, p.y, p.x+v.x*5, p.y+v.y*5);
		stroke(255);
	}
	
	boolean shouldDie () {
		return p.y<50 || p.y>height-50 || p.x<50 || p.x>width-50;
	}
};
