class ProjecTile {
// Member Variable
float x, y, w, h, speed;
float vx, vy;
char dir;

//Constuctor
ProjecTile (float x, float y, float vx, float vy) {
this.y = y;
this.x = x;
this.vx = vx;
this.vy = vy;
this.h = 8;
this.w = 8;
speed = 8;
dir = 'u';
}

void display() {
fill(255, 0, 0);
rect(x, y, w, h);
}

void move() {
x += vx;
y += vy;
}
}

boolean intersect(Obstacle a) {
  float distance = dist(x, y, o.x o,y);
  
