//INSERT DATA INTO PORJECT
//project_app abc = new project_app();

public class project_app {
    public Apexpages.StandardSetController controller    {set;get;}
    public project_app_wrap wrap                         {set;get;}
    public string selected     		                     {set;get;}
    public boolean sel                                   {set;get;}
    public project__c pp                                 {set;get;}
    public list<project_app_wrap> wraplist               {set;get;}
    public list<project__c> applist                      {set;get;}
    public Integer total            					 {set;get;}
    public Integer pages  								 {set;get;}
    
    // public List<Project__c>getapplist(){
    //   List<Project__c>applist=(List<Project__c>)controller.getRecords();
    //   return applist;
    // } 
    public project_app(){
        pp=new project__c(); 
     	wraplist=new list<project_app_wrap>();  
        applist=[select id,First_Name__c,Last_Name__c,Email__c,Phone__c,status__C from project__c ORDER BY First_Name__c ASC ];
        controller =new Apexpages.StandardSetController(applist);
        controller.setPageSize(5);
        for(project__c a:applist){
            project_app_wrap w=new project_app_wrap();
            w.flag=false;
            w.ap=a;
            wraplist.add(w);
        }
        
      	
    }
    // public void pagenext(){
    //   if(controller.getHasNext()){
    //     controller.next();
    //   applist=controller.getRecords();
    //}
    //}
    public  void go(){ 
         wraplist.clear(); 
        applist=[select id,First_Name__c,Last_Name__c,Email__c,Phone__c,status__C from project__c where First_Name__c=:selected OR last_Name__c=:selected OR phone__c=:selected ];
        for(project__c a:applist){
            project_app_wrap w=new project_app_wrap();
            w.flag=false;
            w.ap=a;
            wraplist.add(w);
        }
    }
    public Pagereference next(){
        Pagereference p;
        p=new pagereference('/apex/pro_next');
        return p;
    } 
    
    
    
//selected Records is Deleted    
    public void del(){
       list<project__C> dellist=new  list<project__C>();
       for(project_app_wrap wr:wraplist){
           if(wr.flag==true){
               dellist.add(wr.ap); 
           }
       }
        delete dellist;
         pp=new project__c();
     	 wraplist=new list<project_app_wrap>();  
         applist=[select id,First_Name__c,Last_Name__c,Email__c,Phone__c,status__C from project__c ORDER BY First_Name__c ASC];
         for(project__c a:applist){
            project_app_wrap w=new project_app_wrap();
            w.flag=false;
            w.ap=a;
            wraplist.add(w);
        }
         
    }
     //Whene ever Creating a New Reacord in Project__c then send a Mail.
    public static void sendemail(list<project__c>prolist){
     list<Messaging.Email> sendmails=new list<Messaging.Email>();
	 list<string> eid=new list<string>();
        for(project__c pr:prolist){
            eid.add(pr.email__c);
           Messaging.singleemailmessage msg=new Messaging.singleemailmessage();
           msg.setToAddresses(eid);
           String body='Dear '+pr.First_Name__c+' '+pr.Last_Name__c+',<br/>';
                  body=body+'<b>Annual Revinue :</b><i>'+pr.Annual_revinue__C+'</i><br/>';
                  body=body+'<b>Applied Amount :</b><i>'+pr.App__c+'</i><br/>'; 
           msg.setHtmlBody(body);
           msg.setSubject('Application Details');
          sendmails.add(msg);
        }
        messaging.sendEmail(sendmails);               
    }
    
    //whenever new Applcation is created and put Assign user Then Submit for Approval that user.
    public static void approval(list<project__c> prolist){
        for(project__c p: prolist){ 
        Approval.ProcessSubmitRequest request =new Approval.ProcessSubmitRequest();
        request.setObjectId(p.Id);  
        request.setProcessDefinitionNameOrId('Project_Approval');
        User u =[select id from user where Alias='reddy' limit 1];
        request.setSubmitterId(u.Id);
        Id[] approverids =new Id[]{p.Agent__c};
        request.setNextApproverIds(approverids);
        Approval.ProcessResult result =Approval.process(request);
           }
     } 
        
