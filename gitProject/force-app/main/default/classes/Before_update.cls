public class Before_update {
    public static void modify(map<Id,Account> myold,map<Id,Account> mynew){
        set<Id> ids=new set<Id>();
        set<Id> accids=myold.keySet(); 
        for(Id key:accids){
            Account oldata=myold.get(key);
            Account newdata=mynew.get(key); 
            if(oldata.Rating!=newdata.rating){
              	ids.add(key);  
            }
        }
        
        list<Account>acclist=[select id from Account where id in:ids];
        list<Contact>conlist=new list<Contact>();
        for(Account a:acclist){
            	Contact con=new Contact();
                con.Firstname='rajendra';
                con.LastName='Mulagalapati';
                con.AccountId=a.id;
                conlist.add(con);
        }
        insert conlist;
    } 
    
}