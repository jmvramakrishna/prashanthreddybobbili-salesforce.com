public class quset {
    public list<questions__c>ques{set;get;}
    public quset(ApexPages.StandardController controller){
        ques=[select name from questions__c];
    }
    public void saving(){
        answers__c an= new answers__c();
            //an.quuu__c = 
            //an.response__c =
            //an.Name =
                insert an;
        
    }

}