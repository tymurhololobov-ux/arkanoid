class Player {

  PImage playerSprite;
  PImage bg;
  PImage[] playerHealtSprite = new PImage[4];

  int playerSize = 70;
  int playerY = 500;
  int playerHealt = 3;

  Player() {
    playerSprite = loadImage("playerShip1_green.png");

    playerHealtSprite[0] = loadImage("UI/numeral0.png");
    playerHealtSprite[1] = loadImage("UI/numeral1.png");
    playerHealtSprite[2] = loadImage("UI/numeral2.png");
    playerHealtSprite[3] = loadImage("UI/numeral3.png");
  }

  void move() {
    image(playerSprite, mouseX, playerY, playerSize, playerSize);
  }

  void paintInterfacePlayer() {
    image(playerHealtSprite[playerHealt], 20, 20, 40, 40);
  }

  void colisionCheck(Enemy[] Enemies) {

    float p1X = mouseX - playerSize / 2;
    float p2X = mouseX + playerSize / 2;
    float p1Y = playerY - playerSize / 2;
    float p2Y = playerY + playerSize / 2;

    for (int i = 0; i < Enemies.length; i++) {

      float t1X = Enemies[i].x - Enemies[i].enemySize / 2;
      float t2X = Enemies[i].x + Enemies[i].enemySize / 2;
      float t1Y = Enemies[i].y - Enemies[i].enemySize / 2;
      float t2Y = Enemies[i].y + Enemies[i].enemySize / 2;

      if (p1X <= t2X && p2X >= t1X &&
          p1Y <= t2Y && p2Y >= t1Y) {

        Enemies[i].resetPosition();
        playerHealt--;
      }
    }

    playerHealt = playerHealt < 0 ? (playerHealt = 0) : (playerHealt = playerHealt);
    
    if(playerHealt == 0) bg = loadImage("Backgrounds/game over.png");
  }
}
