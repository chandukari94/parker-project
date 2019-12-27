public class DML_ex1 {
    public string name           {set;get;}
    public string industry       {set;get;}
    public string rating         {set;get;}
    public string phone          {set;get;}
    
    public pageReference createpage(){
        pageReference p;
        try{
            Account acc=new Account();
            acc.name=name;
            acc.industry=industry;
            acc.rating=rating;
            acc.phone=phone;
            insert acc;
            p=new pageReference('/'+acc.Id);
        }catch(Exception e){
            Apexpages.Message msg=new apexpages.message(ApexPages.severity.ERROR,'Insertion Faild');
            apexpages.Addmessage(msg);
        }
        return p;
    }
    
}