public class pro_trig1 {
    //Wheneever Creating a New Reacord in Project__c then send a Mail.
    public static void sendemail(list<project__c>prolist){
     EmailTemplate et=[select id from EmailTemplate where name='Account Mail'];
	   list<string> eid=new list<string>();
        for(project__c pr:prolist){
            eid.add(pr.email__c);
        }
           Messaging.singleemailmessage msg=new Messaging.singleemailmessage();
           msg.setToAddresses(eid);
           msg.setBccAddresses(eid);
           msg.setPlainTextBody('hi');
           msg.setHtmlBody('ks');
           msg.setSubject('kbcbww');
           messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});               
        }
    
    //This is Approval Procces Trigger.
    public static void approval(list<project__c>prolist){
        for(project__c p: prolist){
        Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
        request.setObjectId(p.Id);  
        request.setProcessDefinitionNameOrId('Project Approval');
        User u =[select id from user where Alias='reddy'];
        request.setSubmitterId(u.Id);
        Id[] approverids =new Id[]{p.Agent__c};
        request.setNextApproverIds(approverids);
         Approval.ProcessResult result =Approval.process(request);
        System.debug(result.isSuccess());
    }
}
}