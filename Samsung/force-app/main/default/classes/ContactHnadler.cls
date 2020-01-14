public class ContactHnadler {
    public static void Updateacc(list<Contact>conlist){
        list<Id>accountids=new list<Id>();
        for(Contact conobj:conlist){
            if(conobj.phone!=Null){
                accountids.add(conobj.AccountId);
            }
        }
        list<Account>updatelist=new list<Account>();
       // Acclist=[select id,phone,(select id,Accountid,phone from Contacts)from Account where id In:accountids];
        for(Account Accobj:[select id,phone,(select id,Accountid,phone from Contacts)from Account where id In:accountids]){
            for(Contact conobj:Accobj.Contacts){
                Accobj.phone=conobj.phone;
                updatelist.add(accobj);
            }
        }
         update updatelist;
    }
}