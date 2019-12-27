trigger Employetrigger on Employe__c (After insert,After Update,Before Insert) {
    if(Trigger.isAfter==true && Trigger.isInsert==true){
        	Employehandler.createEnquiry(Trigger.new);
    }
    if(Trigger.isAfter==true && Trigger.isUpdate==true){
        	Employehandler.updateEnquiry(trigger.oldmap, Trigger.newmap);
    }
    if(Trigger.isBefore==true && Trigger.isInsert==true){
        	Employehandler.updateEmployeAmount(Trigger.new);
    }
}