public class picklist {
    public list<selectoption> options         {set;get;}
    public list<selectoption> accnames          {set;get;}
    public string selected                    {set;get;}
    
    public picklist(){
        options=new list<selectoption>();
        selectoption op=new selectoption('none','-None-');
        options.add(op);
        list<string> languages=new list<string>{'telugu','hindi','english','tamil','malayalam','kannada'};
            for(string s: languages){
                 selectoption p=new selectoption(s,s);
                options.add(p); 
            }
           
        
         accNames =new List<SelectOption>();
        List<Account> accounts =[select Id,Name,Industry from Account];
        for(Account a: accounts){
            SelectOption p=new SelectOption(''+a.industry,a.name);
            accNames.add(p);
    } 
    }
}