class TextField extends Button {
  String text;
  String placeholder;
  
  int cursorPosition;
  int cursorTimer;
  
  color backgroundColor = color(245, 245, 245);
  color hoveredColor = color(236, 236, 236);
  color activeColor = color(220, 220, 220);
  
  color inactiveTextColor = color(98);
  color activeTextColor = color(116, 29, 240);
  
  boolean numbersOnly;
  
  public TextField(String placeholder, int x, int y, int w, int h, boolean numbersOnly){
    super(x, y, w, h);
    this.text = "";
    this.placeholder = placeholder;
    this.numbersOnly = numbersOnly;
  }
  
  String getText(){
    return text;
  }
  
  void resetText(){
    text = "";
    cursorPosition = 0;
  }
  
  int getNumber(){
    return Integer.parseInt(text);
  }
  
  void draw(boolean isActive){
    if(isActive){
      fill(activeColor);
    }
    else if(isHovered()){
      fill(hoveredColor);
    }
    else{
     fill(backgroundColor);
    }
    
    rect(x, y, w, h);
    
    textSize(16);
    float textY = y+h*0.5+5;

    if(isActive){
      fill(activeTextColor);
      stroke(activeTextColor);
      
      if(cursorTimer < 10){
        float lineX = x + 5 + textWidth(text.substring(0, cursorPosition));
        line(lineX, textY - 15, lineX, textY + 3);
      }
    }
    else{
      fill(inactiveTextColor);
      stroke(inactiveTextColor);
    }
    
    if(text.length() == 0){
      text(placeholder, x + 5, textY);
    }
    else{
      text(text, x + 5, textY); 
    }
    
    cursorTimer = (cursorTimer+1)%20;
  }
  
  void keyPressed(){
    switch(key){
      case BACKSPACE:
        if(cursorPosition == 0){
          return;
        }
        text = text.substring(0, cursorPosition-1) + text.substring(cursorPosition);
        cursorPosition = max(0, cursorPosition-1);
      case DELETE:
        if(cursorPosition == text.length()){
          return;
        }
        text = text.substring(0, cursorPosition) + text.substring(cursorPosition+1);
      case CODED:
        if(keyCode == LEFT){
          cursorPosition = max(0, cursorPosition-1);
        }
        else if(keyCode == RIGHT){
          cursorPosition = min(cursorPosition+1, text.length());
        }
      default:
        if((key >= '0' && key <= '9') || (!numbersOnly && ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z') || (key >= 'Æ' && key <= 'Å') || (key >= 'æ' && key <= 'å')))){
          text = text.substring(0, cursorPosition) + (char)key +  text.substring(cursorPosition);
          cursorPosition++;
        }
    }
  }
}
