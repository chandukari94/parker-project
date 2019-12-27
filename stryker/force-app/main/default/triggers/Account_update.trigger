trigger Account_update on Account (after update) {
    Set<Id> accountIds =new Set<Id>();
    Map<Id,Account> oldMap =Trigger.oldMap;
    Map<Id,Account> newMap =Trigger.newMap;
    Set<Id> accIds =oldMap.keyset();
    for(Id key :accIds){
        Account old =oldMap.get(key);
        Account newAcc=newMap.get(key);
        if(old.phone!=newAcc.phone){
            accountIds.add(key);
        }
    }
    list<Contact> conlist=[select id,AccountId,Otherphone,phone from Contact where AccountId in:accountIds];
    for(Contact c:conlist){
        id key=c.AccountId;
        Account old =oldMap.get(key);
        c.Phone=old.phone;
    }
    update conlist;
    }
      // list<Account>acclist=[select id,phone,Other_Phone__c from Account where id in:accountIds];
         // for(Account a:acclist){
          //    Account old=oldmap.get(a.id);
           //   old.Other_Phone__c=a.phone;
            // }
   //update acclist;
    
//}