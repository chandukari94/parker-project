@isTest
public class test_schedule_pro {
	 @isTest
    static void testschedulepro(){
        shedule_pro sp=new shedule_pro();
        string cronexp='0 11 18 6 8 ? 2019';
        test.startTest();
        id jobid=system.schedule('ram',cronexp,sp);
        test.stopTest();
        crontrigger sc=[select id,cronexpression from crontrigger where id=:jobid];
        system.assertEquals(cronexp,sc.cronexpression);
        integer count=limits.getEmailInvocations();
        System.assertEquals(1,count);
    }
    @isTest
    static void testschedulepro_2(){
        Schedule_pro2 sp=new Schedule_pro2();
        string cronexp='0 11 18 6 8 ? 2019';
        test.startTest();
        id jobid=system.schedule('rama',cronexp,sp);
        test.stopTest();
        crontrigger sc=[select id,cronexpression from crontrigger where id=:jobid];
        system.assertEquals(cronexp,sc.cronexpression);
        integer count=limits.getEmailInvocations();
        System.assertEquals(1,count);
    }
}