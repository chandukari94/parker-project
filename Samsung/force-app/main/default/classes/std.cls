public class std {
    public static void AfterupdateNoOfStudents(list<Studentsss__c> lstStudentsss){
        
        list<id>ids=new list<id>();
        list<Studentsss__c> stdnew=trigger.new;
        list<Studentsss__c> stdold=trigger.old;
        for(Studentsss__c stdobj:lstStudentsss){
            //if(stdnew.class__c!=stdold.class__c){
                ids.add(stdobj.id);
            }
        }
    }