({
clickCreateItem : function(component, event, helper) {
var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
// Displays error messages for invalid fields
inputCmp.showHelpMessageIfInvalid();
return validSoFar && inputCmp.get('v.validity').valid;
}, true);
 
if(validCamping){
var newCampingItem = component.get("v.newItem");
//helper.createCamping(component,newCampingItem);
var campings = component.get("v.items");
var item = JSON.parse(JSON.stringify(newCampingItem));
 
campings.push(item);
 
component.set("v.items",campings);
component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
'Price__c': 0,'Packed__c': false });
}
},
    
	clickCreateItem : function(component, event, helper) {
        var isFormValid = component.find("campingItemForm").reduce(function(isValid, inputCmp){
        	inputCmp.showHelpMessageIfInvalid();    	
            return isValid && inputCmp.get("v.validity").valid;
        });
        
        if (isFormValid) {
            
            var newCampingItem = component.get("v.newItem");
            helper.createItem(component,newCampingItem);
           
        }
	},
    
    doInit : function (component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this,function (response) { 
        	var campingItems = response.getReturnValue();
            component.set("v.items",campingItems);
        });
        $A.enqueueAction(action);
    }
})