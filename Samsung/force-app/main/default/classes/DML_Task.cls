public class DML_Task {
    public list<selectoption> options                          {set;get;}
	public list<string> mylist                                 {set;get;}
    public list<task_wrapper> tablelist                        {set;get;}
    public string query                                       {set;get;}
    public string selquery                                 {set;get;}
    public list<Account> querylist                             {set;get;}
    public date selected                                     {set;get;} 
    public date TODAY                                       {set;get;} 
    public DML_Task(){
        options=new list<selectoption>();
       
        querylist=new list<Account>();
        mylist=new list<string>{'none','system.TODAY();','hot','warm','banking'};
        for(string s:mylist){
            selectoption op=new selectoption(s,s);
            options.add(op);
        }       
        
        list<Account>accounts=[select name,rating,industry,phone,type from Account]; 
        tablelist=new list<task_wrapper>();
        for(Account a:accounts){
           task_wrapper tw=new task_wrapper();
            tw.flag=false;
            tw.acc=a;
			tablelist.add(tw); 
        }
    } 
    public pageReference accpage(){
        pageReference p;
        p=new pageReference('/apex/DML_ex2');
          return p;  
    }
    public void gettable(){
       
          list<Account>accounts=[select name,rating,industry,phone,type from Account where createddate=:selected];
             tablelist=new list<task_wrapper>();
        for(Account a:accounts){
           task_wrapper tw=new task_wrapper();
            tw.flag=false;
            tw.acc=a;
			tablelist.add(tw); 
        }
        
        
        
        
    }
    
}