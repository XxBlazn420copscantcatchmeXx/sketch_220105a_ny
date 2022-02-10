import java.util.Comparator;

class NameComparator implements Comparator<Product> {
  public int compare(Product p1, Product p2){
    return p1.name.compareTo(p2.name);
  } 
}
