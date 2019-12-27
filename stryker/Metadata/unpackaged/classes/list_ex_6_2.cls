public class list_ex_6_2 {
    public list<list_ex_6> Lists      {set;get;} 
    public Account acc                {set;get;}
    public Contact con                {set;get;}
    
    public list_ex_6_2(){
         Lists=new list<list_ex_6>();
         acc= new Account();
         con=new Contact(); 
    }
    public void addme(){
       list_ex_6 data=new list_ex_6();
        data.acc= acc;
        data.con=con; 
        Lists.add(data);
         acc= new Account();
         con=new Contact();     
    }
}