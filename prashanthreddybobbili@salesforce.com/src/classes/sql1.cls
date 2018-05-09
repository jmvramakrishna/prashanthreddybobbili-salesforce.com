public class sql1 {
    public list<Account>accs{set;get;}
    public void get(){
        accs=[select name,industry,(select lastname ,firstname from Contacts) from Account];
    }

}