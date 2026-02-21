public class Shoot {

  
  TargetType target;
  float shootWidth = 9, shootHeight = 57, x, y, dirY, shootSpeed = 3;
  public PImage shootSprite = loadImage("Lasers/laserRed12.png");
  int counter = 60;

  //Shoot(Vector2 direction, Player coordinates, int Width, int Height, float Speed, PImage shootSprite) {
  //  direction = new Vector2(mouseX, height - 100);
  //  direction.Normalize();
  //  direction.x *= Speed;
  //  direction.y *= Speed;
  //}
  Shoot(int x, int y, int dirY) { //add mask
    this.x = x;
    this.y = y;
    this.dirY = dirY;
    
    //for 
    //create Shoot in shoot array
    for (int i = 0; i < shoot.length; i++){
      if (shoot[i] == null) {
        //do something
        //add to shoot array
        return;
      }
    }
  }

  //public void creatOneShoot(float x, float y) {
  //  shootX = x;
  //  shootY = y;
  //}
  //  public void paint() {
  //  image(shootSprite, (int)shootX, (int)shootY, shootWidth, shootHeight);
  //}
  //public void move() {
  //  shootY += shootSpeed;
  //}

  public boolean check(){
    //if border 
    //or if counter <= 0
    //then false
    //else true
    return true;
  }
 
  
  public void paint(int k) {
    shootX = shootsX.get(k);
    shootY = shootsY.get(k);
    image(shootSprite, (int)shootX, (int)shootY, shootWidth, shootHeight);
  }
  public void move(int k) {
    shootY = shootsY.get(k);
    shootsY.set(k, shootY += shootSpeed);
  }
  public void Colision(Player pl, Enemy enemy, int k) {
    if (mouseX - pl.playerSize / 2 <= shootX + shootWidth / 2 &&
      mouseX + pl.playerSize / 2 >= shootX - shootWidth / 2 &&
      pl.playerY - pl.playerSize / 2 <= shootY + shootHeight / 2 &&
      pl.playerY + pl.playerSize / 2 >= shootY - shootHeight / 2
      ) {
      pl.playerHealt --;
      shootsY.remove(k);
      shootsX.remove(k);
      //println("Hello");
    }
  }


  public void Colision(Player pl, Enemy enemy) {
    if (mouseX - pl.playerSize / 2 <= shootX + shootWidth / 2 &&
      mouseX + pl.playerSize / 2 >= shootX - shootWidth / 2 &&
      pl.playerY - pl.playerSize / 2 <= shootY + shootHeight / 2 &&
      pl.playerY + pl.playerSize / 2 >= shootY - shootHeight / 2
      ) {
      pl.playerHealt --;
      shootY = enemy.y;
      shootX = enemy.x;
      //println("Hello");
    }
    //if(shootY ==height - shootHeight){

    //}
  }
}
enum TargetType {PLAYER, ENEMY}

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
