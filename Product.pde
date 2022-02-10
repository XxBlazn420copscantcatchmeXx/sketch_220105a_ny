class Product {
  String name;
  int price;
  int stock;
  
  public Product(String name, int price, int stock) {
    this.name = name;
    this.price = price;
    this.stock = stock;
  }
  
  String getStockAsString(){
   return "Tilbage: " + stock; 
  }
}
