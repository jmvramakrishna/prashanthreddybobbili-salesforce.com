public class MyContactsController2 {
    @AuraEnabled
    public static list<contact> getContacts(List<id> accountIds){
        list<contact> contactlist = [select id,firstname,lastname,accountid,phone,email from contact where accountid in :accountids];
        return contactlist;
    }
    
    @AuraEnabled
    public static map<string, string> saveContacts(List<contact> contacts){
        map<string, string> rsMp = new map<string, string>();
        try{
            list<Database.SaveResult> ur = database.update(contacts); 
            rsMp.put('Status','Success');
            rsMp.put('Message','Record updated successfully');
        }catch(exception e){
            rsMp.put('Status','Error');
            rsMp.put('Message',e.getMessage());
        }
        return rsMp;
    }
}