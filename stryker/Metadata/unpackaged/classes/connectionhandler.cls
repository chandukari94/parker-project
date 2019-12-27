public class connectionhandler {
    public static void updatesales(list<connection__c> conlist){
        list<id>conids=new list<id>();
        for(Connection__c conobj:conlist){
            if(conobj.Con_Child_Party_Role__c!=null){
                conids.add(conobj.Con_Child_Party_Role__c);
                system.debug('conids===>'+conids);
            }
        }
        if(!conids.isEmpty()){
            list<Sales_Hirachy__c> saleslist=new list<Sales_Hirachy__c>();
            for(Account acc:[select id,(select id,Child_Party_Role__c,Party_Role__c,check__c from Sales_Hirachys__r
                                        where check__c=false) from Account where id In:conids]){
                                            system.debug('acc===>'+acc);
                                                if(acc.Sales_Hirachys__r != NULL && !acc.Sales_Hirachys__r.isEmpty()){
                                                    for(Sales_Hirachy__c aobj:acc.Sales_Hirachys__r){
                                                    system.debug('aobj===>'+aobj);
                                                    aobj.check__c=true;
                                                    aobj.Party_Role__c=acc.Id;
                                                    saleslist.add(aobj);
                                                    system.debug('saleslist===>'+saleslist);
                                                }
                                            }
                                            
                                        }
            if(!saleslist.isEmpty()){
                update saleslist; 
            }
        }
    }
    
}