@isTest
public class StudentTestCls {
    //Meaning the creating the test data
    @testSetup 
    static void createStudent() {
        Class__c cls = new Class__c();
        cls.Name='chandu';
        insert cls;
        
        Class__c cls1 = new Class__c();
        cls1.Name='chandu1';
        insert cls1;
      
        Studentsss__c std=new Studentsss__c();
        std.Class__c=cls.id;
        std.Name__c='siva';
        insert std;
    }
    
    @istest
    static void updateStudent(){
        Studentsss__c stu = [select id,Class__c from Studentsss__c LIMIT 1]; 
        Class__c cls1 = [select id from Class__c where Name ='chandu1' LIMIT 1];
        stu.Class__c = cls1.Id;
        update stu;
        
        
    }
    @istest
    static void deleteStudent(){
             Studentsss__c stu = [select id,Class__c from Studentsss__c LIMIT 1]; 
        delete stu;
    }
    
    
    

}