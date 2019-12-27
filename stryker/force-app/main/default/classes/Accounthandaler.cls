public class Accounthandaler {
    
    public static void Typevalidations(list<Account>acclist){
        for(Account accobj:acclist){
            if(accobj.Type==Null){
                accobj.Type.addError('Type cannot be Empty');
            }
        }
    }
    
    public static void Advanceamountval(list<Account>acclist){
        for(Account accobj:acclist){
            if(accobj.Advance_Amount__c<10000){
                accobj.Advance_Amount__c.addError('Advance Amount cannot be less than 10000');
            }
        }
    }
    
    public static void ratingupdatetval(list<Account>acclist){
        for(Account accobj:acclist){
            if(accobj.Industry=='Banking'){
                if(accobj.Rating=='Hot'){
                  accobj.Rating.addError('If Rating as Banking can not be rating as hot');
                }
            }
        }
    }
    
     
}