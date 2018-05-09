public class pp {
    public list<selectoption>options{set;get;}
    public string selected{set;get;}
    public string result{set;get;}
    
    public  pp(){
        selectoption s=new selectoption('-none','cc');
        options.add(s);
        selectoption s1=new selectoption('ts','hyd');
         options.add(s1);
        selectoption s2=new selectoption('tn','ch');
        options.add(s2);
            
    }
    public void show()
    {
        result='ur selected'+selected;
    }
    
    
    

}