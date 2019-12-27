public class pagenation {

    public Apexpages.StandardSetController controller {set;get;}
    public Integer total   {set;get;}
    public Integer pages   {set;get;}
    public List<Opportunity> getOptyList(){
        List<Opportunity> opty=(List<Opportunity>)controller.getRecords();
        return opty;
    }
    public pagenation(){
        List<Opportunity> optyList =[select id,Name,stageName,closeDate,Amount from Opportunity];
        controller =new Apexpages.StandardSetController(optyList);
        controller.setPageSize(5);
        total=controller.getResultSize();
        Integer x=Math.mod(total,5);
        pages =total/5;          
        if(x>0){
            pages =pages+1;
        }
    }
}