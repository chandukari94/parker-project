trigger create_acc_on_project on Project__c (After update) {
    project_app.createacc(trigger.new);
}