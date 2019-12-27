public class acc_info {
    public list<account_data> names       {set;get;}
    
    public acc_info(){
        names=new list<account_data>();
        list<Account> accounts=[select id,Name,Industry,Rating from Account];
        account_data acc=new account_data();
        for(Account a:accounts){
            acc.Name=a.Name;
            acc.Industry=a.Industry;
            acc.Rating=a.Rating;
            names.add(acc);
        }
    }

}