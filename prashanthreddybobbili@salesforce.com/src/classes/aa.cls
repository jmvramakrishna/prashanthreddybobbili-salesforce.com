public class aa {
	// this is test
    public map<string,list<string>>citymap{set;get;}
    public list<selectoption>cities{set;get;}
    public list<selectoption>places{set;get;}
    public string selected;
    public aa(){
        citymap=new map<string,list<string>>();
        list<string>hplaces=new list<string>{'kp','KPHB'};
        list<string>bplaces=new list<string>{'bn','balanagar'};
        list<string>cplaces=new list<string>{'myt','ameerpet'};
            citymap.put('hyd',hplaces);
            citymap.put('bng',bplaces);
            citymap.put('che',cplaces);
        cities=new list<selectoption>();
        places=new list<selectoption>();
        set<string>aa=citymap.keySet();
        selectoption s=new selectoption('none','-none-');
        cities.add(s);
        places.add(s);
        for(string d:aa){
            selectoption f=new selectoption(d,d);
            cities.add(f);
        }
    }
    public void getdata(){
        places.clear();
        selectoption s=new selectoption('none','-none-');
        cities.add(s);
        if(selected!='none'){
           list<string>h=citymap.get(selected);
            for(string l:h){
                selectoption j=new selectoption(l,l);
                places.add(j);
            }
           
        }
    }
    
    

}