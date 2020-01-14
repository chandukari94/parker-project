public class Create_Contact {
    public static void contact_create(List<Account> accounts){
        List<Contact> conlist=new List<Contact>();
        for(Account a:accounts){
            Contact con=new Contact();
            con.FirstName='Surendra';
            con.LastName='N';
            con.AccountId=a.Id;
            conlist.add(con);
        }
        insert conlist;
        
        list<Opportunity> optylist=new list<Opportunity>();
        for(Account aa:accounts){
            Opportunity op=new Opportunity();
            op.Name='Ashok Kumar';
            op.Amount=50000;
            op.CloseDate=system.today() ;
            op.StageName='Prospecting';
            op.AccountId=aa.Id;
            optylist.add(op);
        }
        insert optylist;
}
}