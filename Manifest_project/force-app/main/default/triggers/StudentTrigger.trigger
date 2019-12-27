trigger StudentTrigger on Studentsss__c (before insert,after insert, after update,after delete) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        
    }
    if(Trigger.isAfter && Trigger.isInsert){
        StudentHandler.onAfterInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        StudentHandler.onAfterupdate(Trigger.oldmap,Trigger.newMap);
    }
    if(Trigger.isAfter && Trigger.isDelete){
        StudentHandler.onAfterdelete(Trigger.old);
    }
    
}