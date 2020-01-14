public class dml_ex8 {
	public String company	{set;get;}
    public String lastName  {set;get;}
    public String firstName {set;get;}
    public String phone 	{set;get;}
    public String email		{set;get;}
    public PageReference create(){
        PageReference p;
        // 1. Check are there any accounts with same name 
        List<Account> accounts =[select Id,Name from Account where name=:company];
        // if no account is found then create a new Account and new Contact 
        if(accounts.size()==0){
            Account acc =new Account();
            acc.Name=company;
            acc.Phone=phone;
            insert acc;
            Contact con =new Contact();
            con.LastName=lastName;
            con.FirstName=firstName;
            con.Email=email;
            con.Phone=phone;
            con.AccountId=acc.Id;
            insert con;	
            p=new PageReference('/'+acc.Id);
        }else{
            // if the account is found then take the first account.
           Id accId=accounts[0].Id;
            // find out how contacts that account has 
           Integer count =[select count() from Contact where AccountId=:accId];
            if(count>=3){
                // if more than three contacts are already exists then throw error message
                Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,'We cannot create more than three contacts');
                Apexpages.addMessage(msg);
            }else{
                // if no of contacts that are existing are less than three then create new Contact
                Contact con =new Contact();
                con.LastName=lastName;
                con.FirstName=firstName;
                con.Email=email;
                con.Phone=phone;
                con.AccountId=accId;
                insert con;
                p=new PageReference('/'+accId);
            }   	
        }
         return p;
    }
}