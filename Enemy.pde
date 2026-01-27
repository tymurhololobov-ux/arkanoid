class Enemy {
  PImage enemySprite;
  int enemySize;
  float x;
  float y;
  float enemySpeed;
  int enemyHealt;

  int enemyShootX;
  int enemyShootY;
  ArrayList<Integer> enemyShootsX = new ArrayList<Integer>();
  ArrayList<Integer> enemyShootsY = new ArrayList<Integer>();
  int t1X, t2X, t1Y, t2Y, s1X, s2X, s1Y, s2Y;
  int shootWidth = 9;
  int shootHeigth = 54;
  boolean isColision = false;
  ArrayList<Boolean> k = new ArrayList<Boolean>();
  int enemyShootWidth = 9;
  int enemyShootHeigth = 57;


  public void paint() {
    image(enemySprite, x, y, enemySize, enemySize);
  }
  public void move() {
    y += enemySpeed;
  }
}
