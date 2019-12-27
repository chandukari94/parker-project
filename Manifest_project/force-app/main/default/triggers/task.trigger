trigger task on Task (before insert) {
    List<task> mytasks=trigger.new;
    for(task t:mytasks){
        if(t.Disposition__c=='Value-1'){
            t.Status='In Progress';
        }  else
        {
           t.Status='Completed'; 
        }
    }
}