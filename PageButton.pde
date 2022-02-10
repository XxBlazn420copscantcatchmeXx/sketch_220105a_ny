class PageButton extends Button{
 PageController pageController;
 boolean next;
 
 public PageButton(int x, int y, PageController pageController, boolean next){
   super(x, y, 30, 30);
   this.pageController = pageController;
   this.next = next;
 }
 
 void onClicked(){
   super.onClicked();
   if(next){
     pageController.nextPage();
   }
   else{
     pageController.previousPage();
   }
 }
 
 void draw(){
   super.draw();
   fill(0);
   textSize(16);
   text(next ? "->" : "<-", x + 5, y + 19);
 }
}
