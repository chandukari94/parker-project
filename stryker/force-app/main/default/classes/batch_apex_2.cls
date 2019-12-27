global class batch_apex_2 implements Database.Batchable<Sobject> {
    Global database.QueryLocator start(database.BatchableContext bc){
       string query='select id From Account';
        database.QueryLocator result=database.getQueryLocator(query);
        return result;
    }
    global void execute(database.BatchableContext bc,list<Account> acclist){
        for(Account a:acclist){
            a.name='chandu kari';
        }
        delete acclist;
    }
    global void finish(database.BatchableContext bc){
        
    }
}