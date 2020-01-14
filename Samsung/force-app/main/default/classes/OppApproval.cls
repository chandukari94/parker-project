public with sharing class OppApproval {
    @AuraEnabled
    public static void Approval(Opportunity OPP) {
        User userRecord = [select id from user where Alias='reddy' limit 1];
        Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
        req.setComments('Submitting request for approval');
        req.setObjectId(OPP.id);
        req.setSubmitterId(userRecord.id);
        req.setProcessDefinitionNameOrId('OPPApproval');
        req.setSkipEntryCriteria(true);
        Approval.ProcessResult result = Approval.process(req);
         //List<Id>newWorkItemIds = result.getNewWorkitemIds();

    }
}