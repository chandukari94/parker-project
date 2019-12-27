public class DML_Acc_Con {
    public string company                         {set;get;}
    public string phone                           {set;get;}
    public string email                           {set;get;}
    public string firstname                       {set;get;}
    public string lastname                        {set;get;}
    
    public pageReference condetails(){
        pageReference p;
        list<Account> accounts=[select id,name from Account where name=:company];
        
        if(accounts.size()==0){
           account acc=new account();
            acc.name=company;
            acc.phone=phone;
            insert acc;
            Contact con=new Contact();
            con.firstname=firstname;
            con.lastname=lastname;
            con.email=email;
            con.phone=phone;
            con.AccountId=acc.Id;
            insert con;
            p=new pageReference('/'+acc.Id);
        }else{
            Id accId=accounts[0].Id;
            integer count=[select count() from Contact where AccountId=:accId];
            if(count>=3){
                Apexpages.Message msg=new Apexpages.Message(Apexpages.Severity.ERROR,'we are not insert more than three records');
                Apexpages.addMessage(msg);
            }else{              
                Contact con=new Contact();
                con.firstname=firstname;
                con.lastname=lastname;
                con.email=email;
                con.phone=phone;
                con.AccountId=accId;
                insert con;
                p=new pageReference('/'+accId);
            }
        }
        return p;
    }
}