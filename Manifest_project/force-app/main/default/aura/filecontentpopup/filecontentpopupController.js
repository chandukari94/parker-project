({
	openModel: function(component, event, helper) {
      component.set("v.isOpen", true);
   },
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
   
    save: function (component, event, helper) {
        helper.save(component);
    },
    waiting: function (component, event, helper) {
        component.set("v.uploading", true);
    },
    doneWaiting: function (component, event, helper) {
        component.set("v.uploading", false);
    },
    onPicklistChange: function(component, event, helper) {
      alert(event.getSource().get("v.value"));
   },
    invoke : function(component, event, helper) {
        var columns=[
            //{label:"Title",fieldName:"Title", type:"text"},
            {label: 'Title', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Title' }, target: '_blank'}},
            {label:"FileExtension",fieldName:"FileExtension",type:"text"},
            {label:"FileType",fieldName:"FileType",type:"text"},
           // {label:"check",fieldName:"check__c",type:"checkbox"},
            {label:"Description",fieldName:"Description",type:"text"},
        ];
            component.set("v.fields",columns);
            var action =component.get("c.getfile");
            action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
            //set the link All file titles names.
            var records =response.getReturnValue();
            records.forEach(function(record){
           // record.linkName = '/'+ record.id;
             //record.linkName= '/lightning/r/ContentDocument/' + record.Id + '/view';
             record.linkName='/lightning/r/ContentDocument/'+ record.Id +'/view';
            });
            var res=response.getReturnValue();
            component.set("v.contents",res);
            } 
            }); 
            $A.enqueueAction(action);
       },
})