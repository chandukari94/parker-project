public class soql_1 {
    public list<Account> mylist       {set;get;}
    public integer size               {set;get;}
    
    public soql_1(){
        mylist=[select id,name,industry,rating,phone from Account];
    }
    public void setlimit(){
        mylist=[select id,name,industry,rating,phone from Account limit 5];  
    }
    
    public void limitsize(){
        mylist=[select id,name,industry,rating,phone from Account limit: size];  
    }
    
    public void offset(){
        mylist=[select id,name,industry,rating,phone from Account offset 2];  
    }
    
     public void offsetsize(){
        mylist=[select id,name,industry,rating,phone from Account offset: size];  
    }

}