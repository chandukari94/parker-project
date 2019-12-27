({
	addme : function(component, event, helper) {
		var newAccount=component.get("v.newAccount");
        var myevent=component.get("sathish");
        myevent.setparams({"acc":newAccount});
	}
})