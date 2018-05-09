public class oppportunitye {
    public static void afterupdate(map<id,Opportunity>oldmap,map<id,Opportunity>newmap){
         user u=[select id from user where alias='py'];
        list<OpportunityTeamMember>opt=new list<OpportunityTeamMember>();
        for(id key:oldmap.keyset()){
            Opportunity old=oldmap.get(key);
            Opportunity newop= newmap.get(key);
            if(old.StageName!='closedwon'&&newop.StageName=='closedwon'){
                 OpportunityTeamMember o=new OpportunityTeamMember();
                    o.OpportunityId=key;
                    o.OpportunityAccessLevel='read';
                        o.UserId=u.id;
                        o.TeamMemberRole='Acccount Manager';
                        opt.add(o);
            }
        }
        insert opt;
    }
  }