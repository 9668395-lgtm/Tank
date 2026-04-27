// 1 April 2026 | TankGame by Miles Bookstaber
Tank Miles;
ArrayList <ProjecTile> projectiles = new ArrayList <ProjecTile>();
ArrayList <Obstacle> obstacles = new ArrayList <Obstacle>();
PImage bg;
int score;
Timer objTimer;

void setup() {
size(500, 500);
bg = loadImage ("bkg.png");
Miles = new Tank();
objTimer = new Timer(1000);
objTimer.start();
// obstacles.add(new Obstacle (200, 300, 100, 50, int (random(1, 10)), 10));
}

void draw() {
background (127);
imageMode(CORNER);
image(bg, 0, 0);

 // Distribute object on timer
if(objTimer.isFinished()) {
// Add object
obstacles.add(new Obstacle (-200, 300, 100, 50, int (random(1, 10)), 10));
// Restart Timer
objTimer.start();
}

for (int i = 0; i < obstacles.size(); i++) {
Obstacle o = obstacles.get(i);
o.display();
o.move();

// Render and detect collision
for (int i = 0; i < projectiles.size(); i +)
projectile p = projectiles.get(i);
for(int j = 0; j < obstacles.size(); j++
Obstacle o

}
}
for (int i = 0; i < projectiles.size(); i++) {
ProjecTile p = projectiles.get(i);
p.display();
p.move();
}
Miles.display();
scorePanel();
}

void keyPressed() {
if (key == 'w') {
Miles.move('w');
} else if (key == 's') {
Miles.move('s');
} else if (key == 'a') {
Miles.move('a');
} else if (key == 'd') {
Miles.move('d');
}
}
void mousePressed() {
float dx = mouseX - Miles.x;
float dy = mouseY - Miles.y;
float mag = sqrt(dx*dx + dy*dy);

if (mag > 0) {
dx /= mag;
dy /= mag;

float speed = 5;
projectiles.add(new ProjecTile(Miles.x, Miles.y, dx * speed, dy * speed));
}
}


void scorePanel() {
fill(127, 127);
rectMode(CENTER);
rect(width/2, 30, width, 60);
fill(255);
textSize(80);
textAlign(CENTER);

text("score:"+ score, width/2, 50);
}
