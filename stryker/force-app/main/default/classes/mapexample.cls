public class mapexample {
   public map<string,list<string>> mymap       {set;get;}
   public list<selectoption> A_names           {set;get;}
   public list<selectoption> C_names           {set;get;}
   public string selected                      {set;get;}
   
    
    public mapexample(){
        mymap=new map<string,list<string>>();
        list<Account>   accounts=[select id,name,rating,(select id,firstname,phone from contacts) from Account];
         A_names=new list<selectoption>();
        C_names=new list<selectoption>();
        for(Account a: accounts){
            list<string>mylist=new list<string>();
            for(Contact c: a.contacts){
               mylist.add(c.firstname);
                //mylist.add(c.phone);
                mymap.put(a.name,mylist);
            }
        }
        selectoption op=new selectoption('none','-None-');
        A_names.add(op);
        C_names.add(op);
        set<string>setkeys=mymap.keyset();
        for(string s: setkeys){
            selectoption sop=new selectoption(s,s);
            A_names.add(sop);
        }
        }
         public void getnames(){
              C_names.clear();
            selectoption op=new selectoption('none','-None-');
              C_names.add(op);
             if(selected!='none'){
             list<string> conlist=mymap.get(selected);
                 //selectoption op1=new selectoption('c.phone','');
             // C_names.add(op1);
             for(string s: conlist){
                selectoption sop=new selectoption('c.phone',s); 
                  C_names.add(sop);
             }
             }
    } 
    }