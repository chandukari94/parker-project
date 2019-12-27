public class List_Example_3 {
    public Account acc            {set;get;}
    public List<Account> accounts {set;get;}
    public List_Example_3(){
        acc =new Account(); 
        accounts =new List<Account>();
    }  
    public void addMe(){
        accounts.add(acc); 
        acc =new Account();
    }
}