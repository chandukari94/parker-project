@isTest
public class Student_test {
    @isTest
    static void insertstudent(){
        Class__c cls = new Class__c();
        cls.Name='chandu';
        insert cls;
        
        Studentsss__c std=new Studentsss__c();
        std.Class__c=cls.id;
        std.Name__c='siva';
        insert std;
        Class__c cc=[select id,No_Of_Students__c from Class__c where id=:std.Class__c];
        system.assertEquals(1,cc.No_Of_Students__c);
        
       /** Student_test.create_1();
        Class__c clslist=[select id,(select id,class__c from Studentsss__r) from Class__c where id=:Studentsss__r.class__c]; 
        list<Studentsss__c> stddata=clslist.Studentsss__r;
        for(Studentsss__c s:stddata){
            Class__c c=[select id,No_Of_Students__c from Class__c where id=:s.class__c]; 
            system.assertEquals(1,c.No_Of_Students__c);
        }**/
    }
    @isTest
    static void updatestudent(){
        Student_test.create_1();
        Studentsss__c std=[select id,Name,class__c from Studentsss__c];
        Class__c cls = new Class__c();
        cls.Name='ravi';
        insert cls;
        std.Class__c=cls.id;
        update std;
        Class__c c=[select id,No_Of_Students__c from Class__c where id=:std.class__c]; 
        system.assertEquals(2,c.No_Of_Students__c);
        
    }
    @isTest
    static void deletestudent(){
        Student_test.create_1();
        Class__c cls=[select id,No_Of_Students__c from Class__c ];
        Studentsss__c std=new Studentsss__c();
        std.Class__c=cls.id;
        std.Name__c='chandu';
        insert std; 
        Class__c c=[select id,No_Of_Students__c,(select id,Class__c,Name__c from Studentsss__r where Name__c='chandu') from Class__c]; 
        list<Studentsss__c> stddata=c.Studentsss__r;
        delete stddata;
        system.assertEquals(2,c.No_Of_Students__c);
    }
    public static void create_1(){
        
        Class__c cls = new Class__c();
        cls.Name='chandu';
        insert cls;
        
        Studentsss__c std=new Studentsss__c();
        std.Class__c=cls.id;
        std.Name__c='siva';
        insert std; 
    }
    
}