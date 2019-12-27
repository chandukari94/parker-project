public class soql_ex_1 {
    public list<Account>  accounts         {set;get;}
    public string searchtext               {set;get;}
    
    public void search(){
        accounts=[select id,name,rating,industry from Account where rating=:searchtext OR industry=:searchtext];
    }
}