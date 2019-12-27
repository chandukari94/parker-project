public class DML_delete {
	public List<SelectOption> options {set;get;}
    public String selected			  {set;get;}
    public List<Account> accounts 	  {set;get;}
    public DML_delete(){
        // 1. Fetch all the account records 
        accounts  =[select Name,Phone,Industry,Rating from Account];
        // 2. Create a List of Date Literals
        List<String> myList =new List<String>{'TODAY','THIS_WEEK','LAST_WEEK','NEXT_WEEK'};
        options =new List<SelectOption>();
        SelectOption op=new SelectOption('none','-None-');
        options.add(op);
        // take one by one data literal create as picklist option
        for(String s:myList){
            selectOption p=new SelectOption(s,s);
            options.add(p);
        }
    }
    public void fetchData(){
        String query ='select id from Account where createdDate='+selected;
        List<Account> myList =Database.query(query);
        delete myList;
        accounts =[select Name,Phone,Industry,Rating from Account];
    }
}