public class Shoot {
  Vector2 position, direction, size;
  TargetType target;
  ArrayList<Float> shootsX = new ArrayList<Float>();
  ArrayList<Float> shootsY = new ArrayList<Float>();
  float shootX, shootY, shootWidth = 9, shootHeight = 57, x, y, shootSpeed = 3;
  PImage shootSprite = loadImage("laserRed12.png");


  //Shoot(Vector2 direction, Player coordinates, int Width, int Height, float Speed, PImage shootSprite) {
  //  direction = new Vector2(mouseX, height - 100);
  //  direction.Normalize();
  //  direction.x *= Speed;
  //  direction.y *= Speed;
  //}
  //Shoot(Vector2 direction, Vector2 position, int Width, int Height) {
  //  direction = new Vector2(mouseX, height - 100);
  //  direction.Normalize();
  //  direction.x *= shootSpeed;
  //  direction.y *= shootSpeed;
  //}

  public void creatOneShoot(float x, float y,) {
    shootX = x;
    shootY = y;
  }

  public void paint() {
    image(shootSprite, (int)shootX, (int)shootY, shootWidth, shootHeight);
  }
  public void move() {
    shootY += shootSpeed;
  }

  public void Colision(Player pl) {
    if (pl.playerX - pl.playerSize <= shootX + shootWidth &&
      pl.playerX + pl.playerSize >= shootX - shootWidth &&
      pl.playerY - pl.playerSize <= shootY + shootHeight &&
      pl.playerY + pl.playerSize >= shootY - shootHeight
      ) {
    }
  }
}
enum TargetType {
  PLAYER("Player"),
    ENEMY("Enemy");

  private final String targetType;

  TargetType(String targetType) {
    this.targetType = targetType;
  }

  public String getTargetType() {
    return targetType;
  }
}

enum ShootType {
  RED("laserRed12.png"),
    BLUE("laserBlue13.png"),
    GREEN("Lasers/laserGreen11.png");

  private final String ShootType;

  ShootType(String ShootType) {
    this.ShootType = ShootType;
  }

  public String getShootType() {
    return ShootType;
  }
}
