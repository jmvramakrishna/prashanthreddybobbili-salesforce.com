public class panelexample2 {
    public list<selectoption> nsoptions{set;get;}
    public list<selectoption> soptions{set;get;}
    public set<string> notselected{set;get;}
     public set<string> selected{set;get;}
     public list<string> addele{set;get;}
     public list<string> removeele{set;get;}
     public panelexample2(){  
        notselected=new set<string>{'hyd','ban','che'};
            selected=new set<string>();
        nsoptions= new list<selectoption>();
        soptions=new list<selectoption>();
        addele=new list<string>();
        removeele=new list<string>();
         getoption();
        }
     public void getoption(){
        nsoptions.clear();
         soptions.clear();
            selectoption n=new selectoption('none','-none-');
            if(notselected.size()>0)
             {
                for(string s:notselected)
                {
                    selectoption p=new selectoption(s,s);
                    nsoptions.add(p);
                }
             } 
                else
                {
                    nsoptions.add(n);
                }
                 if(selected.size()>0)
                 {
                   for(string s1:selected)
                    {
                      selectoption p1=new selectoption(s1,s1);
                      soptions.add(p1);
                    }
                  } 
                    else 
                   {
                    soptions.add(n);
                   }
                
          }
    public void add(){ 
        notselected.removeall(addele);
        selected.addall(addele);
        getoption();
      }
       public void remove(){ 
        selected.removeall(removeele);
        notselected.addall(removeele);
        getoption();
      }
    

}