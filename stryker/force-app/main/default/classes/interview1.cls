public class interview1 {
    public static void accinsert(list<Account>acclist){
        list<Contact>conlist=new list<Contact>();
        for(Account a:acclist){
                Contact c=new Contact();
                c.LastName=a.Name;
                c.Phone=a.Phone;
                c.AccountId=a.Id;
           		conlist.add(c);
        } 
        insert conlist;
    }
}