Nave nave;
ParticleGenerador generador_de_estrellas;
int t_ultima_estrella;

void setup(){
	size(512, 512);
	nave = new Nave();
	nave.setup();
	fill(255);
	
	generador_de_estrellas = new ParticleGenerador();
	t_ultima_estrella = millis();
}

void draw() {
	int tiempo = millis();
	if (tiempo > t_ultima_estrella+25) {
		t_ultima_estrella = tiempo;
		
		generador_de_estrellas.addParticle(new Estrellas(width/2, height/2));
	}
	
	nave.update();
	generador_de_estrellas.update();

	background(0);
	nave.draw();
	generador_de_estrellas.draw();
}

void mousePressed () {
	nave.mousePressed();
}
