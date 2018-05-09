public class oppurtunityhandler {
    public static void beforeinsert(list<Opportunity>opt){
        for(Opportunity o:opt){
            if(o.stagename=='closedwon'){
                o.closedate=system.today();
            
         }
        }
    }
    public static void beforeupdate(map<id,Opportunity>oldmap,map<id,Opportunity>newmap){
        for(id key:oldmap.keyset()){
            Opportunity old=oldmap.get(key);
            Opportunity newop= newmap.get(key);
             if(old.StageName!='closedwon'&&newop.StageName=='closedwon'){
                newop.closedate=system.today();
            }
        }
        
    }

}