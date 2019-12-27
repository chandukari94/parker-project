trigger paymenttrigger on Payment__c (After insert) {
        project_app.payment(trigger.new);
}