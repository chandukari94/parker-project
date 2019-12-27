global class batch_apex implements database.Batchable<Sobject> {
    global database.QueryLocator start(database.BatchableContext bc){
        string query='select id,AccountId,email from Contact';
        
        return database.getQueryLocator(query);	
    }
    global void execute(database.BatchableContext bc, list<contact> contacts){
        
        set<id>Acountids=new set<id>();
        for(Contact con:contacts){
            if(con.email!=Null){
                Acountids.add(con.AccountId);
                system.debug('con.AccountId====>'+Acountids);
            }
        }
        list<Account> accounts=new list<Account>();
        for(Account a:[select id,Email__c,(select Email from Contacts)from Account where id IN:Acountids ]){
            for(Contact c:a.Contacts){
                a.Email__c=c.Email;
                system.debug('Email__c====>'+a.Email__c);
                a.NumberOfEmployees=50;
                system.debug('NumberOfEmployees====>'+a.NumberOfEmployees);
                accounts.add(a);
            }
        }
        update accounts;
        system.debug('accounts====>'+accounts);
    }
    global void finish(database.BatchableContext bc){
        
    }
}