    //whenever Project__C record is Aproved by Approver Then Create a new Account 
    public static void createacc(list<project__c>mylist){
        list<Account> acclist=new list<Account>();
        for(project__C c:mylist){
            if(c.status__c=='approve'){
                Account acc=new Account();
                acc.Name=c.first_name__c+' '+c.last_name__c;
                acc.Email__c=c.email__c;
                acc.id=c.Account__c;
                acclist.add(acc);
            }
        }
        insert acclist;
         List<Loan__C> myloans=new List<Loan__C>();
        for(Account acc:acclist){
            for(project__c pr:mylist){
                if(pr.loan_type__c=='education'){
                    Loan__C l=new Loan__C();
                    l.Sactioned_Amount__c=pr.Annual_revinue__c*3;
                    l.Emi__c=(pr.Annual_revinue__c*3)/48;
                    l.Due_date__c=system.today()+30;
                    l.Applied_Date__c=system.today();
                    l.Name=pr.loan_type__c;
                    l.Aplied_Ammount__c=pr.App__c;
                    l.Paid_Ammount__c=0;
                    l.balance_Amount__c=(pr.Annual_revinue__c*3)-l.Paid_Ammount__c;
                    l.Customer__c=acc.id;
                   // l.Id=pr.Loan__c;
                    myloans.add(l);
                }else{
                        if(pr.loan_type__c=='housing'){
                        Loan__C l=new Loan__C();
                        l.Sactioned_Amount__c=pr.Annual_revinue__c*10;
                        l.Emi__c=(pr.Annual_revinue__c*3)/32;
                        l.Due_date__c=system.today()+30;
                        l.Applied_Date__c=system.today();
                        l.Name=pr.loan_type__c;
                        l.Aplied_Ammount__c=pr.App__c;
                        l.Paid_Ammount__c=0;
                        l.balance_Amount__c=(pr.Annual_revinue__c*3)-l.Paid_Ammount__c;
                        l.Customer__c=acc.id;
                        //l.Id=pr.Loan__c;
                        myloans.add(l); 
                    }else{
                        Loan__C l=new Loan__C();
                        l.Sactioned_Amount__c=pr.Annual_revinue__c*5;
                        l.Emi__c=(pr.Annual_revinue__c*3)/120;
                        l.Due_date__c=system.today()+30;
                        l.Applied_Date__c=system.today();
                        l.Name=pr.loan_type__c;
                        l.Aplied_Ammount__c=pr.App__c;
                        l.Paid_Ammount__c=0;
                        l.balance_Amount__c=(pr.Annual_revinue__c*3)-l.Paid_Ammount__c;
                        l.Customer__c=acc.id;
                        //l.Id=pr.Loan__c;
                        myloans.add(l);
                    }
                }
            }
        }
        insert myloans;
    }
    //whenever new Loan is Created then Send the mail on Customer details
     public static void createloan(list<Loan__C>mylist){
          list<Messaging.Email> sendmails=new list<Messaging.Email>();
          list<Loan__c>Loanlist=[select id,customer__r.email__c,Emi__c,Sactioned_Amount__c,
                                 Aplied_Ammount__c from loan__c where Id in:mylist];
        list<string>mails=new list<string>();
        for(Loan__C ln:Loanlist){
            mails.add(ln.customer__r.email__c);
       }
        for(Loan__C ln:Loanlist){
            Messaging.singleemailmessage msg=new Messaging.singleemailmessage();
            msg.setToAddresses(mails);
            //msg.setBccAddresses(emails);
            //string body='Dear'+ln.Name+ '<br/>';
            	  // body=body+'<b>Applied Ammount :</b>'+ln.Aplied_Ammount__c+ '<br/>';
            //msg.setHtmlBody(body);
            msg.setPlainTextBody('Loan Details');
            msg.setSubject('LOAN');
            sendmails.add(msg);
            }
         messaging.sendEmail(sendmails);  
     }
    //when ever new payment is created then update laon paid ammoun as ammout and duedate as createddate+30 days.
     public static void payment(list<payment__c>plist){
         list<Id> ids=new list<Id>();
         for(payment__c pm:plist){
             ids.add(pm.loan__c);
         }
         list<loan__c>loanlist=[select id,Paid_Ammount__c,Due_date__c,Sactioned_Amount__c,Installments__c,
                                Applied_Date__c,Aplied_Ammount__c,balance_Amount__c from loan__c where id in:ids];
        for(payment__c p:plist){
            for(loan__c ln:loanlist){
                if(ln.id==p.loan__c){
            		ln.Paid_Ammount__c=ln.Paid_Ammount__c+p.Ammount__c;
            		ln.Due_date__c=ln.Due_date__c+30;
                    ln.balance_Amount__c=ln.Sactioned_Amount__c-ln.Paid_Ammount__c;
            		}
            		}
       		 }
       			 update loanlist;
    			list<Messaging.Email> sendmails=new list<Messaging.Email>();
                     list<string>email=new list<string>();
                     for(payment__c pm:plist){
                         email.add(pm.email__c);
                     }
                     for(payment__c p:plist){
                         messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
                         msg.setToAddresses(email);
                         msg.setSenderDisplayName('chandu@sfdc');
                         string body='Dear '+p.Name+'<br/>';
                         body=body+'your '+p.Ammount__c+ ' payment is Success';
                         msg.setHtmlBody(body);
                         msg.setSubject('Loan Payement');
                         sendmails.add(msg);
                     }
                     messaging.sendEmail(sendmails);
    }
}