public class acc_task {
    public list<acc_task_wrap> wraplist       {set;get;}
    public Account ac                         {set;get;}
    public Contact cc                         {set;get;}
    public acc_task(){
        wraplist =new list<acc_task_wrap>();
        ac=new Account();
        cc=new Contact();
    }
    public void datatable(){
        /* for(acc_task_wrap aw: wraplist){
//acc_task_wrap data=new acc_task_wrap();
aw.acc.name=ac.name;
aw.acc.rating=ac.rating;
aw.acc.industry=ac.rating;
aw.con.accountId=ac.id;
aw.con.firstname=cc.firstname;
aw.con.lastname=cc.lastname;

wraplist.add(aw);
}
insert ac;
insert cc;*/
        
        list<account> acclist=new list<account>();
        list<contact> conlist=new list<contact>();
        acclist.add(ac);
        conlist.add(cc);
        insert acclist;
        insert conlist;
       
        for(account ab:acclist){
            for(contact cd:conlist){
                acc_task_wrap a=new acc_task_wrap();
                a.acc=ab;
                a.con=cd;
                wraplist.add(a);
            }
        }
         ac=new account();
        cc=new contact();
    }
}