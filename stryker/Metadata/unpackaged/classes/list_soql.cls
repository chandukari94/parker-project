public class list_soql {
    public List<string> names          {set;get;}
    public List<Account> mylist         {set;get;}
    public void mm(){
        mylist= [select id,name,rating,industry from Account];
        names=new List<string>();
        for(Account a: mylist){
          if(a.industry=='banking'){
           
 				  names.add(a.name);
          }
           }
        }
    
}