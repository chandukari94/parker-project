public class StudentHandler {
    
    public static void onAfterInsert(list<Studentsss__c> lstStudentsss){
        StudentHelper objStudentHelper = new StudentHelper ();
        objStudentHelper.updateNoOfStudents(lstStudentsss);
        //objStudentHelper.SendmailLoanDetails(lstStudentsss);
    }
    public static void onAfterupdate(map<Id,Studentsss__c> oldStud,map<Id,Studentsss__c> newtud){
        //StudentHelper objStudentHelper = new StudentHelper ();
        StudentHelper.Afterupdate(oldStud, newtud);
    }
    public static void onAfterdelete(list<Studentsss__c> lstStudentsss){
        StudentHelper objStudentHelper = new StudentHelper ();
        objStudentHelper.DeleteStudents(lstStudentsss);
    }
    
}