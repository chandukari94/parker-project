trigger Salary_Trigger on Salary__c (After Insert,After Update) {
    if(Trigger.isAfter && Trigger.isInsert){
        salaryhelper.insertEmp(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        salaryhelper.updateEmp(Trigger.oldmap,Trigger.newmap);
    }
}