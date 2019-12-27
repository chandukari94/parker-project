public class list_student_4 {
  public  List<list_student> stdmarks {set;get;}
    public  list_student std          {set;get;}
    
    public list_student_4(){
        stdmarks=new List<list_student>();
        std=new list_student();
    }
       public void saveme(){
           
        stdmarks.add(std);
        std=new list_student();  
    }
}