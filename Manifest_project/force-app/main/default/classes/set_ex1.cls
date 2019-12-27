public class set_ex1{
    public list<string> mylist          {set;get;}
    public set<string> myset              {set;get;}
    public set_ex1(){
        mylist=new list<string>();
        myset=new set<string>();
     list<Account> accounts=[select id,name,industry,rating from Account];
    
        for(Account a:accounts){
            mylist.add(a.name);	
            mylist.add(a.industry);
            myset.add(a.name);
        }
    }
}