public class Shoot {
  Vector2 position, direction, size;
  TargetType target;
  ArrayList<Integer> shootsX = new ArrayList<Integer>();
  ArrayList<Integer> shootsY = new ArrayList<Integer>();
  int shootX, shootY, shootWidth = 9, shootHeight = 57, x, y, shootSpeed = 3;
  PImage shootSprite = loadImage("laserRed12.png");
  PImage sprite;

  Shoot(Vector2 direction, Player coordinates, int Width, int Height, float Speed, PImage shootSprite) {
    direction = new Vector2(mouseX, height - 100);
    direction.Normalize();
    direction.x *= Speed;
    direction.y *= Speed;
  }
  Shoot(Vector2 direction, Vector2 position, int Width, int Height) {
    direction = new Vector2(mouseX, height - 100);
    direction.Normalize();
    direction.x *= shootSpeed;
    direction.y *= shootSpeed;
  }

  public void creatOneShoot(int x, int y) {
    shootX = x;
    shootY = y;
  }

  public void paint() {
    image(shootSprite, (int)shootX, (int)shootY, shootWidth, shootHeight);
  }
  public void move() {
    shootY += shootSpeed;
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
