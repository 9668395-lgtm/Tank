class Tank {
float x, y, w, h, speed, health;
PImage iTank, iTankW, iTankA, iTankS, iTankD;
char idir;



Tank() {
x = 100;
y = 100;
w = 100;
h = 100;
speed = 10.0;
health = 75.0;
iTankW = loadImage("tankywankypanky.png");
iTankA = loadImage("tankywankypanky.png");
iTankS = loadImage("tankywankypanky.png");
iTankD = loadImage("tankywankypanky.png");
idir = 'w'
;}

void display() {
imageMode(CENTER);
 if(idir == 'w') {
   image(iTankW,x,y);
 } else if(idir == 'a') {
   image(iTankA,x,y);
 } else if(idir == 's') {
   image(iTankS,w,y);
 } else if(idir == 'd') {
   image(iTankD,x,y);
 }
}

void move(char dir) {
if (dir == 'w') {
y = y - speed;
} else if (dir == 's') {
y = y + speed;
} else if (dir == 'a') {
x = x - speed;
} else if (dir == 'd') {
x = x + speed;
}
}

void fire() {
}
}
