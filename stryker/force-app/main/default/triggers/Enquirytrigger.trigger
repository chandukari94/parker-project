trigger Enquirytrigger on Enquiry__c (before insert) {
    if(trigger.isBefore==true && Trigger.isInsert==true){
        EnquiryHandler.onBeforeInsert(Trigger.new);
    }
}