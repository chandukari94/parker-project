trigger Account_modify_nd_create_con on Account (After insert) {
   
   // Before_update.modify(Trigger.newmap,Trigger.oldmap);
   list<processInstance> ids=[select id,status from processInstance where status='Approved'];
    list<Account> acclist=new list<Account>();
          for(processInstance p:ids){
            if(p.status=='Approve'){
                Account acc=new Account();
                acc.Name='Approval';
                acc.Rating='hot';
                acc.Industry='banking';
                acclist.add(acc);
            }
        }
        insert acclist;}