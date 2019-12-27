public class Dml_practice_1 {
    public string name    {set;get;}
    public string rating  {set;get;}
    
    public pageReference data(){
        pageReference p;
        try{
            Account a=new Account();
            a.Name=name;
            a.Rating=rating;
            insert a;
            p= new pageReference('/'+a.Id);
        }catch(Exception e){
            Apexpages.Message msg=new apexpages.message(ApexPages.severity.ERROR,'Insertion Faild');
            Apexpages.addMessage(msg);
        }
        return p;
    }
         Account acc=[select id from Account where name='siva'];
}