public class soql2 {
    public list<Account> mylist          {set;get;}
    public string searchtext             {set;get;}
    
    public void textsearch(){
        mylist=[select id,name,industry,rating,phone from Account where rating=:searchtext OR industry=:searchtext];	
    }

}