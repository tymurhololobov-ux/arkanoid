
public class Vector2 {

  float x;
  float y;

  public Vector2(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public Vector2(Vector2 target) {
    x = target.x;
    y = target.y;
  }

  public void add(Vector2 target) {
    x = x + target.x;
    y = y + target.y;
  }

  public void sub(Vector2 target) {
    x = x - target.x;
    y = y - target.y;
  }

  public void Normalize() {
    float tmp = x*x + y*y;
    tmp = sqrt(tmp);
    x = x/tmp;
    y = y/tmp;
  }
  //public void all(Vector2 playerCoordinats, Vector2 enemyCoordinats, int enemySpeed) {
  //  imageMode(CENTER);
    //playerCoordinats.x = mouseX;
    //playerCoordinats.y = height - 100;

    //Vector2 direction = new Vector2(
    //  playerCoordinats.x - enemyCoordinats.x,
    //  playerCoordinats.y - enemyCoordinats.y
    //  );

    //direction.Normalize();
    //direction.x *= enemySpeed;
    //direction.y *= enemySpeed;

  //  enemyCoordinats.add(direction);

  //  fill(0, 0, 255);
  //  image(player1.playerSprite, playerCoordinats.x, playerCoordinats.y, 70, 70);

  //  fill(255, 0, 0);
  //  ellipse(enemyCoordinats.x, enemyCoordinats.y, 70, 70);
  //  imageMode(CORNERS);
  //}

}
