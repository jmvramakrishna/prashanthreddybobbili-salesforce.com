public class ajax1 {
    public list<string> listSt{set; get;}
    public list<string> listCt{set; get;}
    public String state { get; set; }
    public String city { get; set; }
    public String stSrch { get; set; }
    public String ctSrch { get; set; }
    public map<string,list<string>> mpStCt = new map<string,list<string>>();
    public list<selectoption> stSo{get; set;}
    public list<selectoption> ctSo{get; set;}
    public string Result{get;set;}
    public string selectedState{get;set;}
    public string selectedCity{get;set;}
    
    public ajax1(){}
}