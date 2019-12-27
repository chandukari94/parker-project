public class list_soql2 {
    public List<string> names          {set;get;}
    public List<Lead> mylist           {set;get;}
    public void mm(){
        mylist= [select id,firstname,lastname,leadsource,rating from Lead];
        names=new List<string>();
        for(Lead l: mylist){
            if(l.rating=='hot'){
                names.add(l.firstname);
                names.add(l.lastname);
            }
        }
    }
   // public void save(){
    //     names.addAll(mylist);
   // }
           
}