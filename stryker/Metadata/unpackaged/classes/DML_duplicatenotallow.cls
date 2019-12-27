public class DML_duplicatenotallow {
    public Account acc            {set;get;}
    public DML_duplicatenotallow(){
        acc=new Account();
    }
    public pageReference duplicate(){
        pageReference p;
        integer count=[select count() from Account where name=:acc.name and phone=:acc.phone ];
        if(count> 0){
            apexpages.message msg=new apexpages.message(apexpages.Severity.ERROR,'Duplicate values are not exist');
            apexpages.addMessage(msg);
        }else{
            insert acc;
            p= new pageReference('/'+acc.Id);
        }
        return p;
    }
}