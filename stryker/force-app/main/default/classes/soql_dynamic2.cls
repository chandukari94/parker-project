public class soql_dynamic2 {
    public list<string> mylist                             {set;get;}
    public list<Account> selected                             {set;get;}
    public list<selectoption> options                         {set;get;}
    public string query                                       {set;get;}
    
    public soql_dynamic2(){
        options=new list<selectoption>();
        selected=new list<Account>();
         
        mylist=new list<string>{'name','rating','industry','phone','type'};
            for(string s:mylist){
                selectoption op=new selectoption(s,s);
                options.add(op);
            }
    }
    public void getfields(){
         list<Account> accounts =new list<Account>();                      
        query='select Id';
        for(Account a:selected){
            query=query+','+a;
            
        } 
        query=query+' from Account';
        accounts =Database.query(query);
    }
}