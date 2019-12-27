public class SOQL_dynamic {
	public List<String> selected			{set;get;}
    public List<SelectOption> options 		{set;get;}
    public List<Account> accounts			{set;get;}
    public String query						{set;get;}
    public SOQL_dynamic(){
        selected =new List<String>();
        options =new List<SelectOption>();
        List<String> fields =new List<String>{'Name','Phone','Industry','Rating','Active__c','Type','OwnerShip'};
        for(String s:fields){
        	SelectOption op =new SelectOption(s,s);
            options.add(op);
        }
    }
    public void callMe(){
     query ='select Id';
        // selected contains list of fields which have selected
        for(String s:selected){
            query =query +','+s;        
        }
        query=query+' from Account';
        System.debug(query);
        accounts =Database.query(query);
    }
}