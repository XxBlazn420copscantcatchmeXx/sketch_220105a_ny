class TextButton extends Button {
  String text;
  
  public TextButton(int x, int y, int w, int h, String text){
    super(x, y, w, h);
    this.text = text;
  }
  
  void draw(){
    super.draw();
    fill(0);
    textSize(16);
    text(text, x + 5, y + 19);
  }
}
