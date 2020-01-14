trigger AccountTrigger on Account (before insert,After insert,before update,After Update) {
    if(Trigger.isBefore && Trigger.isInsert){
        Accounthandaler.Typevalidations(Trigger.new);
         Accounthandaler.Advanceamountval(Trigger.new);
        //this is sample
    }
    if(Trigger.isAfter && Trigger.isInsert){
       
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        Accounthandaler.ratingupdatetval(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
       raju_req.Afterupdate(Trigger.oldmap,Trigger.newMap);
    }        
}