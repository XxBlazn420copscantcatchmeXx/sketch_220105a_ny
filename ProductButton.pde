class ProductButton extends Button {
  Product product;
  
  public ProductButton(int x, int y, int w, int h, Product product){
    super(x, y, w, h);
    this.product = product;
  }
  
  void draw(){
    super.draw();
    fill(0);
    textSize(18);
    text(product.name, x + 5, y + 20);
    text(product.price, x + w - textWidth(String.valueOf(product.price)) - 5, y + 20);
    textSize(11);
    text(product.getStockAsString(), x + w - textWidth(String.valueOf(product.getStockAsString())) - 5, y + h - 10);
  }
}
