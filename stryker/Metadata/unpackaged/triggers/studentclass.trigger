trigger studentclass on Studentsss__c (after insert)
{
 List<class__c> ObjectBList = new List<class__c>();  
   Set<Id> ObjectAids = new Set<Id>();    
       
        
     for(Studentsss__c  test:Trigger.New) {     
        ObjectAids.add(test.class__c);   
     }
   
        AggregateResult[] groupedResults = [SELECT COUNT(Id), class__c FROM Studentsss__c 
                                                       where class__c IN :ObjectAids GROUP BY class__c ];

        for(AggregateResult a:groupedResults) {    
     Id BId = (ID)a.get('class__c');    
     Integer count = (INTEGER)a.get('expr0');    
     class__c objB = new class__c(); 
     objB.id=BId;
     objB.No_Of_Students__c = count;    
     ObjectBList.add(objB);     
   }  
   update ObjectBList;

}