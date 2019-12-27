@isTest
public class SalaryTestclass {
    @isTest
    static void testme(){
        Employe__c emp=new Employe__c();
        emp.Name='ravi';
        emp.Employ_Id__c='S123';
        insert emp;
        Salary__c sal=new Salary__c();
        sal.Basic_Salary__c=200;
        sal.HRA__c=300;
        sal.Other_Allowance__c=500;
        sal.Employ_Id__c='S123';
        insert sal;
        Salary__c sl=[select id,Basic_Salary__c,Employ_Id__c,HRA__c,Other_Allowance__c from Salary__c];
        sl.Basic_Salary__c=100;
        //sl.HRA__c=200;
        //sl.Other_Allowance__c=400;
        update sl;
        Employe__c empl=[select id,Employ_Id__c,Total_salary__c from Employe__c where Employ_Id__c=:sl.Employ_Id__c];
        system.assertEquals(900,empl.Total_salary__c);
    }
    
}