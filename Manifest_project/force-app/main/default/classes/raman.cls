public class raman {
	@AuraEnabled
    public static list<account> getAcc(){
        list<account> acclist=[select id ,name,industry,rating from account];
        return acclist;
    }
    @AuraEnabled
    public static String createAcc(account acc){
        String result;
        try{
            insert acc;
            result='Success';
        }catch(exception e){
            result =e.getMessage();
        }
       return  result;
    }
}