public class Approve_createAcc {
    public static void approve(List<Account> acclist){
        for(Account acc:acclist){
            Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
            request.setObjectId(acc.Id);  
            request.setProcessDefinitionNameOrId('Account_Approval');
            //User u =[select id from user where Alias='reddy' limit 1];
            //request.setSubmitterId(u.Id);
            //Id[] approverids =new Id[]{p.Agent__c};
            //request.setNextApproverIds(approverids);
            Approval.ProcessResult result =Approval.process(request);
        }
    }
}