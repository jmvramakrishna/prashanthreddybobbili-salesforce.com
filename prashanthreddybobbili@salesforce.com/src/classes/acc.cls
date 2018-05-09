public class acc {
    
    public static void af(List<Opportunity> optyList){

        Map<Id,List<Opportunity>> accMap=new Map<Id,List<Opportunity>>(); // key 								accountId value 
        for(Opportunity op:OptyList){

            if(accMap.containsKey(op.accountId)){

                List<Opportunity> optList=accMap.get(op.accountId);
                optList.add(op);
                accMap.put(op.accountId,optList);

            }else{

                List<Opportunity> ops=new List<Opportunity>{op}; 
                accMap.put(op.accountId,ops);

            } 
        }
       List<Account> accounts=[select id,Total_Amount__c,Won_Amount__c,Lost_Amount__c,
			PipeLine_Amount__c from Account where Id in:accMap.keyset()];
       for(Account a: accounts){
       		List<Opportunity> oppList=accMap.get(a.id);

        	for(Opportunity p:oppList){

        		a.Total_Amount__c=a.Total_Amount__c+p.amount;
        		if(p.stageName=='Closed Won'){

             			a.Won_Amount__c=a.Won_Amount__c+p.amount;

        		}else{

        			if(p.stageName=='Closed Lost'){

        				a.Lost_Amount__c=a.Lost_Amount__c+p.amount;

        			}else{

        			a.pipeLine_Amount__c=a.pipeLine_Amount__c+p.amount;

        			} 
        		}
     		}
    	}
            
        update accounts;
        
    }
    public Static void au(Map<Id,Opportunity> oldMap,Map<Id,Opportunity>   newMap){
     	List<Opportunity> optyChanged=new List<Opportunity>();
        Map<Id,List<Opportunity>> accMap=new Map<Id,List<Opportunity>>();
        for(Id key: oldMap.keyset()){
            Opportunity old=oldMap.get(key);
            Opportunity newOpp=newMap.get(key);
            if(old.stageName!=newOpp.stageName ){
                if((old.stageName!='Closed Won' && old.stageName!='closed Lost')&&                 (newOpp.StageName=='closed won' || newOpp.stageName=='Closed Lost')){
                    if(accMap.containsKey(newOpp.accountId)){
                        List<Opportunity> myList=accMap.get(newopp.accountId);
                        myList.add(newOpp);
                        accMap.put(newopp.accountId,myList);
                    }else{
                        List<Opportunity> newList=new List<Opportunity>();
                        newList.add(newOpp);
                        accMap.put(newOpp.accountId,newList);
                    }
                }            
           }
        }
       List<Account> accounts=[select id,Total_Amount__c,Won_Amount__c,Lost_Amount__c,
        PipeLine_Amount__c from Account where Id in:accMap.keyset()];	
	
       for(Account a: accounts){
       		List<Opportunity> oppList=accMap.get(a.id);
        	for(Opportunity p:oppList){
        		if(p.stageName=='Closed Won'){
             		a.Won_Amount__c=a.Won_Amount__c+p.amount;
                    a.pipeLine_Amount__c=a.pipeLine_Amount__c-p.amount;
        		}else{
        			if(p.stageName=='Closed Lost'){
        				a.Lost_Amount__c=a.Lost_Amount__c+p.amount;
                        a.pipeline_Amount__c=a.pipeLine_Amount__c-p.amount;
        			}
        		}
     		}
    	}
        
      update accounts;  
    }

}