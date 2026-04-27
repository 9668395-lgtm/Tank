class Obstacle {
// Member Variable
float x, y, w, h, speed, health;
PImage obs1;
char idir;

//Constuctor
Obstacle(float x, float y, float w, float h, float speed, float health) {
this.y = y;
this.x = x;
this.h = h;
this.w = w;
this.speed = speed;
this.health = health;
idir = 'w';
obs1 = loadImage("tankywankypanky.png");
}

void display() {
fill(128);
imageMode(CENTER);
image(obs1,x, y);
}

void move() {
x=x+speed;
if (x>width) {
x = 0;
}
}
}
