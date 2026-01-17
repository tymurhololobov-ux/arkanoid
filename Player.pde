class Player {
  PImage playerSprite;
  PImage playerHealtSprite[] = new PImage[4];
  int LifeCountSpriteCoordinats = 0;
  int LifeCountSpriteSize = 40;
  int playerSize = 70;
  int playerX = mouseX;
  int playerY = 500;
  int playerHealt = 3;
  PImage shootSprite;
  int t1X, t2X, t1Y, t2Y;
  int shootX;
  int shootY;
  ArrayList<Integer> playerShootsX = new ArrayList<Integer>();
  ArrayList<Integer> playerShootsY = new ArrayList<Integer>();


  int shootWidth = 9;
  int shootHeigth = 54;


  public Player() {
    playerHealtSprite[0] = loadImage("UI/numeral0.png");
    playerHealtSprite[1] = loadImage("UI/numeral1.png");
    playerHealtSprite[2] = loadImage("UI/numeral2.png");
    playerHealtSprite[3] = loadImage("UI/numeral3.png");
  }

  public void move() {
    image(playerSprite, mouseX, playerY, playerSize, playerSize);
  }

  private boolean colision(Enemy target) {
    t1X = (int)target.x - (int)target.enemySize / 2;
    t2X = (int)target.x + (int)target.enemySize / 2;
    t1Y = (int)target.y - (int)target.enemySize / 2;
    t2Y = (int)target.y + (int)target.enemySize / 2;
    if (p1X <= t2X && p2X >= t1X && p1Y <= t2Y && p2Y >= t1Y) {
      return true;
    }
    return false;
  }
  public void paintInterfacePlayer() {
    if (playerHealt == 3) {
      image(playerHealtSprite[3], LifeCountSpriteCoordinats, LifeCountSpriteCoordinats, LifeCountSpriteSize, LifeCountSpriteSize);
    } else if (playerHealt == 2) {
      image(playerHealtSprite[2], LifeCountSpriteCoordinats, LifeCountSpriteCoordinats, LifeCountSpriteSize, LifeCountSpriteSize);
    } else if (playerHealt == 1) {
      image(playerHealtSprite[1], LifeCountSpriteCoordinats, LifeCountSpriteCoordinats, LifeCountSpriteSize, LifeCountSpriteSize);
    } else if (playerHealt == 0) {
      image(playerHealtSprite[0], LifeCountSpriteCoordinats, LifeCountSpriteCoordinats, LifeCountSpriteSize, LifeCountSpriteSize);
    } else if (playerHealt == 4) {
      playerHealt = 3;
    }
  }

  public void colisionCheck(Enemy[] Enemies) {
    for (int i = 0; i < Enemies.length; i++) {
      if (colision(Enemies[i])) {
        Enemies[i].y = 0 - Enemies[i].enemySize;
        Enemies[i].x = random(Enemies[i].enemySize, width);
        if (Enemies[i].x >= width + Enemies[i].enemySize) {
          Enemies[i].x = Enemies[i].x - Enemies[i].enemySize;
        } else {
          Enemies[i].x = Enemies[i].x + Enemies[i].enemySize;
        }
        playerHealt --;
      }
    }
    if (playerHealt < 0) {
      playerHealt = 0;
    }
  }
  public void creatOneShoot(PImage shootSprite) {
    shootX = mouseX;
    image(shootSprite, shootX, shootY);
    playerShootsX.add(shootX);
    playerShootsY.add(playerY);
  }


  public void shootsMove() {
    for (int i = 0; i < playerShootsY.size(); i++) {
      shootY = playerShootsY.get(i);
      image(shootSprite, playerShootsX.get(i), shootY);
      shootY -= 3;
      playerShootsY.set(i, shootY);
      if (playerShootsY.get(i) <= 0 - shootHeigth) {
        playerShootsX.remove(i);
        playerShootsY.remove(i);
      }
    }
    println(playerShootsY.size());
  }
  public boolean shootsColision(Enemy target) {

    t1X = (int)target.x - (int)target.enemySize / 2;
    t2X = (int)target.x + (int)target.enemySize / 2;
    t1Y = (int)target.y - (int)target.enemySize / 2;
    t2Y = (int)target.y + (int)target.enemySize / 2;
    for (int i = 0; i < playerShootsY.size(); i++) {
      s1Y = playerShootsY.get(i) - shootHeigth / 2;
      s2Y = playerShootsY.get(i) + shootHeigth / 2;
      s1X = playerShootsX.get(i) - shootWidth / 2;
      s2X = playerShootsX.get(i) + shootWidth / 2;
      if (s1X <= t2X && s2X >= t1X && s1Y <= t2Y && s2Y >= t1Y) {
        playerShootsX.remove(i);
        playerShootsY.remove(i);
        return true;
      }
    }
    return false;
  }

  public void shootsColision1(Enemy[] Enemies) {
    for (int i = 0; i < Enemies.length; i++)
      if (shootsColision(Enemies[i])) {
        Enemies[i].y = 0 - Enemies[i].enemySize;
        Enemies[i].x = random(0 + Enemies[i].enemySize / 2, width - Enemies[i].enemySize / 2);
      }
    if (playerHealt < 0) {
      playerHealt = 0;
    }
  }
}
