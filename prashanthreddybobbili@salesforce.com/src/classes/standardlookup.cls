public class standardlookup {
    public list<account>accs {set;get;}
    public void standardlookup(){
        accs=[select name,industry ,(select lastname ,firstname from Contacts)from Account];
        
    }
    public void customlookup(){
        accs=[select name,industry,(select lastname,firstname from CustomContacts__r)from Account ];
    }
    

}