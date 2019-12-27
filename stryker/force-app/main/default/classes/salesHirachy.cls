public class salesHirachy {
    @AuraEnabled
    public static void getdata(){
        list<id>accids=new list<id>();
        list<Sales_Hirachy__c> salesdata=[select id,Child_Party_Role__c,Party_Role__c,check__c from Sales_Hirachy__c where check__c=false];
        for(Sales_Hirachy__c  obj:salesdata){
            if(obj.Party_Role__c!=Null){
                accids.add(obj.Party_Role__c);
                system.debug('accids====>'+accids);
                system.debug('accids====>'+accids.size());
            }
        }
        list<Connection__c> clist=new list<Connection__c>();
        list<Id> lstsHToUpdate = new list<Id> ();
        for(Account acd: [select id,(select id,check__c,Child_Party_Role__c from Sales_Hirachys__r Where check__c=false)
                         from Account where id in:accids]){
                             system.debug('acd====>'+acd);
            if(acd.Sales_Hirachys__r != NULL && !acd.Sales_Hirachys__r.isEmpty()){
                for(Sales_Hirachy__c objSH: acd.Sales_Hirachys__r){
                    system.debug('objSH====>'+objSH);
                    Connection__c conobj= new Connection__c();
                                        conobj.name = objSH.Child_Party_Role__c;
                                        //conobj.Check__c=true;
                                        conobj.Con_Child_Party_Role__c=acd.id;
                                        clist.add(conobj);
                    system.debug('clist====>'+clist);
                    					lstsHToUpdate.add(objSH.id);
                    system.debug('lstsHToUpdate====>'+lstsHToUpdate);
                }
               // if(!clist.isEmpty()){
               //     insert clist;
                //    system.debug('clist====>'+clist);
               // }
            }
                                        
        }  
        list<Sales_Hirachy__c> salesupdate=new list<Sales_Hirachy__c>();
        if(!clist.isEmpty()){
            system.debug('clist====>'+clist);
            insert clist;
            system.debug('clist====>'+clist);
           /* if(!lstsHToUpdate.isEmpty()){
                system.debug('lstsHToUpdate====>'+lstsHToUpdate);
                list<Sales_Hirachy__c>saleslist=[select id,check__c,Child_Party_Role__c,Party_Role__c from
                                                 Sales_Hirachy__c where id In: lstsHToUpdate and check__c=false];
                	system.debug('saleslist====>'+saleslist);
               // for(Sales_Hirachy__c obj:[select id,check__c,Child_Party_Role__c,Party_Role__c from Sales_Hirachy__c where id In:lstsHToUpdate]){  
                for(sales_hirachy__c obj:saleslist){    
                system.debug('obj====>'+obj);
                	Sales_Hirachy__c saleobj=new Sales_Hirachy__c();
                    saleobj.Check__c=true;
                    salesupdate.add(saleobj);
                    system.debug('salesupdate====>'+salesupdate);
                }
            }
            if(!salesupdate.isEmpty()){
                update salesupdate;
                system.debug('salesupdate====>'+salesupdate);
            }
        }*/
        
    }
    }  
}