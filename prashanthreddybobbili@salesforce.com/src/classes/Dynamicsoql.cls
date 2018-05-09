public class Dynamicsoql {
    public list<selectoption>accname{set;get;}
    public list<selectoption>acc{set;get;}
    public list<string>names;
    public list<string>operators;
    public Dynamicsoql(){
        names=new list<string>{'name','industry','phone'};
            operators=new list<string>{'=','!=','<','>'};
        accname=new list<selectoption>();
        acc=new list<selectoption>();
        getoptions();
    }
    public void getoptions(){
        accname.clear();
    acc.clear();
    selectoption s=new selectoption('none','none');
        accname.add(S);
        acc.add(s);
    }
    

}