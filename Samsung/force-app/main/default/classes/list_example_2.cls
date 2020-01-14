public class list_example_2 {
        public string name       {set;get;}
        public integer age       {set;get;}
        public decimal salary    {set;get;}
    public List<employee> emplist  {set;get;}
    public employee emp      {set;get;}
    public list_example_2(){
        
       emplist= new List<employee>();
       emp=new employee();
        
    }
    
    public void saveme(){
        emplist.add(emp);
        emp=new employee();
        
    }
    
}