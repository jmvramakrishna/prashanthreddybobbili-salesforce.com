public class questionSelectClassController {
      public List<wrapquestion> wList {get; set;}
    public List<questions__c> selectedAccounts{get;set;}
 
    public questionSelectClassController(){
        if(wList == null) {
            wList = new List<wrapquestion>();
            for(questions__c a: [select Name from questions__c ]) {
                // As each Account is processed we create a new wrapAccount object and add it to the wrapAccountList
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
 
    // This is our wrapper/container class. In this example a wrapper class contains both the standard salesforce object Account and a Boolean value
    public class wrapquestion {
        public questions__c acc {get; set;}
        public Boolean selected {get; set;}
 
        public wrapquestion(questions__c a) {
            acc = a;
            selected = false;
        }
    }

}