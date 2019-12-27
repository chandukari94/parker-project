public class list_soql_list {
    public list<string> leadnames                 {set;get;}
    
    public list<Lead> data                      {set;get;} 
    public void save(){
        data= [select firstname,lastname,rating,industry from Lead];
        leadnames=new  list<string>();
        for(Lead l: data){
            if(l.industry=='banking'){
              leadnames.add(l.firstname) ; 
                leadnames.add(l.lastname) ;
            }
        }
    }

    
}