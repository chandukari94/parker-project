public class dml_delete2 {
    public list<Account> accounts        {set;get;}
    public list<dml_delwrapper> del      {set;get;}
    public string selected               {set;get;}
    public dml_delete2(){
        del=new list<dml_delwrapper>();
        accounts=[select id,name,rating,industry,phone from Account];
        list<Account> mylist=new list<Account>();
        for(Account a:accounts){
            dml_delwrapper ddl=new dml_delwrapper();
            ddl.flag=false;
            ddl.acc=a;
            del.add(ddl);
        }
    }
    public void delt(){
        list<Account>dlist=new list<Account>();
        for(dml_delwrapper dd:del){
            if(dd.flag==true){
               
                dlist.add(dd.acc);
            }
        }
        delete dlist;
        
        accounts=[select id,name,rating,industry,phone from Account];
    }
}