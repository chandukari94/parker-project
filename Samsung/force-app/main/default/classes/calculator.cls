public class calculator {
    public integer number1 {set;get;}
    public integer number2 {set;get;}
    public integer result {set;get;}


public void add(){
    result=(number1+number2);
}
    public void sub(){
    result=(number1-number2);
}
    public void mult(){
    result=(number1*number2);
}
    public void reset(){
         result=null;
        number1=null;
        number2=null;
        
}
}