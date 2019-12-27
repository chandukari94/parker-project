trigger connectiontrigger on Connection__c (after insert) {
    if(trigger.isAfter==true &&  trigger.isInsert==true){
    system.debug('I am Tigger');
        //connectionhandler.updatesales(trigger.new);
    }
    
}