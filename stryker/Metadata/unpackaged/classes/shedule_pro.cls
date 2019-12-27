public class shedule_pro implements Schedulable {
    public void execute(SchedulableContext oc){
       /* list<Loan__c>Loanlist=[select id,customer__r.email__c,Emi__c,Sactioned_Amount__c,
                               Aplied_Ammount__c,balance_Amount__c from loan__c];
        list<Id>ids=new list<id>();
        for(loan__c l:loanlist){
            ids.add(l.customer__c);
        }*/
        list<loan__c>mylist=[select id,customer__r.email__c,Emi__c,Sactioned_Amount__c,balance_Amount__c,
                            Due_date__c from loan__c where balance_Amount__c>0];
        list<string>mails=new list<string>();
         list<Messaging.Email> sendmails=new list<Messaging.Email>();
        for(Loan__c ln:mylist){
                mails.add(ln.customer__r.email__c);
       // }
       // for(loan__c l:mylist){
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setToAddresses(mails);
        string body='Dear Customer <br/>';
            body=body+'Ammount of Rs.'+ln.Emi__c+'Will be deducted from your Account on'+ln.Due_date__c+'<br/>';
            body=body+'please kepp Sufficient Balence in The Account to Provide Late fee Charges';
        msg.setHtmlBody(body);
        msg.setSubject('loan');
        sendmails.add(msg);
       }
        messaging.sendEmail(sendmails);
    }
}