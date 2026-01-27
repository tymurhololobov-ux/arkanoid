Enemy easyEnemy1;//3
Enemy easyEnemy2;//3
Enemy easyEnemy3;//3
Enemy normalEnemy;//1
Enemy hardEnemy;//1
Enemy[] Enemies = new Enemy[] { easyEnemy1, easyEnemy2, easyEnemy3, normalEnemy, hardEnemy };

int p1X, p2X, p1Y, p2Y, s1X, s2X, s1Y, s2Y, e1X, e2X, e1Y, e2Y;
int counter = 0; 

Shoot shoot;
Player player1;
int t = 0;

PImage bg;
void setup() {
  size(600, 600);
  bg = loadImage("Backgrounds/purple.png");
  
  shoot = new Shoot();
  player1 = new Player();
  player1.playerSprite = loadImage("playerShip1_green.png");
  player1.shootSprite = loadImage("Lasers/laserGreen11.png");

  for (int i = 0; i < Enemies.length; i++) {
    Enemies[i] = new Enemy();
    if (i < 3) {
      Enemies[i].enemySprite = loadImage("Enemies/enemyRed5.png");
      Enemies[i].enemySpeed = 0.5;
    } else if (i <= 3) {
      Enemies[i].enemySprite = loadImage("Enemies/enemyGreen5.png");
      Enemies[i].enemySpeed = 1;
    } else {
      Enemies[i].enemySprite = loadImage("Enemies/enemyBlack5.png");
      Enemies[i].enemySpeed = 2;
    }
    Enemies[i].x = (int)random(0 + Enemies[i].enemySize, width - Enemies[i].enemySize);
    Enemies[i].y = 0 - Enemies[i].enemySize;
    Enemies[i].enemySize = 50;
  }
  //Lasers/laserRed12.png
}
void draw() {
  imageMode(CORNERS);
  image(bg, 0, 0, width, height);

  player1.paintInterfacePlayer();

  imageMode(CENTER);

  p1X = mouseX - player1.playerSize / 2;
  p2X = mouseX + player1.playerSize / 2;
  p1Y = player1.playerY - player1.playerSize / 2;
  p2Y = player1.playerY + player1.playerSize / 2;


  for (int i = 0; i < Enemies.length; i++) {
    Enemies[i].paint();
    Enemies[i].move();
    if (Enemies[i].y > height + Enemies[i].enemySize) {
      Enemies[i].y = 0 - Enemies[i].enemySize;
      Enemies[i].x = random(Enemies[i].enemySize, width - Enemies[i].enemySize);
    }
  }
  counter++;
    if (counter % 30 == 0) {
      shoot.creatOneShoot((int)Enemies[0].x, (int)Enemies[0].y);
      t++;
    }
      if (t != 0) {
    shoot.paint();
    shoot.move();
  }

  for (int i = 0; i < player1.playerShootsY.size(); i++) {
    s1Y = player1.playerShootsY.get(i) - player1.shootHeigth / 2;
    s2Y = player1.playerShootsY.get(i) + player1.shootHeigth / 2;
    s1X = player1.playerShootsX.get(i) - player1.shootWidth / 2;
    s2X = player1.playerShootsX.get(i) + player1.shootWidth / 2;
  }

  player1.move();
  player1.colisionCheck(Enemies);
  player1.shootsMove();
  if (player1.playerShootsY.size() > 0) {
    player1.shootsColision1(Enemies);
  }
}
void mouseClicked() {
  player1.creatOneShoot(player1.shootSprite);
}
