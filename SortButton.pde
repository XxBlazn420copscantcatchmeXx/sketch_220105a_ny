import java.util.Collections;

class SortButton extends Button {
  ArrayList<Product> products;
  Comparator<Product> comparator;
  String name;
  
  public SortButton(int x, int y, int w, int h, ArrayList<Product> products, Comparator<Product> comparator, String name) {
    super(x, y, w, h);
    this.products = products;
    this.comparator = comparator;
    this.name = name;
  }
  
  void onClicked(){
    Collections.sort(products, comparator);
  }
  
  void draw(){
    super.draw();
    fill(0);
    textSize(16);
    text(name, x + 5, y + 20);
  }
}
