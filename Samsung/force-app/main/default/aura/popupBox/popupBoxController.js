({
   openModel: function(component, event, helper) {
      component.set("v.isOpen", true);
   },
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
   likenClose: function(component, event, helper) {
      alert('Successfully saved');
     component.set("v.isOpen", false);
   },
    createAccount :function(component,event,helper){
                     var acc = component.get("v.acc");
                     var action = component.get("c.createAcc");
                     action.setParams({"acc":acc});
                     action.setCallback(this,function(response){
                     var state=response.getState();
                     console.log(state);
                     if(state==='SUCCESS'){
                     var res=response.getReturnValue();
                          alert('Successfully saved');
                     console.log(res);
                     }
                     });
                     $A.enqueueAction(action);         
                     } 
})