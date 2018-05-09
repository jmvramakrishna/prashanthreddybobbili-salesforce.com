public class listexamlexample2 {
    public list<Account>accs{set;get;}
    public Account newacc{set;get;}
    public integer  index{set;get;}
    public listexamlexample2  (){
        accs=new list <account>();
        newacc=new Account();
             }
    public void addme(){
        accs.add(newacc); 
         newacc=new Account();
    }
      public void addat(){
        accs.add(index,newacc);
          newacc=new Account();
    }
      public void removeat(){
        accs.remove(index);
          newacc=new Account();
    }
      public void setat(){
        accs.set(index,newacc);
           newacc=new Account();
    }
      public void sort(){
        accs.sort();
    }
      public void clear(){
        accs.clear();
    }

}