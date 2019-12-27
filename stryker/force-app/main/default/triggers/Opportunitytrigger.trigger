trigger Opportunitytrigger on Opportunity (Before Update) {
		if(Trigger.isBefore && Trigger.isUpdate){
       OpportunityHandler.Validate_stagename(Trigger.oldmap,Trigger.newMap);
    }
}