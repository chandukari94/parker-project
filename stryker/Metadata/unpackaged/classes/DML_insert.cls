public class DML_insert {
    public Account acc         {set;get;}
	public Contact con         {set;get;}
    public Opportunity opt     {set;get;}
    public DML_insert(){
         acc=new Account();
        con=new Contact();
        opt=new Opportunity();
        } 
    public pagereference create(){
        pagereference p;
        
        try{
            insert acc;
            con.AccountId=acc.Id;
        	insert con;
        	opt.AccountId=acc.Id;
        	insert opt; 
            p=new pagereference('/'+acc.Id);
        	}catch(Exception e){
            	apexpages.message msg=new apexpages.message(apexpages.Severity.ERROR,'Insertion faild');
            	apexpages.addMessage(msg);
        	}
     return p;   
    }
    
}