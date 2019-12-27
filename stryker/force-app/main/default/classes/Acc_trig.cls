public class Acc_trig {
    public static void createopt(list<Account>accounts){
        List<Opportunity> optylist=new  List<Opportunity>();
        List<AccountTeamMember>teams=new List<AccountTeamMember>();
        User u=[select id from user where alias='reddy'];

        for(Account a:accounts){
            if(a.Industry=='Banking'){
            Opportunity  op=new Opportunity();
            op.Name=a.name;
            op.StageName='prospecting';
            op.CloseDate=system.today()+15;
            op.AccountId=a.Id;
            optylist.add(op);
            }
        
        if(a.AnnualRevenue>500000){
            AccountTeamMember atm=new AccountTeamMember();
            atm.AccountId=a.Id;
            atm.TeamMemberRole='Manager';
            atm.userId=u.Id;
            atm.AccountAccesslevel='Read';
            teams.add(atm);
        }
    }
        if(optylist.size()>0)
            insert optylist;
        if(teams.size()>0)
            insert teams;
 }
    public static void Recordshare(map<Id,Account>myold,map<Id,Account>mynew){
        set<Id> ids=myold.keyset();
       List<AccountShare> share=new List<AccountShare>();
    for(Id key:ids){
           Account olddata =myold.get(key);
           Account newdata =mynew.get(key);
            if(olddata.Agent__c!=newdata.Agent__c){
                AccountShare acc=new AccountShare();
                acc.AccountId=key;
                acc.AccountAccessLevel='read';
                acc.OpportunityAccessLevel='read';
                acc.UserOrGroupId=newdata.Agent__c;
                acc.RowCause='manual';
                 share.add(acc);
                }    
            }
        insert share;   
    }
    public static void delRecord(List<Account>accounts){
        list<Account> acclist=[select id,(select id from contacts) from Account where id in:accounts];
        for(Account a:acclist){
            list<Contact>contacts=a.contacts;	
            if(contacts.size()>0){
                a.adderror('you can not delete Account which has contacts'); 
            }
        }
    }
}