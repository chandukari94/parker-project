public class CorrectExistingNoOfStundentsinClass implements Database.Batchable<sObject>  {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        //String query = 'SELECT Id,Class__c FROM Studentsss__c WHERE ID =\'a0X0o00000NEkbg\'';
        String query = 'SELECT Id,Class__c FROM Studentsss__c';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Studentsss__c> records){
        set<Id> setClassId = new set<Id> ();
        for(Studentsss__c objst: records){
            if(objst.Class__c != NULL){
                setClassId.add(objst.Class__c);
            }           
        }
        System.debug('setClassId==> '+setClassId);
        if(!setClassId.isEmpty()){
            list<Class__c> lstClass = new list<Class__c> ();
            for(Class__c objCls:[Select id,(Select ID FROM Studentsss__r) from Class__c WHERE ID IN :setClassId]){
                System.debug('objCls==> '+objCls);
                System.debug('objCls.Studentsss__r '+objCls.Studentsss__r);
                System.debug('objCls.Studentsss__r '+objCls.Studentsss__r.size());
                if(objCls.Studentsss__r != NULL && !objCls.Studentsss__r.isEmpty()){
                    Class__c cls = new Class__c();
                    cls.No_Of_Students__c = objCls.Studentsss__r.size();
                    cls.Id = objCls.Id;
                    lstClass.add(cls);
                }
            }
            System.debug('lstClass ==> '+lstClass);
            if(!lstClass.isEmpty()){
                update lstClass;
            }                     
        }
        
    }    
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }  
    
}