global class class_batch implements database.Batchable<Sobject> {
    global Database.QueryLocator Start(database.BatchableContext bc){
        return Database.getQueryLocator('select id,DOB__c,Name__c,Email__c from Studentsss__c where DOB__c=TODAY');
    }
    global void Execute(Database.BatchableContext bc,list<Studentsss__c>stdlist){
        list<Messaging.Email> send=new list<Messaging.Email>();
        list<string> mails=new list<string>();
        for(Studentsss__c obj:stdlist){
            if(obj.Email__c!=Null){
                mails.add(obj.Email__c);
            }
        }
         for(string obj1:mails){
            messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
             msg.setToAddresses(mails);
             msg.setHtmlBody('Wish a Many Many More Happy Returns Of the Day');
             send.add(msg);
        }
        messaging.sendEmail(send);
    }
    global void finish(Database.BatchableContext bc){
        
    }
       
}