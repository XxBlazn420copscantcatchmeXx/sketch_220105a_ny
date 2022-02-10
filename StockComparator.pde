import java.util.Comparator;

class StockComparator implements Comparator<Product> {
  public int compare(Product p1, Product p2){
    return Integer.compare(p1.stock, p2.stock);
  }
}
