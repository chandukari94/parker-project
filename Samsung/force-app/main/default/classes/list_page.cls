public class list_page {
    public List<Account> accounts     {set;get;}
    public Account acc                {set;get;}
    public list_page(){
        accounts=new List<Account>();
                 acc=new Account();
    }    
    public void addme(){    
        accounts.add(acc); 
        acc=new Account();
    }
}