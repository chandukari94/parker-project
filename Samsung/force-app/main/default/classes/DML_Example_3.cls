public class DML_Example_3 {
    public List<Account_Wrapper> accounts {set;get;}
    public DML_Example_3(){
        // initialize the Account_Wrapper list 
        accounts =new List<Account_Wrapper>();
        // write a soql and fetch all the accounts 
        List<Account> myList =[select Name,Phone,Rating,Industry from Account];
        // Take one by one account and create Account_Wrapper object for Every account 
        for(Account a: myList){
            Account_Wrapper aw =new Account_Wrapper();
            aw.flag=false;
            aw.acc=a;
            // add account_Wrapper instance to list 
            accounts.add(aw);
        }
    }
    public void updateRating(){
        List<Account> selected =new List<Account>();
        for(Account_Wrapper aw: accounts){
            if(aw.flag==true){
                // if the flag is selected get the account and add it to selected list 
               selected.add(aw.acc);
            }
        }
        // Take one by one selected account and update the rating as warm
        for(Account a: selected){
            a.rating='Warm';
        }
        update selected;
    }
}