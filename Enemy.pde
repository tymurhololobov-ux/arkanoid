class Enemy {
  PImage enemySprite;
  int enemySize;
  float x;
  float y;
  float enemySpeed;
  int enemyHealt;


  //int t1X, t2X, t1Y, t2Y, s1X, s2X, s1Y, s2Y;
  boolean isColision = false;
  //ArrayList<Boolean> k = new ArrayList<Boolean>();
  int enemyShootWidth = 9;
  int enemyShootHeigth = 57;
  
  int counter;

  public void paint() {
    image(enemySprite, x, y, enemySize, enemySize);
  }
  
  public void move() {
    y += enemySpeed;
    counter++;
    if (counter == 100){
      //new Shoot(); todo
      counter = 0;
    }
  }
  

}
