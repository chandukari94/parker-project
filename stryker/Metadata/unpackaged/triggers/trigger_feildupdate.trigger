trigger trigger_feildupdate on Contact (after update) {
        Set<Id> contactIds =new Set<Id>();
    Map<Id,Contact> oldMap =Trigger.oldMap;
    Map<Id,Contact> newMap =Trigger.newMap;
    Set<Id> conIds =oldMap.keyset();
    for(Id key :conIds){
        Contact old =oldMap.get(key);
        Contact newAcc=newMap.get(key);
        if(old.phone!=newAcc.phone){
            contactIds.add(key);
        }
    
    list<Contact> conlist=[select id,Otherphone,phone from Contact where id in:contactIds];
    for(Contact c:conlist){
       
        //Contact dataold =oldMap.get(c.id);
        c.OtherPhone=c.phone;
    }
    update conlist;
    }
}