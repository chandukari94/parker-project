trigger acc_trig on Account (After insert,after update,before delete) {
    if(trigger.isinsert && trigger.isAfter){
        Acc_trig.createopt(trigger.new);
    }
    if(trigger.isupdate && trigger.isafter){
        Acc_trig.Recordshare(trigger.oldmap,trigger.newmap);
    }
    if(trigger.isdelete && trigger.isbefore){
        Acc_trig.delRecord(trigger.old);
    }
}