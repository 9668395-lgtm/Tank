// 1 April 2026 | TankGame by Miles Bookstaber
Tank Miles;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("bkgd.png");
  Miles = new Tank(); 
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  if (bg != null) image(bg, 0, 0);

  // Distribute obstacles on timer
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(100, 100, int(random(1, 10)), 10));
    objTimer.start();
  }

  // Distribute powerups on timer
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }

  // Display and remove power ups (Looping backwards to prevent skipping)
  for (int i = powerups.size() - 1; i >= 0; i--) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    
    if (pu.reachedEdge()) {
      powerups.remove(i);
      continue; 
    }
    
    if (pu.intersect(Miles)) {
      if (pu.type == 'h') Miles.health += 100;
      else if (pu.type == 'a') Miles.laserCount += 100;
      else if (pu.type == 't') Miles.turretCount += 1;
      powerups.remove(i);
    }
  }

  // Displays and removes obstacles
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    
    if (o.reachedEdge()) {
      obstacles.remove(i);
      continue;
    }
    
    if (Miles.intersect(o)) {
       // Add health reduction logic here: Miles.health -= 10;
    }
  }

  // Render and detect projectile collision
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();

    boolean hit = false;
    for (int j = obstacles.size() - 1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score += 100;
        obstacles.remove(j);
        hit = true;
        break; 
      }
    }

    if (hit || p.reachedEdge()) {
      projectiles.remove(i);
    }
  }

  Miles.display();
  scorePanel();
}

void keyPressed() {
  Miles.move(key); // Simplified: pass the key directly to the tank
}

void mousePressed() {
  // Calculate trajectory
  float dx = mouseX - Miles.x;
  float dy = mouseY - Miles.y;
  float mag = sqrt(dx*dx + dy*dy);
  
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 5;

    if (Miles.turretCount == 1) {
      projectiles.add(new Projectile(Miles.x, Miles.y, dx * speed, dy * speed));
    } else if (Miles.turretCount >= 2) {
      // Double shot logic
      projectiles.add(new Projectile(Miles.x - 10, Miles.y, dx * speed, dy * speed));
      projectiles.add(new Projectile(Miles.x + 10, Miles.y, dx * speed, dy * speed));
    }
  }
} // Added missing closing brace for mousePressed

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(20); // Scaled down slightly for fit
  textAlign(CENTER);
  text("Score: " + score, width/2, 25);
  text("Health: " + Miles.health, width/2 - 150, 25);
  text("Ammo: " + Miles.laserCount, width/2 + 150, 25);
}
