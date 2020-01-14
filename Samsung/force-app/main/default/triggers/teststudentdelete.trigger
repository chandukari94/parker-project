trigger teststudentdelete on Studentsss__c (After insert) {
    List<Class__c> classToUpdate = new List<Class__c>();
    set<Id> clsId = new Set<Id>();
    for(Studentsss__c stdobj : trigger.old) {
        clsId.add(stdobj.Class__c);
    }
    Map<Id,Class__c> classMap = new Map<Id,Class__c>([select Id,No_Of_Students__c from Class__c where Id In :clsId]);
    
    for(Studentsss__c std :trigger.old) {
        if(std.Class__c==null){
            Class__c clc = classMap.get(std.Class__c);
            clc.No_Of_Students__c =classMap.size() ;
            classToUpdate.add(clc);
        }
    }
}