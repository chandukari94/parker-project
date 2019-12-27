trigger Approval on Project__c (After insert) {
    
    project_app.approval(trigger.new);
   
}