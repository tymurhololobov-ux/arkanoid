  static int size = 0;
public class Items {
  PImage itemSprite;
  String typeItem;

  public Items(String typeItem, PImage itemSprite) {
    this.itemSprite = itemSprite;
    this.typeItem = typeItem;
    size ++;
  }
}
