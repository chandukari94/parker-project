trigger oppt on Opportunity (before insert) {
    for(opportunity op: trigger.new){
        if(op.StageName=='Closed Won'){
            op.CloseDate=system.today()+5;
        }
            else{
                op.CloseDate=system.today();
            }
        }
    }