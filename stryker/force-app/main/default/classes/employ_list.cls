public class employ_list {
   public list<employdata> emplist       {set;get;}
  public  employdata emp             {set;get;}
    
    public employ_list(){
        emplist=new list<employdata>();
        emp=new employdata();
    } 
    
    public void addme(){
        emplist.add(emp);
         emp=new employdata();
    }
}