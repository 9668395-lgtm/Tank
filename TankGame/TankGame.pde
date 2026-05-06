ff// 1 April 2026 | TankGame By Miles Bookstaber
Tank Michael;

void setup() {
size(500,500);
Michael = new Tank();
}

void draw() {
background(900);
Michael.display();
}

void keyPressed() {
if(key == 'w'){
Michael.move('w');
} else if(key == 's') {
Michael.move('s');
} else if(key == 'a') {
  Michael.move('a'); 
} else if(key == 'd') {
  Michael.move('d');
}
}
