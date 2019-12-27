trigger ContactTrigger on Contact (before insert,After Insert) {
	if(Trigger.isBefore && Trigger.isInsert){
       // ContactHandler.contactphoneval(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
      //  ContactHnadler.Updateacc(Trigger.new);
    }
    
    
}