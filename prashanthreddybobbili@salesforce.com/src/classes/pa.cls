public class pa {
    public List<wrapquestion> wList {get; set;}
    public List<questions__c> selectedAccounts{get;set;}
 
    public pa(ApexPages.StandardController controller){
        if(wList == null) {
            wList = new List<wrapquestion>();
            for(questions__c a: [select Name from questions__c ]) {
                wList.add(new wrapquestion(a));
            }
        }
    }
 
    public void processSelected() {
    selectedAccounts = new List<questions__c>();
 
        for(wrapquestion wrapAccountObj : wList) {
            if(wrapAccountObj.selected == true) {
                selectedAccounts.add(wrapAccountObj.acc);
            }
        }
    }
 
    public class wrapquestion {
        public questions__c acc {get; set;}
        public Boolean selected {get; set;}
 
        public wrapquestion(questions__c a) {
            acc = a;
            selected = false;
        }
    }


}