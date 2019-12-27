public class picklist_2 {
    public list<selectoption> mylist         {set;get;}
    public list<selectoption> accounts         {set;get;}
    public string selected                   {set;get;}
    
    public picklist_2(){
        mylist=new list<selectoption>();
        selectoption op=new selectoption('none','-None-');
        mylist.add(op);
        list<string> cities=new list<string>{'hyd','ban','chen','pune'};
            for(string s:cities){
                selectoption p=new selectoption(s,s);
                mylist.add(p);
                }
        accounts=new list<selectoption>();
        list<Account> getlist=[select id,name,rating from Account];
          for(Account a:getlist){
            selectoption pp=new selectoption(''+a.name,a.rating);
            accounts.add(pp);
        }
    }

}