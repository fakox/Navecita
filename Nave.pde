class Nave {
	PVector position;
	ParticleGenerador pg;
	
	void setup(){
		position = new PVector(width/2, height/2);
		
		pg = new ParticleGenerador();
	}//
	void setup(float x, float y){
		position = new PVector(x, y);
	}
	void update(){
		position.x=mouseX;
		position.y=mouseY;
		
		pg.update();
	}
	void draw (){
		float w = 15;
		float h = 20;
		float x = position.x;
		float y = position.y;
		triangle(x, y, x+w, y+h, x-w, y+h);
		noCursor();
		
		pg.draw();
	}
	
	void mousePressed () {
		pg.addParticle(new ParticleWithSpeed(position.x, position.y));
	}
};
