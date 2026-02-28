class Enemy {

  PImage enemySprite;

  int enemySize;
  float x;
  float y;
  float enemySpeed;

  int shootCounter = 0;

  void move() {
    y += enemySpeed;

    if (y > height + enemySize) {
      resetPosition();
    }

    shootCounter++;
  }

  boolean canShoot() {
    if (shootCounter > 120) {
      shootCounter = 0;
      return true;
    }
    return false;
  }

  void paint() {
    image(enemySprite, x, y, enemySize, enemySize);
  }

  void resetPosition() {
    y = -enemySize;
    x = random(enemySize, width - enemySize);
  }
}
