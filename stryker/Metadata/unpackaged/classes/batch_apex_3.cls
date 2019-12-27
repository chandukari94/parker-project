global class batch_apex_3 implements Database.Batchable<Sobject> {
    Global database.QueryLocator start(database.BatchableContext bc){
       string query='select id From Account';
        database.QueryLocator result=database.getQueryLocator(query);
        return result;
    }
    global void execute(database.BatchableContext bc,list<Account> acclist){
       // list<Account> mylist=new list<Account>();
        for(Account a:acclist){
           // if(a.Name=='chandu kari'){
              a.phone='909090909';
            //   mylist.add(a); 
            //}
           
        }
        update acclist;
    }
    global void finish(database.BatchableContext bc){
        
    }
}