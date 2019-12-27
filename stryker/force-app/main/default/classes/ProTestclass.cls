@istest
public class ProTestclass {
	@testSetup
    static void testdata(){
       project__c pp=new project__c();
        pp.first_name__c='venu';
        pp.last_name__c='k';
        pp.phone__c='12345';
        insert pp;
        project_app_wrap w=new project_app_wrap();
         w.flag=false;
         w.ap=pp;
    }
    @istest
    static void testgo(){
        project_app pr=new project_app();
        pr.go();
        pr.next();
    }
}