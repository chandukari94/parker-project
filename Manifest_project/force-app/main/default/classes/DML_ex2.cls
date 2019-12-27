public class DML_ex2 {
	public Account acc {set;get;}
    public Contact con {set;get;}
    public DML_ex2(){
        acc =new Account();
        con =new Contact();
    }
    public PageReference create(){
        PageReference p;
        try{
            insert acc;
            con.AccountId=acc.Id;
            insert con;
            p=new PageReference('/'+acc.Id);
            
        }catch(Exception e){
           Apexpages.Message msg =new Apexpages.Message(Apexpages.Severity.ERROR,'Insert Failed');
           Apexpages.addMessage(msg);
        }
        return p;
    }
}