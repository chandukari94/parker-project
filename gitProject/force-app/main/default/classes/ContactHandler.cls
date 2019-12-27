public class ContactHandler {
    public static void contactphoneval(list<Contact>conlist){
        list<Account>acclist=[select id,Advance_Amount__c from Account];
        for(Contact conobj:conlist){
            for(Account accobj:acclist){
                if(accobj.Advance_Amount__c==10000){
                    if(conobj.MobilePhone==Null){
                        conobj.MobilePhone.addError('If Account Advance Ammount equal to 10000 Contact phone cannot be empty');
                    }
                } 
            }
        }
    }
    public static void updateacc(list<Contact>conlist){
        list<id>Accountids=new list<id>();
        for(contact conobj:conlist){
            if(conobj.Accountid!=Null){
                Accountids.add(conobj.Accountid);
            }
        }
        if(!Accountids.isEmpty()){
            for(Account accobj:[select id,name,(select Accountid,salary__c   from Contacts where salary__c!=Null) from Account where id In:Accountids]){
                
            }
        }
    }
}