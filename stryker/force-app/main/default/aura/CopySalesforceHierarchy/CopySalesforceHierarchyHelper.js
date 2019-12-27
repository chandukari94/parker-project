({
    copysales : function(component) {
        var action=component.get("c.getdata");
        action.setCallback(this,function(responce){
            var state=response.getstate();
            if(state==='SUCCESS'){	
                var result=responce.getReturnvalue();
                console.log(result); 
            }
        });
        $A.enqueueAction(action);
    }
    
})