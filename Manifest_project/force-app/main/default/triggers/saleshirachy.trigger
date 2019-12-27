trigger saleshirachy on Sales_Hirachy__c (After insert) {
    list<id>accids=new list<id>();
    list<Connection__c>conlist=[select id,Con_Child_Party_Role__c,Con_Party_Role__c,check__c from Connection__c ];
    for(Sales_Hirachy__c  obj:trigger.new){
            if(obj.Party_Role__c!=Null){
                //for(Connection__c conobj:conlist){
                    //if(conobj.Check__c!=true){
                     accids.add(obj.Party_Role__c);   
                    //}
                //}
            }
        }
    
    for(Account acc: [select id,(select id,Child_Party_Role__c,Party_Role__c,check__c from Sales_Hirachys__r)
                          from Account where id in:accids]){
     if(acc.Sales_Hirachys__r != NULL){
         for(Sales_Hirachy__c  objSal:acc.Sales_Hirachys__r){
             
         }
                                  
      }                       
    }
    
    list<Account>acclist=[select id,(select id,Child_Party_Role__c,Party_Role__c,check__c from Sales_Hirachys__r)
                          from Account where id in:accids];
        //system.debug('acclist====>'+acclist);
        list<Sales_Hirachy__c> saleslist=[select id,Child_Party_Role__c,Party_Role__c,check__c from Sales_Hirachy__c where Party_Role__c in:accids  ];
        list<Connection__c> clist=new list<Connection__c>();
    for(Sales_Hirachy__c sobj:saleslist){
        for(Account objAcc:acclist){
            if(sobj.Party_Role__c == objAcc.Id){
                
            }
            
        }
        
    }
    
    for(Account objAcc:acclist){
            for(Sales_Hirachy__c s:saleslist){
                
                Connection__c conobj= new Connection__c();
                conobj.name=s.Child_Party_Role__c;
                conobj.Check__c=true;
                conobj.Con_Child_Party_Role__c=objAcc.id;
                clist.add(conobj);
                //system.debug('clist====>'+clist);
            }
        }
        insert clist;
        
}