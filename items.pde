static int size = 0;
public class Items {
  PImage itemSprite;
  String typeItem;
  int size = 0;
  float itemX = 0;
  float itemY = 0;

  public Items(/*String typeItem, PImage itemSprite*/) {
    
  }
    public void add() {
    itemX = random(0 + size, width);
    itemY = 0 - size;
    }
    public void Colision(Player pl) {
    if (mouseX - pl.playerSize / 2 <= itemX + size / 2 &&
      mouseX + pl.playerSize / 2 >= itemX - size / 2 &&
      pl.playerY - pl.playerSize / 2 <= itemY + size / 2 &&
      pl.playerY + pl.playerSize / 2 >= itemY - size / 2
      ) {
      itemX = random(0 + size, width);
      itemY = 500;
      //println("Hello");
    }
  }
}
