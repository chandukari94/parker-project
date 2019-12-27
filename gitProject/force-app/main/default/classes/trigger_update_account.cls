public class trigger_update_account {
    public static void callme(List<Account>accounts){
        List<Accountshare> share=new List<Accountshare>();
        for(Account a:accounts){
            if(a.Agent__c!=null){
                Accountshare ac=new Accountshare();
                ac.AccountId=a.Id;     //0010o00002Qodyn=0010o00002Qodyn
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