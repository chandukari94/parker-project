public class soql_ex_2 {
    public list<selectoption> myoptions           {set;get;}
    public string selected                       {set;get;}
   public list<Account> accounts                       {set;get;}
    public soql_ex_2(){
        list<string> mylist=new list<string>{'hot','warm','cool','Banking','Education','Finance','ad','ky'};
            myoptions=new list<selectoption>();
        selectoption op1=new selectoption('none','-None-');
        myoptions.add(op1);
        for(string s:mylist){
            selectoption op2=new selectoption(s,s);
            myoptions.add(op2);
        }
    
    accounts = [select name,phone,industry,rating from Account];
    }
    public void rate(){
      accounts=[select name,industry,rating,phone from Account  where name like'%:selected'];
      /**  if(selected=='none'){
           
          accounts=[select name,industry,rating,phone from Account  where name like'%:selected'];
       }else
       {
       accounts=[select name,rating,phone,industry from Account where rating=:selected OR industry=:selected];
   }**/
    }
                 
}