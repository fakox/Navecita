class Nave {
	PVector position;
	//void setup(){
		position = new PVector(width/2, height/2);
	}//
	void setup(float x, float y){
		position = new PVector(x, y);
	}
	void update(){
		position.x=mouseX;
		position.y=mouseY;
	}
	void draw (){
		float w = 15;
		float h = 20;
		float x = position.x;
		float y = position.y;
		triangle(x, y, x+w, y+h, x-w, y+h);
		noCursor();
	}
};
