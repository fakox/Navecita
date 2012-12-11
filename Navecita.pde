Nave nave;

void setup(){
	nave = new Nave();
	nave.setup();
}

void draw(){
		nave.update();
		nave.draw();
}
