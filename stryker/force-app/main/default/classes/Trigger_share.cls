public class Trigger_share {
    public static void sharerecord(List<Account>accounts){
        List<Accountshare> share=new List<Accountshare>();
        for(Account a:accounts){
            if(a.Agent__c!=null){
            Accountshare ac=new Accountshare();
            ac.AccountId=a.Id;
            ac.AccountAccessLevel='Read';
            ac.OpportunityAccessLevel='Read';
            ac.UserOrGroupId=a.Agent__c;
            ac.RowCause='Manual';
                share.add(ac);
        }
    }
	insert share;
}
}