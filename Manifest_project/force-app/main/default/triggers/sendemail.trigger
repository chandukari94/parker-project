trigger sendemail on Loan__c (After insert) {
        project_app.createloan(trigger.new);
}