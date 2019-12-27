({
    invoke : function(component, event, helper) {
        var columns=[ {label: 'Account Name', fieldName: 'linkName', type: 'url', 
                       typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
                     // {label:"Name",fieldName:"Name" ,type:"Url",typeAttributes: { label: 'Name', target:'Account.name'}},
                     {label:"Phone",fieldName:"Phone", type:"text"},
                     {label:"Industry",fieldName:"Industry",type:"text"},
                     {label:"Rating",fieldName:"Rating",type:"text"},
                     {label:"Check",fieldName:"check__c", type:"checkbox"},
                     //{ type: 'action', typeAttributes: { rowActions: actions } },
                    ];
                     component.set("v.fields",columns);
                     var action =component.get("c.getAcc");
                     action.setCallback(this,function(response){
                     var state=response.getState();
                     if(state==='SUCCESS'){
                     //set the link All account names.
                     var records =response.getReturnValue();
                     records.forEach(function(record){
                     record.linkName = '/'+record.Id;
                     });
                     var res=response.getReturnValue();
                     component.set("v.accounts",res);
                     
                     
                     }
                     });
                     $A.enqueueAction(action);
                     
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
                     console.log(res);
                     }
                     });
                     $A.enqueueAction(action);         
                     }                      
                     })