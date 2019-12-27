public class class_schedule implements schedulable{
  //  public class Schedule_pro2 implements Schedulable
    public void execute(SchedulableContext oc){
         list<Messaging.Email> send=new list<Messaging.Email>();
        list<string>mailslist=new list<string>();
        for(Class__c clsobj:[select Email__c from Class__c ]){
            if(clsobj.Email__c!=Null){
                mailslist.add(clsobj.Email__c);
                }
            }
        for(string obj:mailslist){
                messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
                msg.setToAddresses(mailslist);
                msg.setSubject('Testing Schedule');
                string body='Dear Chandu Chowdary </br> This Schedule is working.';
                msg.setHtmlBody(body);
                send.add(msg);
                }
        messaging.sendEmail(send);
    }
}