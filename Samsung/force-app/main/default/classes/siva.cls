public class siva {
    public List<Account> accounts            {set;get;}
    list<sivawraper> mylist                      {set;get;}
    public siva(){
        accounts=[select name,rating,industry from Account];
         mylist=new list<sivawraper>();
        for(Account a:accounts){
          sivawraper sw=new sivawraper();
                sw.name=a.name;
            	sw.rating=a.rating;
            	sw.industry=a.industry;
          		mylist.add(sw);
        }
    }
}