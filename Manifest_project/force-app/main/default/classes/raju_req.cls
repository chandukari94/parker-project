public class raju_req {
    public static void Afterupdate(map<Id,Account> Accoldmap,map<Id,Account> Accnewmap){
        set<id>Accountids=new set<id>();
        for(Account acc:Accoldmap.Values()){
            if(Accoldmap.get(acc.id).Email__c!=Accnewmap.get(acc.id).Email__c){
                Accountids.add(Accnewmap.get(acc.id).id);
            }
        }
       /** map<id,Account>accounts=new map<id,Accont>([select id,Name,Email__c,(select id,Email from Contacts) from Accont where id IN:Accountids]);
        for(Contact c:accounts.values().Contacts){
            c.Email=accounts.get(c.Accountid).Email__c;
        }
        update accounts.values().Contacts;**/
        list<Contact> conlist=new List<Contact>();
        for(Contact con:[select id,Email,AccountId,Account.Email__c from Contact where AccountId IN:Accountids]){
                con.Email=con.Account.Email__c;
                conlist.add(con);            
        }
        update conlist; 
    }
}