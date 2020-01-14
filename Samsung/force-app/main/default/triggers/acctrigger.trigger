trigger acctrigger on Account (after update) {
    if(Trigger.isupdate && Trigger.isafter){
        set<Id> setAccount = new set<Id>();
        for(Account objAcc: Trigger.New){
            setAccount.add(objAcc.Id); 
        }    
        if(!setAccount.isEmpty()){
            list<contact> lstCon = new list<contact> ();
            for(Account acc: [select id,(select id,Phone,Otherphone from Contacts) 
                              from Account where id In:setAccount]){
                                  if(acc.Contacts!= NULL){
                                      for(contact con:acc.Contacts){
                                          con.phone = '909090902';
                                          lstCon.add(con);
                                      }
                                  }            
                              }
            if(!lstCon.isEmpty()){
                update lstCon;
            }
        }       
    }
}