public class employee_example {
    public integer num1 {set;get;}
    public integer num2 {set;get;}
    public integer result {set;get;}
    
    public void add(){
        result=num1+num2;
    }
    public void cancel(){
       num1=null;
       num2=null;
       result=null;  
       
    }
    public void multiply(){
        result=num1*num2;
    }
    public void subtraction(){
        result=num1-num2;
    }
}