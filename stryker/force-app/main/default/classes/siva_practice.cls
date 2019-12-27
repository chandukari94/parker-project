public class siva_practice {
    public static void identicalopportunity(list<Account> acclist){
        list<opportunity>optylist=new list<opportunity>();
        for(Account acc: acclist){
            if(acc.NumberOfEmployees>99){
                for(integer i=0;i<10;i++){
                    opportunity opp= new opportunity();
                    opp.Name=acc.Name;
                    opp.StageName='closed won';
                    opp.CloseDate=system.today()+20;
                    opp.AccountId=acc.Id;
                    optylist.add(opp); 
                }
                //inserting the opportunitys.
                insert optylist;
            }
        }
    }
}