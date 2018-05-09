public class DMLExample1 {
    public String accName   {Set;get;}
    public String industry   {set;get;}
    public string phone     {Set;get;}
    public String rating     {set;get;}
    public PageReference create(){
        try{
            /* Create a instance of Account sobject and assign the values given in the VF Page */
          Account acc=new Account();
          acc.Name=accName;
          acc.Phone=phone;
          acc.industry=industry;
          acc.rating=rating;
          insert acc;
            /* if the insertion is success then take the controller to Detail page of the record */
            /* PageReference : This will refer to any of the Page in the salesforce 
             *  '/'+acc.id : ap5.salesforce.com/acc.id
             */
            
          PageReference p=new PageReference('/'+acc.Id);
          return p;
        }catch(Exception e){
            /* if the insertion fails then controller comes to catch 
             * then create a error message 
             * return to the same VF page from which we called create method 
             */ 
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Error, e.getMessage());
            ApexPages.addMessage(msg);
            return null;
        }
    }
}