public class acc_datatable {
     public string rating                 {set;get;}
    public list<Account> mylist               {set;get;}
    public list<acc_data> acc_list               {set;get;}
    
    public acc_datatable(){
        mylist=[select id,name,industry,rating from Account];
         acc_list=new list<acc_data>();
        for(Account a:mylist){
            acc_data acc=new acc_data();
                        
            acc.name=a.name;
            acc.industry=a.industry;
            acc.rating=a.rating;
            acc_list.add(acc);
           
        }
    }
}