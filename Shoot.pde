class Shoot {

  float shootWidth = 9;
  float shootHeight = 57;

  float x;
  float y;
  float dirY;
  float shootSpeed = 5;

  boolean fromPlayer;

  PImage shootSprite;

  Shoot(float x, float y, float dirY, PImage shootSprite, boolean fromPlayer) {
    this.x = x;
    this.y = y;
    this.dirY = dirY;
    this.shootSprite = shootSprite;
    this.fromPlayer = fromPlayer;
  }

  void move() {
    y += dirY * shootSpeed;
  }

  void paint() {
    image(shootSprite, x, y, shootWidth, shootHeight);
  }

  boolean isOffScreen() {
    return y < -shootHeight || y > height + shootHeight;
  }

  boolean colisionEnemy(Enemy enemy) {

    float t1X = enemy.x - enemy.enemySize / 2;
    float t2X = enemy.x + enemy.enemySize / 2;
    float t1Y = enemy.y - enemy.enemySize / 2;
    float t2Y = enemy.y + enemy.enemySize / 2;

    float s1X = x - shootWidth / 2;
    float s2X = x + shootWidth / 2;
    float s1Y = y - shootHeight / 2;
    float s2Y = y + shootHeight / 2;

    return (s1X <= t2X && s2X >= t1X &&
            s1Y <= t2Y && s2Y >= t1Y);
  }

  boolean colisionPlayer(Player p) {

    float p1X = mouseX - p.playerSize / 2;
    float p2X = mouseX + p.playerSize / 2;
    float p1Y = p.playerY - p.playerSize / 2;
    float p2Y = p.playerY + p.playerSize / 2;

    float s1X = x - shootWidth / 2;
    float s2X = x + shootWidth / 2;
    float s1Y = y - shootHeight / 2;
    float s2Y = y + shootHeight / 2;

    return (s1X <= p2X && s2X >= p1X &&
            s1Y <= p2Y && s2Y >= p1Y);
  }
}
