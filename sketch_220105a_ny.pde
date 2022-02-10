import java.util.Collections;

ArrayList<Product> products;
int startX = 5;
int startY = 5;
int rows = 4;
int columns = 2;
int productsPerPage = rows * columns;
int productButtonW = 250;
int productButtonH = 100;
int padding = 10;
boolean itemMenuMenuOpen = false;

// Main menu
PageController pageController;
PageButton previousPage;
PageButton nextPage;

SortButton priceSort;
SortButton nameSort;
SortButton stockSort;

TextButton openItemMenu;

boolean descending = false;
TextButton descendingButton;

// Add item menu
TextField active;

TextField itemName;
TextField price;
TextField stock;

TextButton addItem;
TextButton cancelItem;


void setup(){
  size(550, 550);
  products = new ArrayList<Product>();
  products.add(new Product("Fjernsyn", 6500, 5));
  products.add(new Product("Vaskemaskine", 4700, 7));
  products.add(new Product("Blender", 900, 25));
  products.add(new Product("Køleskab", 5555, 9));
  products.add(new Product("Telefon", 9250, 13));
  products.add(new Product("Opvaskemaskine", 6500, 19));
  products.add(new Product("Laptop", 15000, 3));
  products.add(new Product("Hæve Sænkebord", 2700, 15));
  products.add(new Product("Opvaskemaskine", 6500, 17));
  products.add(new Product("Tablet", 3000, 22));
  
  int sortWidth = 50;
  int sortHeight = 30;
  
  openItemMenu = new TextButton(startX, 510, 130, 30, "Tilføj produkt");
  priceSort = new SortButton(startX, startY, sortWidth, sortHeight, products, new PriceComparator(), "Pris");
  priceSort.onClicked();
  priceSort.setSelected(true);
  nameSort = new SortButton(startX + (sortWidth + padding), startY, sortWidth, sortHeight, products, new NameComparator(), "Navn");
  stockSort = new SortButton(startX + (sortWidth + padding) * 2, startY, sortWidth, sortHeight, products, new StockComparator(), "Antal");
  descendingButton = new TextButton(startX - padding + columns * (productButtonW + padding) - 100, startY, 100, sortHeight, "Stigende");
  
  startY += 30 + padding;
  
  calculateNumPages();
  
  //String placeholder, int x, int y, int w, int h
  itemName = new TextField("Produkt Navn", 20, 20, 200, 30, false);
  price = new TextField("Produkt Pris", 20, 50, 200, 30, true);
  stock = new TextField("Antal på lager", 20, 80, 200, 30, true);
  
  cancelItem = new TextButton(startX, 510, 130, 30, "Annuller");
  addItem = new TextButton(startX + 140, 510, 130, 30, "Tilføj Produkt"); 
}

void calculateNumPages(){
  double pagesRequired = products.size() / (double) productsPerPage;
  pageController = new PageController(0, (int) Math.ceil(pagesRequired) - 1);
  int x = startX + productButtonW;
  int y = startY + rows * (padding + productButtonH) + 30;
  previousPage = new PageButton(x - 40, y - 20, pageController, false);
  nextPage = new PageButton(x + 15 + (int)textWidth(pageController.getCurrentPageString()), y - 20, pageController, true);
}

void mousePressed(){
  if(itemMenuMenuOpen){
    boolean close = false;
    if(itemName.checkClicked()){
      active = itemName;
    }
    else if(price.checkClicked()){
      active = price;
    }
    else if(stock.checkClicked()){
      active = stock; 
    }
    else if(cancelItem.checkClicked()){
      close = true;
    }
    else if(addItem.checkClicked()){
      String productName = itemName.getText();
      int productPrice = price.getNumber();
      int productStock = stock.getNumber();
      
      if(productName.length() > 0 && productPrice > 0 && productStock >= 0){
        products.add(new Product(productName, productPrice, productStock));
        close = true;
      }
    }
    
    if(close){
      itemName.resetText();
      price.resetText();
      stock.resetText();
      active = null;
      itemMenuMenuOpen = false; 
    }
  }
  else{
    if(priceSort.checkClicked()){
      priceSort.setSelected(true);
      nameSort.setSelected(false);
      stockSort.setSelected(false);
      sortDirection();
      return;
    }
    if(nameSort.checkClicked()){
      priceSort.setSelected(false);
      nameSort.setSelected(true);
      stockSort.setSelected(false);
      sortDirection();
      return;
    }
    if(stockSort.checkClicked()){
      priceSort.setSelected(false);
      nameSort.setSelected(false);
      stockSort.setSelected(true);
      sortDirection();
      return;
    }
    if(descendingButton.checkClicked()){
      descending = !descending;
      descendingButton.text = descending ? "Aftagende" : "Stigende";
      Collections.reverse(products);
    }
    if(openItemMenu.checkClicked()){
      itemMenuMenuOpen = true;
    }
    if(nextPage.checkClicked())
      return;
    if(previousPage.checkClicked())
      return;
  }
}

void keyPressed(){
  if(active != null){
    active.keyPressed();
  }
}

void sortDirection(){
  if(descending){
    Collections.reverse(products);
  }
}

void draw(){
  background(0, 51, 102);
  
  if(itemMenuMenuOpen){    
    itemName.draw(itemName == active);
    price.draw(price == active);
    stock.draw(stock == active);
    
    cancelItem.draw();
    addItem.draw();
  }
  else {
    int firstProductIndex = pageController.pageIndex * productsPerPage;
    for(int i=firstProductIndex; i < products.size() && i < firstProductIndex + productsPerPage; i++){
      int relativeIndex = i-firstProductIndex;
      int row = relativeIndex / columns;
      int column = relativeIndex % columns;
      Product product = products.get(i);
      Button button = new ProductButton(startX + (padding + productButtonW) * column, startY + (padding + productButtonH) * row, productButtonW, productButtonH, product);
      button.draw();
    }
    
    fill(0);
    textSize(16);
    text(pageController.getCurrentPageString(), startX + productButtonW, startY + rows * (padding + productButtonH) + 30);
    
    openItemMenu.draw();
    priceSort.draw();
    nameSort.draw();
    stockSort.draw();
    descendingButton.draw();
    
    previousPage.draw();
    nextPage.draw();
  }
}
