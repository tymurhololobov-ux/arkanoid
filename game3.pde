Player player1;
Enemy[] Enemies = new Enemy[5];

ArrayList<Shoot> shoots = new ArrayList<Shoot>();

//PImage bg;
PImage playerShootSprite;
PImage enemyShootSprite;

void setup() {
  size(600, 600);

  playerShootSprite = loadImage("Lasers/laserGreen12.png");
  enemyShootSprite = loadImage("Lasers/laserRed12.png");

  player1 = new Player();
  player1.bg = loadImage("Backgrounds/purple.png");

  for (int i = 0; i < Enemies.length; i++) {

    Enemies[i] = new Enemy();

    if (i < 3) {
      Enemies[i].enemySprite = loadImage("Enemies/enemyRed5.png");
      Enemies[i].enemySpeed = 0.5;
    } else if (i == 3) {
      Enemies[i].enemySprite = loadImage("Enemies/enemyGreen5.png");
      Enemies[i].enemySpeed = 1;
    } else {
      Enemies[i].enemySprite = loadImage("Enemies/enemyBlack5.png");
      Enemies[i].enemySpeed = 2;
    }

    Enemies[i].enemySize = 50;
    Enemies[i].x = random(Enemies[i].enemySize, width - Enemies[i].enemySize);
    Enemies[i].y = -Enemies[i].enemySize;
  }
}

void draw() {

  imageMode(CORNERS);
  image(player1.bg, 0, 0, width, height);

  imageMode(CENTER);

  player1.move();
  player1.paintInterfacePlayer();

  for (int i = 0; i < Enemies.length; i++) {

    Enemies[i].move();
    Enemies[i].paint();

    if (Enemies[i].canShoot()) {
      Shoot enemyShoot = new Shoot(
        Enemies[i].x,
        Enemies[i].y,
        1,
        enemyShootSprite,
        false
        );
      shoots.add(enemyShoot);
    }
  }

  for (int i = shoots.size() - 1; i >= 0; i--) {

    Shoot s = shoots.get(i);

    s.move();
    s.paint();

    if (s.isOffScreen()) {
      shoots.remove(i);
      continue;
    }

    if (s.fromPlayer) {
      for (int j = 0; j < Enemies.length; j++) {
        if (s.colisionEnemy(Enemies[j])) {
          Enemies[j].resetPosition();
          shoots.remove(i);
          break;
        }
      }
    } else {
      if (s.colisionPlayer(player1)) {
        player1.playerHealt--;
        shoots.remove(i);
      }
    }
  }

  player1.colisionCheck(Enemies);
}

void mouseClicked() {
  Shoot newShoot = new Shoot(
    mouseX,
    player1.playerY,
    -1,
    playerShootSprite,
    true
    );
  shoots.add(newShoot);
}
