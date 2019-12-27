({  
    invoke : function(component, event, helper) {
        var columns=[
            {label:"Title",fieldName:"Title", type:"text"},
            {label:"FileExtension",fieldName:"FileExtension",type:"text"},
            {label:"FileType",fieldName:"FileType",type:"text"},
            {label:"check",fieldName:"check__c",type:"checkbox"},
            {label:"Description",fieldName:"Description",type:"text"},
        ];
            component.set("v.fields",columns);
            var action =component.get("c.getfile");
            action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
            //set the link All account names.
            //var records =response.getReturnValue();
            //records.forEach(function(record){
            //record.linkName = '/'+record.Id;
            //});
            var res=response.getReturnValue();
            component.set("v.contents",res);
            
            } 
            });
            $A.enqueueAction(action);
       },
            
            handleSave :function(component,event,helper){
            var files = component.get("v.files");
            var action = component.get("c.Fileupload");
            action.setParams({"files":files});
            action.setCallback(this,function(response){
            var state=response.getState();
            console.log(state);
            if(state==='SUCCESS'){
            var res=response.getReturnValue();
            console.log(res);
            }
            });
            $A.enqueueAction(action);         
        },
            
            handleUploadFinished: function (component,event,helper) {
            // This will contain the List of File uploaded data and status
             var uploadedFiles = event.getParam("Files");
            alert("Files uploaded : " + uploadedFiles.length);
            },
            onCheck: function(cmp, evt) {
		 var checkCmp = cmp.find("checkbox");
		 resultCmp = cmp.find("checkResult");
		 resultCmp.set("v.value", ""+checkCmp.get("v.value"));

	 }	
})