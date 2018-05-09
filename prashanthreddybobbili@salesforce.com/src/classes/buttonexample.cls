public class buttonexample {
    public string result{set;get;}
    public void show(){
        result='this is method calling';
    }
    public Pagereference mypage(){
        Pagereference p= new pagereference('/apex/page1');
        return p;
    }
    
      public Pagereference mypage1(){
        Pagereference p= new pagereference('/apex/page2');
        return p;
    }
    

}