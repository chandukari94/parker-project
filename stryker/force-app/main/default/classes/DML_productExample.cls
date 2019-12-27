public class DML_productExample {
	
    public Account acc                          {set;get;} 
    public Contact con                          {set;get;}
    public List<ProductList> products           {set;get;}
    public DML_productExample(){
      
        acc =new Account();
        con=new Contact();
       
        products =new List<ProductList>();
        for(Integer i=1;i<=3;i++){
            ProductList p1 =new ProductList();
            products.add(p1);
        }
    }
    public void create(){
        SavePoint sp =Database.setSavePoint();
        try{
             insert acc;
             con.accountId=acc.Id;
             insert con;     
             Opportunity op=new Opportunity();
             op.name=acc.Name+'-';
             op.StageName='Prospecting';
             op.closeDate=System.today()+15;
             op.AccountId=acc.Id;
             insert op;

            Set<String> prodNames =new Set<String>();
            for(ProductList p:products){
                    prodNames.add(p.name);
             }
             List<Product2> prods =[select Id,Name from Product2 where name in:prodNames];
             
             Map<String,Id> prodMap =new Map<String,Id>();
            
                for(Product2 p2 :prods){
                    prodMap.put(p2.name,p2.Id);
                }
            
              List<Id> productIds =prodMap.values();
              List<PriceBookEntry> entries =[select id,product2Id from PriceBookEntry where Product2id in:productIds];
            
               Map<Id,Id> entryMap =new Map<Id,Id>();
            
                for(PriceBookEntry pe :entries){
                    entryMap.put(pe.product2Id,pe.Id);
                }
            List<OpportunityLineItem> myList =new List<OpportunityLineItem>();
            for(ProductList p1 :products){
                Id prodId =prodMap.get(p1.name);
                Id entryid =entryMap.get(prodId);
                OpportunityLineItem newOp =new OpportunityLineItem();
                newOp.PriceBookEntryId=entryId;
                newOp.quantity=p1.quant;
                newOp.opportunityId=op.Id;
                newOp.UnitPrice=10000;
                
                myList.add(newOp);
            }
            insert myList;
        }catch(Exception e){
            Database.rollback(sp); 
        }
    }
    
}