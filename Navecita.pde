Nave nave;

void setup(){
	size(512, 512);
	nave = new Nave();
	nave.setup();
}

void draw(){
	nave.update();

	background(255);
	nave.draw();
}


