@isTest()
public class testclass_project {
    public static void testme(){
        project__c pr= new project__c(); 
        pr.first_name__C='test';
        pr.Last_Name__c='first';
        pr.email__C='rajugoud810@gmail.com';
        pr.Status__c='pending';
        pr.Loan_Type__c='education';
        pr.Annual_revinue__c=400000;
        pr.App__c=500000;
        insert pr;  
    }
    @isTest()
    public static void show(){
        testme();
        integer count=limits.getEmailInvocations();
        System.assertEquals(1,count);
    }
    @isTest()
    public static void showme(){
        testme();
        project__c pr= new project__c();
        project__c at=[select id ,status__C from project__c];
        at.status__c='approve';
        update at;
        if(pr.Status__c=='approve'){
            Account a=new Account();
            list<account>accounts=[select id ,name,email__c from account where id=:a.id];
            
            system.assertEquals('test  first',a.name);
            system.assertEquals('rajugoud810@gmail.com',a.Email__c);
            system.assertEquals(pr.Account__c,a.id);
        }
        if(pr.Loan_Type__c=='education'){
            loan__c l=new loan__c();
            Account ac=new account();
            loan__c ln=[select id,Sactioned_Amount__c,Installments__c,Aplied_Ammount__c,
                        Due_date__c,Customer__c,Paid_Ammount__c,balance_Amount__c,Emi__c from loan__c where id=:l.id];
            system.assertEquals(1200000,l.Sactioned_Amount__c);
            system.assertEquals(25000,l.EMI__c);
            system.assertEquals('48',l.Installments__c);
            system.assertEquals(500000,l.Aplied_Ammount__c);
            system.assertEquals(system.today()+30,l.Due_Date__c);
            system.assertEquals(0,l.Paid_Ammount__c);
            system.assertEquals(1200000,l.Balance_Amount__c);
            system.assertEquals(ac.id,l.Customer__c);
        }  
    }
    @isTest()
    public static void checkme(){
        project__c pr= new project__c();
        pr.first_name__C='test';
        pr.Last_Name__c='first';
        pr.email__C='rajugoud810@gmail.com';
        pr.Status__c='pending';
        pr.Loan_Type__c='Housing';
        pr.Annual_revinue__c=400000;
        pr.App__c=500000;
        insert pr;
        project__c x=[select id,Loan_Type__c,status__C from project__c where id=:pr.id];
        x.Status__c='approve';
        update x;
        if(pr.Status__c=='approve'){
            if(pr.Loan_Type__c=='housing'){
                Account ac=new account();
                loan__c l=new loan__c();
                loan__c ln=[select id,Sactioned_Amount__c,Installments__c,Aplied_Ammount__c,
                            Due_date__c,Customer__c,Paid_Ammount__c,balance_Amount__c,Emi__c from loan__c where id=:l.id];
                system.assertEquals(4000000,l.Sactioned_Amount__c);
                system.assertEquals(125000,l.EMI__c);
                system.assertEquals('32',l.Installments__c);
                system.assertEquals(500000,l.Aplied_Ammount__c);
                system.assertEquals(system.today()+30,l.Due_Date__c);
                system.assertEquals(0,l.Paid_Ammount__c);
                system.assertEquals(4000000,l.Balance_Amount__c);
                system.assertEquals(ac.id,l.Customer__c);
            }
        }
    }
    @isTest()
    public static void chech(){
        project__c pr= new project__c();
        pr.first_name__C='test';
        pr.Last_Name__c='first';
        pr.email__C='rajugoud810@gmail.com';
        pr.Status__c='pending';
        pr.Loan_Type__c='vehical';
        pr.Annual_revinue__c=400000;
        pr.App__c=500000;
        insert pr;
        project__c x=[select id,Loan_Type__c,status__C from project__c where id=:pr.id];
        x.Status__c='approve';
        update x;
        if(pr.Status__c=='approve'){
            if(pr.Loan_Type__c=='vechicle'){
                Account ac=new account();
                loan__c l=new loan__c();
                loan__c ln=[select id,Sactioned_Amount__c,Installments__c,Aplied_Ammount__c,
                            Due_date__c,Customer__c,Paid_Ammount__c,balance_Amount__c,Emi__c from loan__c where id=:l.id];
                system.assertEquals(2000000,l.Sactioned_Amount__c);
                system.assertEquals(1666.6,l.EMI__c);
                system.assertEquals('120',l.Installments__c);
                system.assertEquals(500000,l.Aplied_Ammount__c);
                system.assertEquals(system.today()+30,l.Due_Date__c);
                system.assertEquals(0,l.Paid_Ammount__c);
                system.assertEquals(2000000,l.Balance_Amount__c);
                system.assertEquals(ac.id,l.Customer__c);
            }    
        }
    }
    public static void testdata(){
        list<loan__C> llist=new list<loan__C>();
        loan__c l=new loan__c();
        l.Paid_Ammount__c=5000;
        l.Balance_Amount__c=90000;
        l.Due_Date__c=system.today();
        l.Sactioned_Amount__c=100000;
        l.Installments__c='19';
        llist.add(l);
        insert llist;       
    }
    @isTest
    public static void testd(){
        testdata();
        integer count=limits.getEmailInvocations();
        system.assertEquals(1,count);
    }
    @isTest()
    public static void paymentinsertest(){
        
        
        list<payment__c>plist=new list<payment__C>();
        list<id>ids=new list<id>();
        for(payment__C pc:plist){
            ids.add(pc.Loan__c);
        }
        loan__c l=new loan__c();
        payment__c p= new payment__c();
        
        p.Ammount__c=5000;
        p.Email__c='rajugoud810@gmail.com';
        p.Loan__c=l.id;
        plist.add(p);
        insert plist;
        testdata();
        list<loan__C> llist=[select id,Sactioned_Amount__c,Installments__c,Aplied_Ammount__c,
                             Due_date__c,Customer__c,Paid_Ammount__c,balance_Amount__c,Emi__c from loan__C where id in:ids];
        for(payment__c pt:plist){
            for(loan__c lc: llist){
                if(pt.loan__c==lc.Id){
                    
                    system.assertEquals(10000,lc.Paid_Ammount__c);
                    system.assertEquals(90000,lc.Balance_Amount__c);
                    system.assertEquals(system.today()+30,lc.Due_Date__c);
                    system.assertEquals('18',lc.Installments__c);
                    integer count=limits.getEmailInvocations();
                    system.assertEquals(1,count);
                }
            }
        }
    }
    @istest
    static void testgo(){
        project__c p=new project__c();
        p.Name='chandu'; 
        p.first_name__c='kari';
        insert p;
        project_app pr=new project_app();
        pr.go();
        pr.next();
    }
    /*  @isTest
static void testnext(){
project_app pr=new project_app();
PageReference pg = pr.next();
system.assertEquals('/apex/pro_next', pg.getUrl());
}*/
    @isTest
    static void testschedulepro(){
        shedule_pro sp=new shedule_pro();
        string cronexp='0 0 12 6 8 ? 2019';
        test.startTest();
        id jobid=system.schedule('ram',cronexp,sp);
        test.stopTest();
        crontrigger sc=[select id,cronexpression from crontrigger where id=:jobid];
        system.assertEquals(cronexp,sc.cronexpression);
        integer count=limits.getEmailInvocations();
        System.assertEquals(1,count);
    }
    
}