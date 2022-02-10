import java.util.Comparator;

class PriceComparator implements Comparator<Product> {
  public int compare(Product p1, Product p2){
    return Integer.compare(p1.price, p2.price);
  }
}
