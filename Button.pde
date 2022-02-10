class Button{
  int x;
  int y;
  int w;
  int h;
  boolean selected = false;
  
  public Button(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void setSelected(boolean selected){
    this.selected = selected; 
  }
  
  void onClicked(){
    
  }
  
  boolean checkClicked(){
    if(isHovered()){
      onClicked();
      return true;
    }
    return false;
  }
  
  boolean isHovered(){
    return x <= mouseX && mouseX < x+w && y <= mouseY && mouseY < y+h;
  }
  
  void draw(){
    if(selected || isHovered()){
      fill(153, 204, 255);
    }
    else{
      fill(255);
    }
    stroke(0);
    rect(x, y, w, h);
  }
}
