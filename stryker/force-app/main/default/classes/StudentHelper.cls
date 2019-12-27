public class StudentHelper {
    public void updateNoOfStudents(list<Studentsss__c> lstStudentsss){
        list<ID> lstClassId = new list<ID> ();
        for(Studentsss__c objStud : lstStudentsss){
            if(objStud.Class__c != NULL){
                lstClassId.add(objStud.Class__c);
            }
        }
        if(!lstClassId.isEmpty()){
            list<Class__c> lstClass = new list<Class__c> ();
            for(Class__c objCls: [Select id,(Select ID FROM Studentsss__r) from Class__c WHERE ID IN :lstClassId]){
                if(objCls.Studentsss__r != NULL && !objCls.Studentsss__r.isEmpty()){
                    Class__c cls = new Class__c();
                    cls.No_Of_Students__c = objCls.Studentsss__r.size();
                    cls.Id = objCls.Id;
                    lstClass.add(cls);
                }
            }
            if(!lstClass.isEmpty()){
                update lstClass;
            }
        }  
    } 
    
    public static void Afterupdate(map<Id,Studentsss__c> studentoldmap,map<Id,Studentsss__c> studentnewmap){
        list<Id> lstclsId =  new list<Id>();
        for(Studentsss__c objSt:studentoldmap.Values()){
            //java old ==> Pyton new
            //objSt.Class__c ==> java
            if(studentoldmap.get(objSt.Id).Class__c !=studentnewmap.get(objSt.Id).Class__c){
                // java != pyathon
                // old != NEW 
                lstclsId.add(studentnewmap.get(objSt.Id).Class__c);
            }
        }
        if(!lstclsId.isEmpty()){
            list<Class__c> lstClass = new list<Class__c> ();
            for(Class__c objCls: [Select id,(Select ID FROM Studentsss__r) from Class__c WHERE ID IN :lstclsId]){
                if(objCls.Studentsss__r != NULL && !objCls.Studentsss__r.isEmpty()){
                    Class__c cls = new Class__c();
                    cls.No_Of_Students__c = objCls.Studentsss__r.size();
                    cls.Id = objCls.Id;
                    lstClass.add(cls);
                }
            }
            if(!lstClass.isEmpty()){
                update lstClass;
            }
        }
    }
    
    public void DeleteStudents(list<Studentsss__c> lstStudentsss){
        list<id>lstclsId=new list<id>();
        for(Studentsss__c obj:lstStudentsss){
            lstclsId.add(obj.class__c);
        }
        
        if(!lstclsId.isEmpty()){
            list<Class__c> lstClass = new list<Class__c> ();
            for(Class__c objCls: [Select id,(Select ID FROM Studentsss__r) from Class__c WHERE ID IN :lstclsId]){
                if(objCls.Studentsss__r != NULL && !objCls.Studentsss__r.isEmpty()){
                    Class__c cls = new Class__c();
                    cls.No_Of_Students__c = objCls.Studentsss__r.size();
                    cls.Id = objCls.Id;
                    lstClass.add(cls);
                }
            }
            if(!lstClass.isEmpty()){
                update lstClass;
            }
        }
    }
    
}