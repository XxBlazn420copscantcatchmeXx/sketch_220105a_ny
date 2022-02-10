class PageController{
  int pageIndex;
  int maxIndex;
  
  public PageController(int pageIndex, int maxIndex){
    this.pageIndex = pageIndex;
    this.maxIndex = maxIndex;
  }
  
  void nextPage(){
    if(pageIndex < maxIndex){
      pageIndex++;
    }
  }
  
  void previousPage(){
    if(pageIndex > 0){
      pageIndex--;
    }
  }
  
  String getReadablePageIndex(){
    return String.valueOf(pageIndex + 1);
  }
  
  String getCurrentPageString(){
   return getReadablePageIndex() + '/' + String.valueOf(maxIndex + 1);
  }
}
